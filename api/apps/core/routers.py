# apps/core/routers.py
# Python imports


# Django imports


# Third party apps imports


# Local imports
from .viewsets import (
    CursoViewSet,
    MostrarPreguntaViewSet,
    PreguntaIndividualViewSet,
    ResolverPreguntaViewSet,
)


# Create your routers here.
core_list = (
    (r"pregunta_individual", PreguntaIndividualViewSet),
    (r"pregunta_aleatoria", MostrarPreguntaViewSet),
    (r"resolver_pregunta_individual", ResolverPreguntaViewSet),
    (r"curso", CursoViewSet),
)
