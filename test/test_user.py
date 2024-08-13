import pytest 
import random
import string

from faker import Faker
from custom_faker_providers import EmailProvider
from password_providers import PasswordProvider

from RiddleTown.wsgi import *

from mainapp.models import User

fake = Faker()
fake.add_provider(EmailProvider)
fake.add_provider(PasswordProvider)


@pytest.mark.django_db                      #test para un usuario comun
def test_user_creation():
    user = User.objects.create_user(
        email =fake.custom_email(),
        nickname =fake.first_name(),
        country =fake.country(),
        estate =fake.state(),
        address =fake.address()
    )
        
    print(user.email)
    print(user.nickname)
    print(user.country)
    print(user.estate)
    print(user.address)

@pytest.mark.django_db                      #test para un super usuario
def test_superuser_creation():
    superUser = User.objects.create_superuser(
        email =fake.custom_email(),
        nickname =fake.first_name(),
        password =fake.password()
    )
    
    superUser.password = superUser.password[1:15]
    assert superUser.is_superuser
    

    print(superUser.nickname)
    print(superUser.email)
    print(superUser.password)

@pytest.mark.django_db                      #test para un usuario staff
def test_staff_user_creation():
    staffUser = User.objects.create_user(
        email =fake.custom_email(),
        nickname =fake.first_name(),
        password =fake.password(),
        is_staff =True
    )

    assert staffUser.is_staff
    staffUser.password = staffUser.password[1:15]
    print(staffUser.nickname)
    print(staffUser.email)
    print(staffUser.password)

@pytest.mark.django_db
def test_user_creation_fail():
    with pytest.raises(Exception):
        User.objects.create_user(
            nikname ='pruebaException'
        )