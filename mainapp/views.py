from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render

# Create your views here.



def mainpage(request):
    return render(request,'mainapp/homeNoLogged.html')

# def prueba(request):
    # return render(request,'mainapp/prueba.html')

def login(request):
    return render(request,'login.html')
def register(request):
    return render(request,'register.html')

def profile(request):
    return render(request,'mainapp/profile.html')

def edit_profile(request):
    return render(request,'mainapp/editProfile.html')

def help(request):
    return render(request,'mainapp/helpNoLogged.html')

def configuration(request):
    return render(request,'mainapp/configurationPlayerNoLoged.html')

def ranking(request):
    return render(request,'mainapp/rankingNoLogged.html')


def play(request):
    return render(request,'mainapp/historyTrivia.html')









