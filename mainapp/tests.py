from django.test import TestCase

# Create your tests here.
from mainapp.models import User

class CustomUserManager (TestCase):

    def setUp(self):
        self.user= User.objects.create_user(
            email='django@gmail.com',
            password='123456',
            nickname='prueba',
            country='country',
            estate='estate',
            address='address'
        )

    def test_superuser_creation(self):
        self.superUser = User.objects.create_superuser(
            email ='django2@gmail.com',
            nickname ='pruebaSuper',
            password ='789101'
    )
        
    def test_staff_user_creation(self):
        self.staffUser = User.objects.create_user(
            email ='django3@gmail.com',
            nickname ='pruebaStaff',
            password ='2345678',
            is_staff =True
    )
        
        
