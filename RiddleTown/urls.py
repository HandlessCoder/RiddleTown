"""
URL configuration for RiddleTown project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views


urlpatterns = [
    path('', views.mainpage),       #este será el mismo que se usará para cuando un usuario esté loggeado, pero hace falta dinamizarlo para que cambie cuando haya una sesión
    # path('prueba/', views.prueba),
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('register/', views.register),
    
    path('profile/', views.profile),
    path('profile/edit/', views.edit_profile),
    path('help/', views.help),
    
    path('conf/', views.configuration),
    path('ranking/', views.ranking),
    path('play/', views.play),
    
    
    
    
    
    
    
    
    
]
