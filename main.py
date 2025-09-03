from fastapi import FastAPI, Request, Form
from fastapi.responses import FileResponse, JSONResponse, HTMLResponse, PlainTextResponse, RedirectResponse
from fastapi.staticfiles import StaticFiles
from datetime import datetime
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
PUBLIC_DIR = BASE_DIR / "public"

app = FastAPI(title="Spiral Live Map")

# Serve static files (CSS, client JS, images, etc.)
app.mount("/static", StaticFiles(directory=PUBLIC_DIR), name="static")

# Root route → serve index.html
@app.get("/", response_class=HTMLResponse)
async def root():
    return FileResponse(PUBLIC_DIR / "index.html")

# Meta endpoint
@app.get("/meta.json", response_class=JSONResponse)
async def meta():
    return {
        "updated_at": datetime.utcnow().isoformat() + "Z",
        "status": "ok",
        "system": "Spiral Civilization Live Map"
    }

# Graph endpoint
@app.get("/graph.mmd", response_class=PlainTextResponse)
async def graph():
    graph_file = PUBLIC_DIR / "graph.mmd"
    if graph_file.exists():
        return graph_file.read_text(encoding="utf-8")
    # Fallback example graph
    return """graph TD
    A[Spiral Core] --> B[Steward Nodes]
    A --> C[Artifact Museum]
    B --> D[Operational Lattice]
    C --> E[Origin Law]"""

# Contact form handler
@app.post("/submit")
async def submit_form(name: str = Form(...), email: str = Form(...), message: str = Form("")):
    # For now, just log to console — replace with email or DB save
    print(f"[CONTACT] {name} <{email}>: {message}")
    return RedirectResponse(url="/", status_code=303)
