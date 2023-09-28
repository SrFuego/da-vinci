# apps/core/managers.py
# Python imports


# Django imports
from django.db.models import Manager


# Third party apps imports


# Local imports


# Create your managers here.
class CursoToUIManager(Manager):
    def get_queryset(self):
        id_curso_con_preguntas = [
            curso.id for curso in super().get_queryset() if curso.tiene_preguntas
        ]
        return (
            super()
            .get_queryset()
            .filter(
                id__in=id_curso_con_preguntas,
            )
        )


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
        )
