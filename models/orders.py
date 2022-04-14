from tortoise import Model
from tortoise import fields

from common.order_enums import OrderStatus


class Order(Model):
    id = fields.BigIntField(pk=True)
    user_id = fields.BigIntField(index=True)
    user_email = fields.CharField(max_length=30)
    receiver_name = fields.CharField(max_length=20)
    receiver_name = fields.CharField(max_length=20)
    receiver_address = fields.CharField(max_length=100)
    receiver_phone = fields.CharField(max_length=15)
    delivery_memo = fields.TextField()
    total_price = fields.DecimalField(max_digits=7, decimal_places=2)
    discount_price = fields.DecimalField(max_digits=6, decimal_places=2)
    discount_price = fields.DecimalField(max_digits=7, decimal_places=2)
    deal_order_status = fields.CharEnumField(OrderStatus)


class OrderDealDetail(Model):
    id = fields.BigIntField(pk=True)
    order_id = fields.BigIntField(index=True)
    user_id = fields.BigIntField(index=True)
    deal_id = fields.BigIntField()
    deal_name = fields.CharField(max_length=100)
    total_price = fields.DecimalField(max_digits=7, decimal_places=2)
    discount_price = fields.DecimalField(max_digits=6, decimal_places=2)
    deal_order_status = fields.CharEnumField(OrderStatus)
