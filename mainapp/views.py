from django.http import HttpResponse,JsonResponse,HttpResponseRedirect
# from .models
from django.shortcuts import render
from django.utils.translation import gettext       ##requires to instal GNU gettext
from .models import Category, Ranking, User, Trivia, Answer, PrizeWon
import random
from functools import reduce
from django.utils import timezone


# Create your views here.

def mainpage(request):
    if(request.method == 'POST'):
        print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('category', False)} desde el home")

    ranking = Ranking.objects.order_by('-score').all()[:3]
    categorias = list(Category.objects.values())
    context = {
        "categorias" : categorias,
        "ranking" : ranking
    }
    
    return render(request,'mainapp/home.html', context=context)

# def prueba(request):
    # return render(request,'mainapp/prueba.html')

def login(request):
    return render(request,'login.html')

def register(request):
    return render(request,'register.html')

def profile(request):
    user = User.objects.filter(is_superuser=False).filter(is_staff=False).order_by('date_joined').first()
    puntos = Ranking.objects.filter(user_id = user.id).first().score
    premios = len(list(PrizeWon.objects.filter(user_id = user.id).all()))
    
    context = {
        "user" : user,
        "puntos" : puntos,
        "premios" : premios
    }
    
    return render(request,'mainapp/profile.html', context = context)

def edit_profile(request):
    user = User.objects.filter(is_superuser=False).filter(is_staff=False).order_by('date_joined').first()
    
    if(request.method == "POST"):
        nickname = request.POST.get('nickname')
        country = request.POST.get('country')
        estate = request.POST.get('estate')
        address = request.POST.get('address')
        
        if nickname != None and user.nickname != nickname:
            user.nickname = nickname
        if country != None and user.country != country:
            user.country = country
        if estate != None and user.estate != estate:
            user.estate = estate
        if address != None and user.address != address:
            user.address = address
        user.save()
        return HttpResponseRedirect('/profile/')
        
    else:
        countries = User.objects.values_list("country",flat=True).distinct()
        estates = User.objects.values_list("estate",flat=True).distinct()
        context = {
            "user" : user,
            "countries" : countries,
            "estates" : estates        
        }
        return render(request,'mainapp/editProfile.html', context = context)
        
    
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
        #se envía un mensaje de prueba a la consola del backend por motivos de prueba
        # print(f"Un usuario quiere jugar las trivias de categoría {request.POST.get('category', False)} desde Categorías")
        
        
        #se leen los parámetros enviados por el post
        category = Category.objects.filter(name= request.POST.get('category')).first()
        total = request.POST.get('total')
        done = request.POST.get('done')
        canSkip = request.POST.get('canSkip')
        user = request.POST.get('user')
        time = request.POST.get('time')
        selectedAnswer = request.POST.get('selectedAnswer')
        
        print(f"\n\nLa categoría leída es: {category}")
        print(f"El total leído es: {total}")
        print(f"El canSkip leído es: {canSkip}")
        print(f"El user leído es: {user}")
        print(f"El time leído es: {time}")
        print(f"La selectedAnswer leída es: {selectedAnswer} \n\n")
        
        #se valida el cumplimiento de las condiciones para que sea la primera pregunta que se está jugando
        if category != None and total == None and done == None and canSkip == None and user == None and time == None:
            #se inicializan las variables necesarias
            total = 0
            done = []
            canSkip = 1
            user = User.objects.filter(is_superuser=False).filter(is_staff=False).order_by('date_joined').first().id
            time = 30
            
            #se establece cuál es la pregunta y cuáles son sus respuestas            
            trivias = Trivia.objects.filter(category_id=category.name).exclude(triviaID__in = done).all()
            trivia = random.choice(list(trivias))
            done.append(trivia.triviaID)
            done = reduce(lambda x, y: x+","+y, done)
            answers = Answer.objects.filter(trivia_id=trivia.triviaID).all()
            
            #se empaqueta todo el contexto que se enviará al template del front
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
            
            #se retorna el renderizado del front con el contexto requerido
            return render(request,'mainapp/trivia.html', context = context)
        
        elif category != None and total != None and done != None and canSkip != None and user != None and time != None and selectedAnswer != None:
            #se inicializan las variables necesarias
            user = int(user)
            canSkip = int(canSkip)
            time = int(time)
            total = int (total)
            
            
            if (selectedAnswer != "-1" and Answer.objects.filter(answerID=selectedAnswer).first().correctAnswer == True) or selectedAnswer == "-1":
                if selectedAnswer != "-1":
                    total += 100
                    if time > 0:
                        total+=200
                else:
                    canSkip = 0
            
                maximoPreguntas = 10         
                #se busca la lista de trivias restantes por responder            
                done = done.split(',')
                trivias = Trivia.objects.filter(category_id=category.name).exclude(triviaID__in = done).all()
                cantHechas = len(done)
                cantFaltantes = len(trivias)
                if cantHechas < maximoPreguntas and cantFaltantes > 0:
                                    
                
                    trivia = random.choice(list(trivias))
                    done.append(trivia.triviaID)
                    done = reduce(lambda x, y: x+","+y, done)
                    answers = Answer.objects.filter(trivia_id=trivia.triviaID).all()
                    
                    time = 30
                    #se empaqueta todo el contexto que se enviará al template del front
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
                    return render(request,'mainapp/trivia.html', context = context)
                
            usuarioRankeado = Ranking.objects.filter(user_id=user).first()
            if usuarioRankeado == None:
                usuarioRankeado = Ranking(user_id = user,score = 0,position = -1, last_updated = timezone.now())
            usuarioRankeado.score+=total
            
            usuarioRankeado.save()
                    
                
                
            return HttpResponseRedirect('/ranking/')
                #no quedan más preguntas, tocó mandarlo a su perfil de usuario para que vea sus puntos 
              

    #debería retornarse una págian de error 404
    return render(request,'mainapp/trivia.html')

def categories(request):
    if(request.method == 'POST'):
        search = request.POST.get('search')
        
        categorias = list(Category.objects.filter(name__contains=search).values())
    else:
        categorias = list(Category.objects.values())
    
    context = {
        "categorias" : categorias
    }
    
    return render(request,'mainapp/categories.html', context = context)

