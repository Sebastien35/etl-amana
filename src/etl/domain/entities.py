import pydantic as pyd

class Customer(pyd.BaseModel):
    id: int = pyd.Field(default=0)
    name: str = pyd.Field(default="")
    email: str = pyd.Field(default="")
    age: int = pyd.Field(default=0)
