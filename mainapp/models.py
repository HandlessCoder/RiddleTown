from typing import Any
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, UserManager
from django.db import models
from django.utils import timezone

# Create your models here.
class CustomUserManager (UserManager):
    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError("No has ingresado una dirección de correo electrónico")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_user(self,email = None ,password = None,**extra_fields):
        extra_fields.setdefault('is_staff',False) 
        extra_fields.setdefault('is_superuser',False) 
        return self._create_user(email,password,**extra_fields)
    
    def create_superuser(self,email = None, password = None, **extra_fields):
        extra_fields.setdefault('is_staff',True) 
        extra_fields.setdefault('is_superuser',True) 
        return self._create_user(email,password,**extra_fields)


class User (AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(blank=True, default='',unique = True)
    nickname = models.CharField(max_length=55, blank=True, default='')
    
    country = models.CharField(max_length=55, blank=True, default='')
    estate = models.CharField(max_length=55, blank=True, default='')
    address = models.CharField(max_length=55, blank=True, default='')
       
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    
    date_joined = models.DateTimeField(default = timezone.now)
    last_login = models.DateTimeField(blank=True, null = True)
    
    objects = CustomUserManager()
    
    USERNAME_FIELD = 'email'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = []
    
    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
        
    def get_full_name(self):
        return self.email
    
    def get_short_name(self):
        return self.nickname or self.email.split('@')[0]
    
    
# MODELOS BASE DE DATOS
#from django.core.validators import MinValueValidator, MaxValueValidator

class Category(models.Model):
    name = models.CharField(max_length=50, primary_key=True)
    color = models.CharField(max_length=10)
    icon = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Trivia(models.Model):
    triviaID = models.CharField(max_length=20, primary_key=True)
    questionType = models.CharField(max_length=10, choices=[
        ('text', 'Texto'),
        ('image', 'Imagen'),
        ('audio', 'Audio'),
    ])
    questionText = models.CharField(max_length=200, blank=True, null=True)
    questionImage = models.CharField(max_length=50, blank=True, null=True)
    questionAudio = models.CharField(max_length=50, blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.triviaID

class Answer(models.Model):
    answerID = models.CharField(max_length=20, primary_key=True)
    answerType = models.CharField(max_length=10, choices=[
        ('text', 'Texto'),
        ('image', 'Imagen'),
    ])
    answerText = models.CharField(max_length=200, blank=True, null=True)
    answerImage = models.CharField(max_length=50, blank=True, null=True)
    correctAnswer = models.BooleanField(default=False)
    trivia = models.ForeignKey(Trivia, on_delete=models.CASCADE)

    def __str__(self):
        return self.answerID

"""
class TriviaAnswered(models.Model):
    triviaID = models.ForeignKey(Trivia, on_delete=models.CASCADE)
    answerID = models.ForeignKey(Answer, on_delete=models.CASCADE)
    scoreObtained = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100),
                    lambda value: value in [0, 100]],
        default=0
    )
    bonusObtained = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(200),
                    lambda value: value in [0, 200]],
        default=0
    )
"""

    

