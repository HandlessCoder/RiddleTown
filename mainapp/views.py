from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render

# Create your views here.



def mainpage(request):
    return render(request,'mainapp/base.html')





