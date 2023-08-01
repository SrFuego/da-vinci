# apps/core/routers.py
# Python imports


# Django imports


# Third party apps imports


# Local imports
from .viewsets import MostrarPreguntaViewSet, ResolverPreguntaViewSet


# Create your routers here.
core_list = (
    (r"mostrar_pregunta", MostrarPreguntaViewSet),
    (r"enviar_alternativa_seleccionada", ResolverPreguntaViewSet),
)
