#!/usr/bin/env python3
import os
import json
import requests
from urllib.parse import quote
from tika import parser

# Configuration
DOI_LIST = [
    "10.1109/TAFFC.2019.2915346",
    "10.1145/3368189.3409733",
    # … add more DOIs/arXiv IDs here …
]
OUTPUT_DIR = "data/papers"
RAW_DIR    = os.path.join(OUTPUT_DIR, "raw")
META_DIR   = os.path.join(OUTPUT_DIR, "meta")
PARSED_DIR = os.path.join(OUTPUT_DIR, "parsed")
CROSSREF_API = "https://api.crossref.org/works/"

# Ensure directories exist
for path in [RAW_DIR, META_DIR, PARSED_DIR]:
    os.makedirs(path, exist_ok=True)

def fetch_metadata(doi):
    url = CROSSREF_API + quote(doi)
    resp = requests.get(url, headers={"Accept": "application/json"})
    resp.raise_for_status()
    return resp.json()["message"]

def download_pdf(pdf_url, out_path):
    resp = requests.get(pdf_url, stream=True)
    resp.raise_for_status()
    with open(out_path, "wb") as f:
        for chunk in resp.iter_content(1024):
            f.write(chunk)

def extract_text(pdf_path):
    parsed = parser.from_file(pdf_path)
    return parsed.get("content", "")

def find_pdf_link(metadata):
    # Attempt common PDF locations
    links = metadata.get("link", [])
    for link in links:
        if link.get("content-type") == "application/pdf":
            return link["URL"]
    return None

def main():
    manifest = []
    for doi in DOI_LIST:
        try:
            meta = fetch_metadata(doi)
            out_meta = os.path.join(META_DIR, f"{doi.replace('/', '_')}.json")
            with open(out_meta, "w") as f:
                json.dump(meta, f, indent=2)

            pdf_url = find_pdf_link(meta)
            if not pdf_url:
                print(f"[WARN] No PDF link for {doi}, skipping.")
                continue

            raw_pdf = os.path.join(RAW_DIR, f"{doi.replace('/', '_')}.pdf")
            download_pdf(pdf_url, raw_pdf)

            text = extract_text(raw_pdf)
            parsed_entry = {
                "doi": doi,
                "title": meta.get("title", [""])[0],
                "parsed_text": text[:250000]  # trim if too large
            }
            out_parsed = os.path.join(PARSED_DIR, f"{doi.replace('/', '_')}.jsonl")
            with open(out_parsed, "w") as f:
                json.dump(parsed_entry, f)
            
            manifest.append({"doi": doi, "status": "success"})
            print(f"[OK] Ingested {doi}")
        
        except Exception as e:
            manifest.append({"doi": doi, "status": "error", "error": str(e)})
            print(f"[ERROR] {doi}: {e}")

    # Write manifest
    with open(os.path.join(OUTPUT_DIR, "manifest.json"), "w") as f:
        json.dump(manifest, f, indent=2)

if __name__ == "__main__":
    main()
