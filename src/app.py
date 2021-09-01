from fastapi import FastAPI

api = FastAPI(
    title="Example Project",
    description="Template project for developing FastAPI project",
    version="0.0.1"
)


@api.get("/items")
async def read_items():
    return {"items": ["item1", "item2"]}


@api.get("/items/{item_id}")
async def read_item(item_id):
    return {"item_id": item_id}
