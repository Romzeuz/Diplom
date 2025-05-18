from typing import Annotated

from fastapi import FastAPI, Body
from fastapi.middleware.cors import CORSMiddleware
from pydantic import Field, BaseModel

from gateway_models import LinkRequest, LinkResponse

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


@app.post("/api/links")
def handle_links_request(link: Annotated[LinkRequest, Body(embed=True)]) -> LinkResponse:
    print(link.json())
    return LinkResponse(text=link.text, link="Крутая книга - Райбекас - страница 54")
