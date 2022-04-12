from fastapi import APIRouter

from validation.order_validation import OrderCreateRequest

router = APIRouter()


@router.post("/order", tags=["order"], response_model=OrderCreateRequest)
async def create_new_order(order: OrderCreateRequest):
    return order


@router.get("/order/{order_id}", tags=["order"])
async def get_order_by_id(order_id):
    return {"order_id": order_id}