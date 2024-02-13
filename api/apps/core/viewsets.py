# apps/core/viewsets.py
# Python imports


# Django imports
from django.shortcuts import get_object_or_404, get_list_or_404


# Third party apps imports
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.settings import api_settings
from rest_framework.viewsets import GenericViewSet
from drf_spectacular.utils import OpenApiParameter, extend_schema
from silk.profiling.profiler import silk_profile


# Local imports
from .models import (
    Alternativa,
    Curso,
    Tema,
    Pregunta,
)
from .serializers import (
    AlternativaSerializer,
    AlternativaSeleccionadaSerializer,
    CursoSerializer,
    TemaSerializer,
    PreguntaSerializer,
    SolucionSerializer,
)


# Create your viewsets here.
class CursoViewSet(GenericViewSet):
    serializer_class = CursoSerializer

    def get_queryset(self):
        return Curso.to_ui_objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        data = {"cursos": serializer.data}
        return Response(data)


class TemaViewSet(GenericViewSet):
    serializer_class = TemaSerializer

    def get_queryset(self):
        return Tema.to_ui_objects.filter(
            curso__id=self.kwargs["curso_id"],
        )

    def list(self, request, *args, **kwargs):
        get_list_or_404(self.get_queryset())
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        data = {"temas": serializer.data}
        return Response(data)


class PreguntaIndividualViewSet(GenericViewSet):
    queryset = Pregunta.objects.none()

    def get_queryset(self):
        if "curso_id" in self.request.query_params:
            curso_seleccionado = get_object_or_404(
                Curso,
                id=self.request.query_params["curso_id"],
            )
            return Pregunta.to_ui_objects.filter(
                tema__in=curso_seleccionado.tema_set.all()
            ).order_by("?")
        if "tema_id" in self.request.query_params:
            tema_seleccionado = get_object_or_404(
                Tema,
                id=self.request.query_params["tema_id"],
            )
            return Pregunta.to_ui_objects.filter(
                tema=tema_seleccionado
            ).order_by("?")
        return Pregunta.to_ui_objects.order_by("?")

    def get_serializer_class(self):
        if self.request.method == "GET":
            return PreguntaSerializer
        if self.request.method == "POST":
            return AlternativaSeleccionadaSerializer

    @silk_profile()
    @extend_schema(
        parameters=[
            OpenApiParameter(
                name="curso_id",
                description="ID del Curso",
                type=int,
            ),
            OpenApiParameter(
                name="tema_id",
                description="ID del Tema",
                type=int,
            ),
        ]
    )
    def list(self, request, *args, **kwargs):
        get_list_or_404(self.get_queryset())
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        respuesta = get_object_or_404(
            Alternativa,
            pk=serializer.data["alternativa_seleccionada_id"],
        )
        data_calificada = respuesta.calificar()
        data = {
            "solucion": SolucionSerializer(
                data_calificada["solucion"],
            ).data,
            "alternativa_enviada": AlternativaSerializer(
                respuesta,
            ).data,
            "es_correcta": data_calificada["es_correcta"],
            "puntaje_obtenido": data_calificada["puntaje_obtenido"],
        }
        return Response(
            data,
            status=status.HTTP_200_OK,
        )
