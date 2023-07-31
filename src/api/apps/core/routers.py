# apps/core/routers.py
# Python imports


# Django imports


# Third party apps imports


# Local imports
from .viewsets import PreguntaViewSet


# Create your routers here.
core_list = ((r"mostrar_pregunta", PreguntaViewSet),)
