from enum import Enum


class OrderStatus(str, Enum):
    COMPLETED = "COMPLETED"
    CANCELLED = "CANCELLED"
    PARTIAL_CANCELLED = "PARTIAL_CANCELLED"
