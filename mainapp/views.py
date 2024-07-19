from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render

# Create your views here.



def mainpage(request):
    return render(request,'mainapp/base.html')

def prueba(request):
    return render(request,'mainapp/prueba.html')

def login(request):
    return render(request,'login.html')
def register(request):
    return render(request,'register.html')



