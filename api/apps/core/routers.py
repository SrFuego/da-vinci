# apps/core/routers.py
# Python imports


# Django imports
from django.urls import include, path
from rest_framework.routers import SimpleRouter


# Third party apps imports


# Local imports
from .viewsets import (
    CursoViewSet,
    TemaViewSet,
    PreguntaIndividualViewSet,
)


# Create your routers here.
core_list = (
    (r"curso", CursoViewSet),
    (r"pregunta_individual", PreguntaIndividualViewSet),
)


tema_router = SimpleRouter()
tema_router.register("tema", TemaViewSet, basename="tema")

core_urlpatterns = [
    path(
        "api/v1/curso/<int:curso_id>/",
        include(tema_router.urls),
    ),
]
