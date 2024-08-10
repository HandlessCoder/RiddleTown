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


class Ranking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, primary_key=True)
    score = models.PositiveIntegerField(default=0)
    position = models.PositiveIntegerField(null=True) #Puede calcularse dinámicamente
    last_updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-score']
        verbose_name = 'Ranking'
        verbose_name_plural = 'Rankings'

    def __str__(self):
        return f"{self.user.email} - Score: {self.score} - Position: {self.position}"
    

class Prize(models.Model):
    prizeCode = models.CharField(max_length=20, primary_key=True)
    prizeName = models.CharField(max_length=30)
    prizeType = models.CharField(max_length=15, choices=[
        ('instant', 'Instantáneo'),
        ('ranking', 'Ranking'),
    ])
    appearFrecuency = models.FloatField(default=0, null=True)
    quantity = models.PositiveIntegerField(default=0, null=True)
    rankingPosition = models.PositiveIntegerField(null=True, choices = [
        (1, 'Primer lugar'),
        (2, 'Segundo lugar'),
        (3, 'Tercer lugar'),
    ])
    
    def __str__(self):
        return f"{self.prizeName} - {self.get_prizeType_display()}"


class PrizeWon(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    prize = models.ForeignKey(Prize, on_delete=models.CASCADE)
    prizeState = models.CharField(max_length=15, choices=[
        ('toBeDelivered', 'Por entregar'),
        ('sent', 'Enviado'),
        ('delivered', 'Entregado'),
    ], default='toBeDelivered')
    won_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"{self.user.email} ganó {self.prize.prizeCode} - Estado: {self.get_prizeState_display()}"

    def mark_as_sent(self):
        self.prizeState = 'sent'
        self.save()

    def mark_as_delivered(self):
        self.prizeState = 'delivered'
        self.save()