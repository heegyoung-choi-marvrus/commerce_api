from fastapi import FastAPI

from routers import order_router

app = FastAPI()
app.include_router(order_router.router)
