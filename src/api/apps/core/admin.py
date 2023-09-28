# apps/core/admin.py
# Python imports


# Django imports
from django.contrib import admin


# Third party apps imports


# Local imports
from .models import (
    Alternativa,
    Area,
    Carrera,
    Curso,
    ExamenDeAdmision,
    Lectura,
    Pregunta,
    PreguntasPorCurso,
    ProcesoDeAdmision,
    Solucion,
    Tema,
    Universidad,
)
from .forms import SolucionAdminForm


# Register your models here.
# @admin.register(Alternativa)
# class AlternativaModelAdmin(admin.ModelAdmin):
#     list_display = ["id", "valor", "pregunta"]


class AlternativaInLine(admin.TabularInline):
    model = Alternativa
    extra = 0
    min_num = 2

    def get_max_num(self, request, obj=None, **kwargs):
        if obj:
            return obj.cantidad_de_alternativas
        else:
            return 5


@admin.register(Area)
class AreaModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Carrera)
class CarreraModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Curso)
class CursoModelAdmin(admin.ModelAdmin):
    pass


@admin.register(ExamenDeAdmision)
class ExamenDeAdmisionModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Lectura)
class LecturaModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Pregunta)
class PreguntaModelAdmin(admin.ModelAdmin):
    inlines = [AlternativaInLine]
    list_display = ["enunciado", "tema", "curso"]
    list_filter = ["tema", "tema__curso"]


@admin.register(PreguntasPorCurso)
class PreguntasPorCursoModelAdmin(admin.ModelAdmin):
    pass


@admin.register(ProcesoDeAdmision)
class ProcesoDeAdmisionModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Solucion)
class SolucionModelAdmin(admin.ModelAdmin):
    form = SolucionAdminForm


@admin.register(Tema)
class TemaModelAdmin(admin.ModelAdmin):
    pass


@admin.register(Universidad)
class UniversidadModelAdmin(admin.ModelAdmin):
    pass
