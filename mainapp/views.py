from django.http import HttpResponse,JsonResponse
# from .models
from django.shortcuts import render
from django.utils.translation import gettext       ##requires to instal GNU gettext
from .models import Category, Ranking, User, Trivia, Answer

# Create your views here.

def mainpage(request):
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('category', False)} desde el home")

        


    
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
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('category', False)} desde Categorías")
        
        category = Category.objects.filter(name= request.POST.get('category')).first()
        total = request.POST.get('total')
        done = request.POST.get('done')
        canSkip = request.POST.get('canSkip')
        user = request.POST.get('user')
        time = request.POST.get('time')
        
        
        if category != None and total == None and done == None and canSkip == None and user == None and time == None:
            total = 0
            done = []
            canSkip = 1
            user = User.objects.filter(is_superuser=False).filter(is_staff=False).order_by('date_joined').first()
            time = 30
            
            trivia = Trivia.objects.filter(category_id=category.name).exclude(triviaID__in = done).first()
            answers = Answer.objects.filter(trivia_id=trivia.triviaID).all()
            
            context = {
                "category" : category,
                "total" : total,
                "done" : done,
                "canSkip" : canSkip,
                "user" : user,
                "time" : time,
                "trivia" : trivia,
                "answers" : answers
            }
            print(category)
            print(total)
            print(done)
            print(canSkip)
            print(user)
            print(time)
            print(trivia)
            print(answers)
            
            # print("pues sí, en efecto funciona")
            
            
            
            return render(request,'mainapp/trivia.html', context = context)
            
    
        # if request.POST.get('category') != None and request.POST.get('total') != None and request.POST.get('done') != None and request.POST.get('canSkip') != None and request.POST.get('playerId') != None and request.POST.get('time') != None:
    
    
    


    return render(request,'mainapp/trivia.html')

def categories(request):
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('category', False)} desde home")




    
    categorias = list(Category.objects.values())
    context = {
        "categorias" : categorias
    }
    
    
    
    
    return render(request,'mainapp/categories.html', context = context)

