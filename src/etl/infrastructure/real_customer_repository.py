from .db_connector import DBConnector
from ..domain.interfaces.customer_repository import CustomerRepository
from ..domain.entities import Customer

class RealCustomerRepository(CustomerRepository):
    def __init__(self, db_connector: DBConnector):
        self.db_connector = db_connector

    def get_list_customers(self, limit: int, offset: int) -> list[Customer]:
        query = "SELECT id, name, email, age FROM customers LIMIT %s OFFSET %s"
        rows = self.db_connector.execute_query(query, (limit, offset), fetch="all")
        return [Customer(**row) for row in rows]

    def get_customer_by_id(self, customer_id: int) -> Customer | None:
        query = "SELECT id, name, email, age FROM customers WHERE id = %s"
        row = self.db_connector.execute_query(query, (customer_id,), fetch="one")
        return Customer(**row) if row else None
