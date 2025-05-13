from typing import Annotated

from fastapi import FastAPI, Body
from fastapi.middleware.cors import CORSMiddleware
from pydantic import Field, BaseModel

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


# backend/internal/service/gateway_models.py
class LinkRequest(BaseModel):
    text: str = Field(title="Текст", description="Текст, на который создаётся гиперссылка")
    start_index: int = Field(title="Начальный индекс",
                             description="Начальный индекс текста, на который создаётся гиперссылка, в MD файле")
    end_index: int = Field(title="Конечный индекс")
    book_id: int = Field(title="ID книги", description="ID книги, к которой относится гиперссылка")

# backend/internal/service/router.py
@app.post("/links")
def handle_links_request(link: Annotated[LinkRequest, Body(embed=True)]):
	# получение модели