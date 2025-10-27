from ..entities import Customer

class CustomerRepository:
    def get_customer_by_id(self, customer_id: int) -> Customer | None: ...

    def get_list_customers(self, limit: int, offset: int) ->list[Customer]: ...
    