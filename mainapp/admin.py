from django.contrib import admin

# Register your models here.
from .models import User, Category, Trivia, Answer, Ranking, Prize, PrizeWon


admin.site.register(User)
admin.site.register(Category)
admin.site.register(Trivia)
admin.site.register(Answer)
admin.site.register(Ranking)
admin.site.register(Prize)
admin.site.register(PrizeWon)