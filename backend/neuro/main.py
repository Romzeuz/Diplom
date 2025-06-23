from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from transformers import pipeline

app = FastAPI()

# Загружаем модель zero-shot классификации
classifier = pipeline("zero-shot-classification", model="joeddav/xlm-roberta-large-xnli")

# Предопределённый список тегов (можно загрузить из файла)
CANDIDATE_TAGS = ["экономика", "инфляция", "программирование", "спорт", "финансы", "технологии"]

# Модель данных запроса
class TextInput(BaseModel):
    text: str
    command: str = "classify"  # по умолчанию
    available_tags: list = CANDIDATE_TAGS
    request_id: str = None

class TextOutput(BaseModel):
    text: str
    top_tags: list
    request_id: str = None

@app.post("/classify")
async def classify_text(req: TextInput) -> TextOutput | dict:
    if req.command != "classify":
        raise HTTPException(status_code=400, detail="Unknown command")

    result = classifier(req.text, req.available_tags, multi_label=True)
    top3 = sorted(zip(result["labels"], result["scores"]), key=lambda x: x[1], reverse=True)[:3]
    tags = [tag for tag, score in top3]

    return {
        "text": req.text,
        "top_tags": tags,
        "request_id": req.request_id
    }
