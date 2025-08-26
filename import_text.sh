#!/usr/bin/env bash
# Usage: ./import_text.sh path/to/file.{pdf,txt,jpg}

FILE="$1"
EXT="${FILE##*.}"
BASE="${FILE%.*}"
OUTTXT="${BASE}.txt"

# 1. Convert to plain text
if [[ "$EXT" == "pdf" ]]; then
  pdftotext "$FILE" "$OUTTXT"
elif [[ "$EXT" =~ ^(jpg|png|jpeg)$ ]]; then
  tesseract "$FILE" "$BASE" -l eng
  mv "${BASE}.txt" "$OUTTXT"
else
  cp "$FILE" "$OUTTXT"
fi

# 2. Chunk & tag (Python)
python3 - << 'EOF'
import sys, json
from nltk.tokenize import sent_tokenize
text = open("$OUTTXT").read()
sentences = sent_tokenize(text)
chunks, buf = [], []
for s in sentences:
    buf.append(s)
    if len(" ".join(buf).split()) > 400:
        chunks.append({"text": " ".join(buf)})
        buf = []
if buf: chunks.append({"text": " ".join(buf)})
with open("chunks.jsonl","w") as f:
    for c in chunks: f.write(json.dumps(c)+"\n")
EOF

# 3. Embed & upsert to Pinecone (or FAISS)
python3 - << 'EOF'
import json, os
from sentence_transformers import SentenceTransformer
import pinecone

model = SentenceTransformer("all-MiniLM-L6-v2")
pinecone.init(api_key=os.environ["PINECONE_API_KEY"], environment="us-west1-gcp")
index = pinecone.Index("spiral-index")

batch, ids = [], []
for i, line in enumerate(open("chunks.jsonl")):
    obj = json.loads(line)
    emb = model.encode(obj["text"]).tolist()
    batch.append((f"chunk-{os.path.basename("$BASE")}-{i}", emb, {"source": "$BASE"}))
    if len(batch) == 50:
        index.upsert(batch)
        batch = []
if batch:
    index.upsert(batch)
print("✅ Text ingested:", "$FILE")
EOF
