# apps/core/managers.py
# Python imports


# Django imports
from django.db.models import Manager, F, Count


# Third party apps imports


# Local imports


# Create your managers here.
class PreguntaToUIManager(Manager):
    def get_queryset(self):
        id_preguntas_completas = []
        for pregunta in super().get_queryset():
            aux_a = pregunta.cantidad_alternativas
            aux_b = pregunta.alternativas.count()
            if aux_a == aux_b:
                id_preguntas_completas.append(pregunta.id)
        return (
            super()
            .get_queryset()
            .filter(
                id__in=id_preguntas_completas,
                solucion__isnull=False,
            )
            # .exclude(
            #     solucion__resolucion="",
            #     solucion__teoria="",
            # )
            # .exclude(
            #     solucion__resolucion=None,
            #     solucion__teoria=None,
            # )
        )
