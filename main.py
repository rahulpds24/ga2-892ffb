from fastapi import fastapi

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Hello from deployment-ready-ga2-892ffb"}