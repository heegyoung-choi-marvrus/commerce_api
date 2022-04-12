from pydantic import BaseModel


class OrderCreateRequest(BaseModel):
    order_id: int
    user_id: int
    address: str
    total_price: int