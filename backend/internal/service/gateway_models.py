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


class LinkStrapiHookModel(BaseModel):
