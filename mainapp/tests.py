from django.test import Client, TestCase
from .models import Category, User, Ranking, Trivia, Answer, Prize
from django.urls import reverse
import numpy as np
from PIL import Image #Requiere Pillow
from . import views
from unittest.mock import patch
import io


class CustomUserManager(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(
            email='django@gmail.com',
            password='123456',
            nickname='prueba',
            country='country',
            estate='estate',
            address='address',
            is_staff=False,
            is_superuser=False,
            is_active=True
        )

        self.superUser = User.objects.create_superuser(
            email='django2@gmail.com',
            nickname='pruebaSuper',
            password='789101',
            is_superuser=True
        )

        self.staffUser = User.objects.create_user(
            email='django3@gmail.com',
            nickname='pruebaStaff',
            password='2345678',
            is_staff=True
        )

    def test_UserType(self):
        print(f"------------------------ Test: Verificación del tipo de usuario ------------------------")
        print(f"User: {self.user}\n")
        print(f"SuperUser: {self.superUser}\n")
        print(f"StaffUser: {self.staffUser}\n")
        self.assertTrue(self.superUser.is_superuser, "Es un Super Usuario")
        self.assertTrue(self.staffUser.is_staff, "Es un Usuario Staff")
        print(f"\nVerified\n")


class PrizeTests(TestCase):

    def setUp(self):
        Prize.objects.create(prizeCode='a', prizeType='ranking', rankingPosition=1)
        Prize.objects.create(prizeCode='b', prizeType='ranking', rankingPosition=2)
        Prize.objects.create(prizeCode='c', prizeType='ranking', rankingPosition=3)
        self.prizes = Prize.objects.all()

        User.objects.create(email='kaveh@mail.com', nickname='Kaveh')
        User.objects.create(email='callmyname@adeptus.com', nickname='XiaoYaksha')
        User.objects.create(email='bandaArataki@wujuu.com', nickname='XiaoYaksha')
        self.users = User.objects.all()

        Ranking.objects.create(user=self.users[0], score='12100', position=1)
        Ranking.objects.create(user=self.users[1], score='6000', position=2)
        Ranking.objects.create(user=self.users[2], score='4000', position=3)
        self.rankings = Ranking.objects.all()
        print(self.rankings)
        self.client = Client()

    def test_belongPrize(self):
        print(f"------------------------ Test: Verificación de pertenencia de premio ------------------------")
        print(f"Users inserted: {self.users}\n")
        print(f"Ranking positions: {self.rankings}\n")
        self.assertEqual(self.rankings[0].position, self.prizes[0].rankingPosition)
        self.assertEqual(self.rankings[1].position, self.prizes[1].rankingPosition)
        self.assertEqual(self.rankings[2].position, self.prizes[2].rankingPosition)
        
        self.assertNotEqual(self.rankings[1].position, self.prizes[2].rankingPosition)
        print(f"Verified\n")


class CategoryTests(TestCase):

    def setUp(self):
        Category.objects.create(name='Arte', color='#C0452A')
        Category.objects.create(name='Ciencia', color='#504673')
        Category.objects.create(name='Cultura General', color='#60AAEB')
        #Category.objects.create(name='Deporte', color='#922C3F')
        Category.objects.create(name='Entretenimiento', color='#D76950')
        #Category.objects.create(name='Geografía', color='#4D7EA9')
        #Category.objects.create(name='Historia', color='#BE5568')
        #Category.objects.create(name='Música', color='	#9388BA')
        self.categories = Category.objects.all()
        print(self.categories)
        self.client = Client()

    def test_load(self):
        print(f"------------------------ Test: Carga de Interfaz Categoría ------------------------")
        response = self.client.get("/categories/")
        print(f"Expected Status Code: 200")
        print(f"Actual Status Code: {response.status_code}")
        self.assertEqual(response.status_code, 200) #Prueba que la página cargue
        print(f"Verified\n")

    def test_quantity(self):
        print(f"------------------------ Test: Cantidad dinámica de Categorías ------------------------")
        response = self.client.get("/categories/")
        expectedCategoriesCount = len(self.categories)
        renderedCategories = response.content.count(b'<div class="category">')
        print(f"Expected Categories Count: {expectedCategoriesCount}")
        print(f"Actual Categories Count: {renderedCategories}")
        self.assertEqual(expectedCategoriesCount, renderedCategories)
        print(f"Verified\n")

    def test_names(self):
        print(f"------------------------ Test: Contención de nombres de Categorías ------------------------")
        response = self.client.get("/categories/")
        #Prueba que los nombres de las categorías estén en la página
        for category in self.categories:
            self.assertContains(response, category.name)
        self.assertNotContains(response, 'Musica')
        self.assertNotContains(response, 'categoria')
        self.assertNotContains(response, '¡jugar!')
        print(f"Verified\n")

    def hexToRGB(self, hexColor):
        hexColor = hexColor.lstrip('#')
        #print(f"hexColor: {hexColor}")
        return tuple(int(hexColor[i:i+2], 16) for i in (0, 2, 4))

    def toCamelCase(self, s):
        s = s.split()
        return s[0].lower() + ''.join(word.capitalize() for word in s[1:])

    def test_colors(self):
        print(f"------------------------ Test: Colores de vectores de Categorías ------------------------")
        for category in self.categories:
            #print(f"Category: {category.name}")

            colorHex = category.color
            #print(f"colorHex: {colorHex}")
            rgbTuple = self.hexToRGB(colorHex)
            #print(f"rgbTuple: {rgbTuple}")
            rgbArray = np.array([rgbTuple])
            print(f"Expected RGB: {rgbArray}")

            categoryCamel = self.toCamelCase(category.name)
            urlImage = f'mainapp/static/Trivias/{categoryCamel}/{categoryCamel}Icon.png'
            img = Image.open(urlImage)
            pixel = img.getpixel((156, 226)) #Pixel céntrico para todos los vectores
            rgbPixel = np.array([pixel[:3]]) #Ignora el canal alfa
            print(f"Actual RGB from image: {rgbPixel}")

            self.assertTrue(np.array_equal(rgbPixel, rgbArray))
            print(f"Verified\n")


class RankingTests(TestCase):

    def setUp(self):
        User.objects.create(email='ayaka@gmail.com')
        User.objects.create(email='HuTao@liyue.com')
        User.objects.create(email='Shogun@archon.com')
        self.users = User.objects.all()
        Ranking.objects.create(user=self.users[0], score='8600')
        Ranking.objects.create(user=self.users[1], score='8800')
        Ranking.objects.create(user=self.users[2], score='8700')
        self.rankings = Ranking.objects.all()
        self.client = Client()

    def test_rankingOrder(self):
        print(f"------------------------ Test: Ordenamiento del Ranking ------------------------")
        print(f"Users inserted: {self.users}")
        print(f"Users inserted: {self.rankings}")
        self.assertEqual(self.rankings[0].user.email, self.users[1].email)
        self.assertEqual(self.rankings[1].user.email, self.users[2].email)
        self.assertEqual(self.rankings[2].user.email, self.users[0].email)
        print(f"Verified\n")


class PlayTests(TestCase):

    def setUp(self):
        self.client = Client()

        Category.objects.create(name='Arte')
        Category.objects.create(name='Música')
        self.categories = Category.objects.all()

        self.user = User.objects.create(email='ayaka@gmail.com')

        Trivia.objects.create(triviaID='T1', category=self.categories[0], questionText='¿Quién es mangaka de Pandora Hearts?')
        Trivia.objects.create(triviaID='T2', category=self.categories[1], questionText='¿Cuál es el instrumento principal de una banda de rock?')
        self.trivias = Trivia.objects.all()

        Answer.objects.create(answerID='A1', trivia=self.trivias[0], answerText='Mochizuki Jun', correctAnswer=True)
        Answer.objects.create(answerID='A2', trivia=self.trivias[0], answerText='Toboso Yana', correctAnswer=False)
        Answer.objects.create(answerID='A3', trivia=self.trivias[1], answerText='Piano', correctAnswer=False)
        Answer.objects.create(answerID='A4', trivia=self.trivias[1], answerText='Guitarra eléctrica', correctAnswer=True)
        self.answers = Answer.objects.all()

        self.ranking = Ranking.objects.create(user=self.user, score=200)
        
    def test_categorySelection(self):
        print(f"------------------------ Test: Categoría seleccionada al jugar ------------------------")
        response1 = self.client.post(reverse(views.play), {'category': 'Arte'})
        self.assertEqual(response1.context['category'].name, self.categories[0].name)
        response2 = self.client.post(reverse(views.play), {'category': 'Música'})
        self.assertEqual(response2.context['category'].name, self.categories[1].name)
        print(f"Verified\n")
    
    def test_categoryQuestion(self):
        print(f"------------------------ Test: Trivia desplegada al jugar ------------------------")
        response = self.client.post('/play/', {'category': self.categories[0].name})
        self.assertIn('trivia', response.context)
        trivia = response.context['trivia']
        print(f"La trivia es: {trivia.questionText}")
        self.assertEqual(trivia.category.name, self.categories[0].name)

        response2 = self.client.post('/play/', {'category': self.categories[1].name})
        self.assertIn('trivia', response.context)
        trivia2 = response2.context['trivia']
        print(f"La trivia es: {trivia2.questionText}")
        self.assertNotEqual(trivia2.category.name, self.categories[0].name)
        print(f"Verified\n")

    def test_correctAnswerWithTime(self):
        print(f"------------------------ Test: Puntaje de respuesta correcta con bono de tiempo ------------------------")
        time = 0.5
        data = {
            'category': self.categories[0].name,
            'total': 0,
            'done': '',
            'canSkip': 1,
            'user': self.user.id,
            'time': time,
            'selectedAnswer': 'A1',
        }
        response = self.client.post(reverse(views.play), data)
        print(f"Expected Score: 300")
        print(f"Actual Score: {response.context['total']}")
        #self.assertIn('total', response.context)
        self.assertEqual(response.context['total'], 300)
        self.assertNotEqual(response.context['total'], 100)
        print(f"Verified\n")
        

    def test_correctAnswerWithoutTime(self):
        print(f"------------------------ Test: Puntaje de respuesta correcta sin bono de tiempo ------------------------")
        time = 0
        data = {
            'category': self.categories[0].name,
            'total': 0,
            'done': '',
            'canSkip': 1,
            'user': self.user.id,
            'time': time,
            'selectedAnswer': 'A1',
        }
        response = self.client.post(reverse(views.play), data)
        print(f"Expected Score: 100")
        print(f"Actual Score: {response.context['total']}")
        #self.assertIn('total', response.context)
        self.assertEqual(response.context['total'], 100)
        self.assertNotEqual(response.context['total'], 300)
        print(f"Verified\n")