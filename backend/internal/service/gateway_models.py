from typing import Dict, Any

from pydantic import BaseModel, Field


class LinkRequest(BaseModel):
    text: str = Field(title="Текст", description="Текст, на который создаётся гиперссылка")
    start_index: int = Field(title="Начальный индекс",
                             description="Начальный индекс текста, на который создаётся гиперссылка, в MD файле")
    end_index: int = Field(title="Конечный индекс")
    book_id: int = Field(title="ID книги", description="ID книги, к которой относится гиперссылка")


class LinkResponse(BaseModel):
    text: str = Field(title="Текст", description="Текст ссылки")
    link: str = Field(title="Ссылка")


class StrapiHookModel(BaseModel):
    event: str = Field(title="Событие", description="Событие, которое вызвало хук")
    createdAt: str = Field(title="Дата создания",
                           description="Дата создания события",
                           examples=["2020-01-10"])
    model: str = Field(title="Модель", description="Модель, к которой относится событие", examples=["text"])
    entry: Dict[str, Any] = Field(title="Запись")
