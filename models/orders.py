from tortoise import Model
from tortoise import fields


class Order(Model):
    order_id = fields.BigIntField(pk=True)
    address = fields.CharField(max_length=100)