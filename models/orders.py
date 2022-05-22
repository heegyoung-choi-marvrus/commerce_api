from tortoise import Model
from tortoise import fields

from common.order_enums import OrderStatus


class Order(Model):
    order_id = fields.BigIntField(pk=True)
    user_id = fields.BigIntField(index=True)
    user_email = fields.CharField(max_length=30)
    user_name = fields.CharField(max_length=20)
    user_phone = fields.CharField(max_length=15)
    receiver_name = fields.CharField(max_length=20)
    receiver_address = fields.CharField(max_length=100)
    receiver_phone = fields.CharField(max_length=15)
    delivery_memo = fields.TextField()
    total_price = fields.DecimalField(max_digits=7, decimal_places=2)
    discount_price = fields.DecimalField(max_digits=7, decimal_places=2)
    deal_order_status = fields.CharEnumField(OrderStatus)
    created_at = fields.DatetimeField(index=True, auto_now_add=True)
    modified_at = fields.DatetimeField(auto_now=True)

    class Meta:
        table = "order"
        indexes = (("user_id", "created_at"),)


class OrderDealDetail(Model):
    id = fields.BigIntField(pk=True)
    order_id = fields.BigIntField(index=True)
    deal_id = fields.BigIntField()
    deal_name = fields.CharField(max_length=100)
    total_price = fields.DecimalField(max_digits=7, decimal_places=2)
    discount_price = fields.DecimalField(max_digits=6, decimal_places=2)
    deal_order_status = fields.CharEnumField(OrderStatus)
    created_at = fields.DatetimeField(auto_now_add=True)
    modified_at = fields.DatetimeField(auto_now=True)

    class Meta:
        table = "order_deal_detail"


class OrderDealOptionDetail(Model):
    id = fields.BigIntField(pk=True)
    order_id = fields.BigIntField(index=True)
    deal_id = fields.BigIntField()
    option_id = fields.BigIntField()
    option_name = fields.CharField(max_length=100)
    option_quantity = fields.IntField()
    option_unit_price = fields.DecimalField(max_digits=7, decimal_places=2)
    total_price = fields.DecimalField(max_digits=7, decimal_places=2)
    option_order_status = fields.CharEnumField(OrderStatus)
    created_at = fields.DatetimeField(auto_now_add=True)
    modified_at = fields.DatetimeField(auto_now=True)

    class Meta:
        table = "order_deal_option_detail"
