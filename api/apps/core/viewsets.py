# apps/core/viewsets.py
# Python imports

# Django imports
from django.db import connections
from django.db.utils import OperationalError
from django.shortcuts import get_list_or_404, get_object_or_404
from django.utils import timezone
from drf_spectacular.utils import OpenApiParameter, extend_schema

# Third party apps imports
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from silk.profiling.profiler import silk_profile

# Local imports
from .models import Alternativa, Curso, Pregunta, Tema
from .serializers import (
    AlternativaRespuestaSerializer,
    CursoSerializer,
    PreguntaSerializer,
    TemaSerializer,
)


# Create your viewsets here.
class HealthCheck(GenericViewSet):
    permission_classes = (AllowAny,)

    def list(self, request, *args, **kwargs):
        try:
            # Check database connection
            connections["default"].ensure_connection()
            return Response(
                {
                    "status": "healthy",
                    "database": "connected",
                    "timestamp": timezone.now().isoformat(),
                },
                status=status.HTTP_200_OK,
            )
        except OperationalError:
            return Response(
                {
                    "status": "unhealthy",
                    "database": "disconnected",
                    "timestamp": timezone.now().isoformat(),
                },
                status=status.HTTP_503_SERVICE_UNAVAILABLE,
            )


class CursoViewSet(GenericViewSet):
    queryset = Curso.to_ui_objects.all()
    serializer_class = CursoSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset(),
        )
        serializer = self.get_serializer(
            queryset,
            many=True,
        )
        return Response(serializer.data)


class TemaViewSet(GenericViewSet):
    serializer_class = TemaSerializer

    def get_queryset(self):
        queryset = Tema.to_ui_objects.filter(
            curso__slug=self.kwargs["curso"],
        )
        get_list_or_404(queryset)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset(),
        )
        serializer = self.get_serializer(
            queryset,
            many=True,
        )
        return Response(serializer.data)


class PreguntaIndividualViewSet(GenericViewSet):
    def get_queryset(self):
        if "curso" in self.request.query_params:
            curso_seleccionado = get_object_or_404(
                Curso,
                slug=self.request.query_params["curso"],
            )
            return Pregunta.to_ui_objects.filter(
                tema__in=curso_seleccionado.tema_set.all()
            ).order_by("?")
        if "tema" in self.request.query_params:
            tema_seleccionado = get_object_or_404(
                Tema,
                slug=self.request.query_params["tema"],
            )
            return Pregunta.to_ui_objects.filter(
                tema=tema_seleccionado
            ).order_by("?")
        return Pregunta.to_ui_objects.order_by("?")

    def get_serializer_class(self):
        if self.request.method == "GET":
            return PreguntaSerializer
        if self.request.method == "POST":
            return AlternativaRespuestaSerializer

    @silk_profile()
    @extend_schema(
        parameters=[
            OpenApiParameter(
                name="curso",
                description="Slug del Curso",
                type=str,
            ),
            OpenApiParameter(
                name="tema",
                description="Slug del Tema",
                type=str,
            ),
        ]
    )
    def list(self, request, *args, **kwargs):
        get_list_or_404(self.get_queryset())
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        alternativa_seleccionada = get_object_or_404(
            Alternativa,
            id=request.data["alternativa_seleccionada_id"],
        )
        serializer = self.get_serializer(alternativa_seleccionada)
        return Response(serializer.data)
