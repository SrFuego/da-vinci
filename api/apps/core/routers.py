# apps/core/routers.py
# Python imports

# Django imports
from django.urls import include, path
from rest_framework.routers import SimpleRouter

# Local imports
from .viewsets import (
    CursoViewSet,
    HealthCheck,
    PreguntaIndividualViewSet,
    TemaViewSet,
)

# Third party apps imports


# Create your routers here.
core_list = (
    (r"curso", CursoViewSet),
    (r"health_check", HealthCheck),
    (r"pregunta_individual", PreguntaIndividualViewSet),
)


tema_router = SimpleRouter()
tema_router.register("tema", TemaViewSet, basename="tema")

core_urlpatterns = [
    path(
        "api/v1/curso/<str:curso>/",
        include(tema_router.urls),
    ),
]
