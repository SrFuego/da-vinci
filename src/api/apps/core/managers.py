# apps/core/managers.py
# Python imports


# Django imports
from django.db.models import Manager, F, Count


# Third party apps imports


# Local imports


# Create your managers here.
class PreguntaToUIManager(Manager):
    def get_queryset(self):
        id_preguntas_completas = [
            pregunta.id
            for pregunta in super().get_queryset()
            if pregunta.alternativas_completas
        ]
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
