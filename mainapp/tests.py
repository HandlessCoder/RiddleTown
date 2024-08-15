from django.test import TestCase
from mainapp.models import User

class CustomUserManager(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(
            email='django@gmail.com',
            password='123456',
            nickname='prueba',
            country='country',
            estate='estate',
            address='address',
            is_staff=False,
            is_superuser=False,
            is_active=True
        )

        self.superUser = User.objects.create_superuser(
            email='django2@gmail.com',
            nickname='pruebaSuper',
            password='789101',
            is_superuser=True
        )

        self.staffUser = User.objects.create_user(
            email='django3@gmail.com',
            nickname='pruebaStaff',
            password='2345678',
            is_staff=True
        )

    def test_UserType(self):
        print(f"---------------------------------Test: Verificación del tipo de usuario------------------------------\n")
        print(f"User: {self.user}\n")
        print(f"SuperUser: {self.superUser}\n")
        print(f"User: {self.staffUser}\n")
        self.assertTrue(self.superUser.is_superuser, "Es un Super Usuario")
        self.assertTrue(self.staffUser.is_staff, "Es un Usuario Staff")
        print(f"\nVerified\n")