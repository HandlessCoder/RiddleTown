from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render
from django.utils.translation import gettext       ##requires to instal GNU gettext

# Create your views here.



def mainpage(request):
    return render(request,'mainapp/home.html')

# def prueba(request):
    # return render(request,'mainapp/prueba.html')

def login(request):
    return render(request,'login.html')
def register(request):
    return render(request,'register.html')

def profile(request):
    return render(request,'mainapp/Profile.html')

def edit_profile(request):
    return render(request,'mainapp/editProfile.html')

def help(request):
    return render(request,'mainapp/help.html')

def configuration(request):
    return render(request,'mainapp/configuration.html')

def ranking(request):
    return render(request,'mainapp/ranking.html')

def play(request):
    return render(request,'mainapp/trivia.html')

def categories(request):
    return render(request,'mainapp/categories.html')








