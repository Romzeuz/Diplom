from typing import Annotated

from fastapi import FastAPI, Body
from fastapi.middleware.cors import CORSMiddleware
from pydantic import Field, BaseModel

from internal.service.gateway_models import LinkRequest, LinkResponse, StrapiHookModel

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


@app.post("/api/links")
def handle_links_request(link: Annotated[LinkRequest, Body(embed=True)]) -> LinkResponse:
    print(link.json())
    return LinkResponse(text=link.text, link="Крутая книга - Райбекас - страница 54")


@app.post("/hooks/strapi")
def handle_strapi_hook(hook: StrapiHookModel):
    print(hook.model_dump_json())
    # Здесь можно добавить логику обработки хука
    return {"status": "success", "message": "Hook processed successfully"}
