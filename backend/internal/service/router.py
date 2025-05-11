from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/somfkams")
async def somfkams():
    return {"message": "Hello World1234"}


@app.post("/api/something")
async def handle_something():
    # Здесь вы можете обработать POST-запрос
    return {"message": "POST request received"}
