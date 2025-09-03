import json
import os
import yaml
from pathlib import Path
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse, JSONResponse
from fastapi.staticfiles import StaticFiles

# Resolve repo root and live paths
REPO_ROOT = Path(os.environ.get("REPO_ROOT", ".")).resolve()
LIVE = REPO_ROOT / "live"
DATA = LIVE / "data"
PUBLIC = LIVE / "public"
CONFIG = LIVE / "config.yaml"
STATE = DATA / "state.json"

from fastapi import FastAPI
from fastapi.responses import Response, JSONResponse
from fastapi.staticfiles import StaticFiles
from pathlib import Path
import datetime

app = FastAPI()

REPO_ROOT = Path(__file__).resolve().parent.parent

@app.get("/graph.mmd")
def get_graph():
    path = REPO_ROOT / "graph.mmd"
    if not path.exists():
        return Response("graph.mmd not found", status_code=404, media_type="text/plain")
    content = path.read_text(encoding="utf-8")
    return Response(content, media_type="text/plain")

app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/graph.mmd")
def get_graph():
    path = REPO_ROOT / "graph.mmd"
    if not path.exists():
        raise RuntimeError(f"File at path {path} does not exist.")
    return FileResponse(path, media_type="text/plain")

@app.get("/meta.json")
def get_meta():
    return JSONResponse({
        "updated_at": datetime.datetime.utcnow().isoformat() + "Z",
        "stewards": 7  # Replace with live count logic
    })

# Serve static dashboard files from /public
app.mount("/", StaticFiles(directory=PUBLIC, html=True), name="static")

def load_cfg():
    """Load engine/link config from YAML."""
    if CONFIG.exists():
        return yaml.safe_load(CONFIG.read_text())
    return {"engines": [], "links": []}

def mermaid_from_state(state, cfg):
    """Build Mermaid graph text from state + config."""
    nodes = []
    edges = []
    # Nodes
    for eng in cfg.get("engines", []):
        e = eng["id"]
        label = eng.get("label", e)
        meta = state.get("engines", {}).get(e, {})
        seen = meta.get("last_seen", "—")
        nodes.append(f'{e}["{label}\\nlast_seen: {seen}"]')
    # Edges
    for link in cfg.get("links", []):
        a, b = link["from"], link["to"]
        label = link.get("label", "")
        edges.append(f"{a} -->|{label}| {b}")
    body = ";\n  ".join(nodes + edges) + ";"
    return "graph TD;\n  " + body

@app.get("/graph.mmd", response_class=PlainTextResponse)
def graph():
    """Return live Mermaid graph."""
    state = json.loads(STATE.read_text())
    cfg = load_cfg()
    return mermaid_from_state(state, cfg)

@app.get("/meta.json", response_class=JSONResponse)
def meta():
    """Return meta info for dashboard."""
    state = json.loads(STATE.read_text())
    return {
        "updated_at": state.get("updated_at"),
        "engine_count": len(state.get("engines", {}))
    }
