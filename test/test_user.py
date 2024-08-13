import pytest 

from faker import Faker
from custom_faker_providers import EmailProvider

from RiddleTown.wsgi import *

from mainapp.models import User

fake = Faker()
fake.add_provider(EmailProvider)

@pytest.mark.django_db                      #test para un usuario comun
def test_user_creation():
    user = User.objects.create_user(
        email =fake.custom_email(),
        nickname =fake.first_name()
    )
    
    print(user.nickname)
    print(user.email)

@pytest.mark.django_db                      #test para un super usuario
def test_superuser_creation():
    superUser = User.objects.create_superuser(
        email =fake.custom_email(),
        nickname =fake.first_name()
    )

    assert superUser.is_superuser
    print(superUser.nickname)
    print(superUser.email)

@pytest.mark.django_db                      #test para un usuario staff
def test_staff_user_creation():
    staffUser = User.objects.create_user(
        email =fake.custom_email(),
        nickname =fake.first_name(),
        is_staff =True
    )

    assert staffUser.is_staff
    print(staffUser.nickname)
    print(staffUser.email)

@pytest.mark.django_db
def test_user_creation_fail():
    with pytest.raises(Exception):
        User.objects.create_user(
            nikname ='pruebaException'
        )