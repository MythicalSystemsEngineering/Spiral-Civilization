import requests

API_URL = "https://api-inference.huggingface.co/pipeline/feature-extraction/sentence-transformers/all-MiniLM-L6-v2"
headers = {"Authorization": "Bearer YOUR_TOKEN_HERE"}

def embed(text):
    response = requests.post(API_URL, headers=headers, json={"inputs": text})
    vector = response.json()[0]
    print(vector)

# Example usage
embed("Every breach becomes precedent.")
