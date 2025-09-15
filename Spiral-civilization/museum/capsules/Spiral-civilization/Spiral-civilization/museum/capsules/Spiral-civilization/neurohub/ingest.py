import os, requests, xml.etree.ElementTree as ET
from PyPDF2 import PdfReader

# Ensure directories exist
os.makedirs('data/papers', exist_ok=True)
os.makedirs('data/summaries', exist_ok=True)

# Config
ARXIV_API = 'http://export.arxiv.org/api/query?search_query=cat:q-bio.NC&max_results=3'

def fetch_papers():
    print("📥 Fetching papers from arXiv...")
    resp = requests.get(ARXIV_API)
    root = ET.fromstring(resp.text)
    for entry in root.findall('{http://www.w3.org/2005/Atom}entry'):
        pdf_url = entry.find('{http://www.w3.org/2005/Atom}link[@type="application/pdf"]').attrib['href']
        title = entry.find('{http://www.w3.org/2005/Atom}title').text.strip().replace(' ', '_')[:50]
        filename = f"{title}.pdf"
        path = os.path.join('data/papers', filename)
        if not os.path.exists(path):
            with open(path, 'wb') as f:
                f.write(requests.get(pdf_url).content)
            print(f"✅ Saved: {filename}")

def simple_summarize(text):
    lines = text.strip().split('\n')
    summary = ' '.join(lines[:3])[:300]
    return summary or "Summary unavailable."

def summarize_papers():
    print("🧠 Summarizing papers...")
    for fname in os.listdir('data/papers'):
        if not fname.endswith('.pdf'): continue
        pdf = PdfReader(os.path.join('data/papers', fname))
        text = ''
        for page in pdf.pages[:3]:
            text += page.extract_text() or ''
        summary = simple_summarize(text)
        meta = {
            'title': fname.replace('.pdf',''),
            'tags': [],
            'summary': summary
        }
        out = os.path.join('data/summaries', fname.replace('.pdf','.yaml'))
        with open(out, 'w') as f:
            f.write('---\n')
            for k,v in meta.items():
                f.write(f"{k}: {v}\n")
        print(f"✅ Summarized: {fname}")

# Run the cycle
fetch_papers()
summarize_papers()
print("🎉 Ingestion complete. Summaries in data/summaries/")
