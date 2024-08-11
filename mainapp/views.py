from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render
from django.utils.translation import gettext       ##requires to instal GNU gettext
from .models import Category, Ranking, User

# Create your views here.

def mainpage(request):
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('miValor', False)} desde el home")




    
    categorias = list(Category.objects.values())
    context = {
        "categorias" : categorias
    }
    
    
    return render(request,'mainapp/home.html', context=context)

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
    ranking = Ranking.objects.order_by('-score').all()
    context = {
        "ranking" : ranking
    }
    # for place in ranking:
    #     print (type (place))
    #     print (f"\n\n\n{place}\n\n\n")
        # print(place.user_id.nickname)
    
    return render(request,'mainapp/ranking.html', context = context)

def play(request):
    return render(request,'mainapp/trivia.html')

def categories(request):
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('miValor', False)} desde Categorías")




    
    categorias = list(Category.objects.values())
    context = {
        "categorias" : categorias
    }
    
    
    
    
    return render(request,'mainapp/categories.html', context = context)

