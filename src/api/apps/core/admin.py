# apps/core/admin.py
# Python imports


# Django imports
from django.contrib import admin


# Third party apps imports


# Local imports
from .models import Pregunta, Alternativa


# Register your models here.
@admin.register(Pregunta)
class PreguntaModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Alternativa)
class AlternativaModelAdmin(admin.ModelAdmin):
    pass
