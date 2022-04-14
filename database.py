TORTOISE_ORM = {
    "connections": {"default": "mysql://commerce:commerce@172.27.0.3:3306/commerce"},
    "apps": {
        "contact": {
            "models": [
                "aerich.models",
                "models.orders",
            ],
            "default_connection": "default",
        },
    },
}
