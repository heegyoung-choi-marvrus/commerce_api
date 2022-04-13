from fastapi import FastAPI

from routers import order_router

app = FastAPI()
app.include_router(order_router.router)

# @app.get("/hello/{name}")
# async def say_hello(name: str):
#     return {"message": f"Hello {name}"}
