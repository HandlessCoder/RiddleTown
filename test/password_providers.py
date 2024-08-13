import random
import string
from faker import Faker
from faker.providers import BaseProvider

fake = Faker()

class PasswordProvider(BaseProvider):
   
    def create_password(longitud):
        charactersAll = string.ascii_letters + string.digits + string.punctuation
        password = ""
        for _ in charactersAll:
            password += random.choice(charactersAll)
        return password

    new_pass = create_password(1)
    print(new_pass)