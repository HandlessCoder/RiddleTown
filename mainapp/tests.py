from django.test import Client, TestCase
from .models import Category, User, Ranking, Prize
from django.urls import reverse
import numpy as np
from PIL import Image #Requiere Pillow
from . import views
from unittest.mock import patch
import io


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
        response = self.client.get("/categories/")
        self.assertEqual(response.status_code, 200) #Prueba que la página cargue

    def test_quantity(self):
        response = self.client.get("/categories/")
        expectedCategoriesCount = len(self.categories)
        renderedCategories = response.content.count(b'<div class="category">')
        self.assertEqual(expectedCategoriesCount, renderedCategories)

    def test_names(self):
        response = self.client.get("/categories/")
        #Prueba que los nombres de las categorías estén en la página
        for category in self.categories:
            self.assertContains(response, category.name)
        self.assertNotContains(response, 'Musica')
        self.assertNotContains(response, 'categoria')
        self.assertNotContains(response, '¡jugar!')

    def hexToRGB(self, hexColor):
        hexColor = hexColor.lstrip('#')
        #print(f"hexColor: {hexColor}")
        return tuple(int(hexColor[i:i+2], 16) for i in (0, 2, 4))

    def toCamelCase(self, s):
        s = s.split()
        return s[0].lower() + ''.join(word.capitalize() for word in s[1:])

    def test_colors(self):
        for category in self.categories:
            #print(f"Category: {category.name}")

            colorHex = category.color
            #print(f"colorHex: {colorHex}")
            rgbTuple = self.hexToRGB(colorHex)
            #print(f"rgbTuple: {rgbTuple}")
            rgbArray = np.array([rgbTuple])
            #print(f"Expected RGB: {rgbArray}")

            categoryCamel = self.toCamelCase(category.name)
            urlImage = f'mainapp/static/Trivias/{categoryCamel}/{categoryCamel}Icon.png'
            img = Image.open(urlImage)
            pixel = img.getpixel((156, 226)) #Pixel céntrico para todos los vectores
            rgbPixel = np.array([pixel[:3]]) #Ignora el canal alfa
            #print(f"Actual RGB from image: {rgbPixel}")

            self.assertTrue(np.array_equal(rgbPixel, rgbArray))

class RankingTests(TestCase):

    def setUp(self):
        User.objects.create(email='Ayaka')
        User.objects.create(email='Hu Tao')
        User.objects.create(email='Shogun')
        self.users = User.objects.all()
        Ranking.objects.create(user=self.users[0], score='8600')
        Ranking.objects.create(user=self.users[1], score='8800')
        Ranking.objects.create(user=self.users[2], score='8700')
        self.rankings = Ranking.objects.all()
        print(self.rankings)
        self.client = Client()

    def test_rankingOrder(self):
        self.assertEqual(self.rankings[0].user.email, self.users[1].email)
        self.assertEqual(self.rankings[1].user.email, self.users[2].email)
        self.assertEqual(self.rankings[2].user.email, self.users[0].email)


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
        self.assertEqual(self.rankings[0].position, self.prizes[0].rankingPosition)
        self.assertEqual(self.rankings[1].position, self.prizes[1].rankingPosition)
        self.assertEqual(self.rankings[2].position, self.prizes[2].rankingPosition)
        
        self.assertNotEqual(self.rankings[1].position, self.prizes[2].rankingPosition)