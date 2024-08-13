import pytest 

from RiddleTown.wsgi import *

from mainapp.models import User

@pytest.mark.django_db                      #test para un usuario comun
def test_user_creation():
    user = User.objects.create_user(
        email ='pruebaUnitaria@gmail.com',
        nickname ='pruebaUnitaria'
    )

    assert user.nickname == 'pruebaUnitaria'


@pytest.mark.django_db                      #test para un super usuario
def test_superuser_creation():
    user = User.objects.create_superuser(
        email ='pruebaSuperUsuario@gmail.com',
        nickname ='pruebaSuperUsuario'
    )

    assert user.is_superuser


@pytest.mark.django_db                      #test para un usuario staff
def test_staff_user_creation():
    user = User.objects.create_user(
        email ='pruebaUsuarioStaff@gmail.com',
        nickname ='pruebaUsuarioStaff',
        is_staff =True
    )

    assert user.is_staff