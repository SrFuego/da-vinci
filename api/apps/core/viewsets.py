# apps/core/viewsets.py
# Python imports


# Django imports
from django.shortcuts import get_object_or_404, get_list_or_404


# Third party apps imports
from rest_framework import status
from rest_framework.response import Response
from rest_framework.settings import api_settings
from rest_framework.viewsets import GenericViewSet
from drf_spectacular.utils import OpenApiParameter, extend_schema
from silk.profiling.profiler import silk_profile


# Local imports
from .models import Alternativa, Curso, Tema, Pregunta
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
        return Tema.to_ui_objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        data = {"temas": serializer.data}
        return Response(data)


class PreguntaIndividualViewSet(GenericViewSet):
    queryset = Pregunta.objects.none()
    serializer_class = PreguntaSerializer

    def get_queryset(self):
        if "curso_id" in self.request.query_params:
            curso_seleccionado = get_object_or_404(
                Curso,
                id=self.request.query_params["curso_id"],
            )
            return Pregunta.to_ui_objects.filter(
                tema__in=curso_seleccionado.tema_set.all()
            ).order_by("?")
        else:
            return Pregunta.to_ui_objects.order_by("?")

    @silk_profile()
    @extend_schema(
        parameters=[
            OpenApiParameter(
                name="curso_id",
                description="ID del Curso",
                type=int,
            ),
        ]
    )
    def list(self, request, *args, **kwargs):
        get_list_or_404(self.get_queryset())
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)


class MostrarPreguntaViewSet(GenericViewSet):
    serializer_class = PreguntaSerializer

    def get_queryset(self):
        return Pregunta.to_ui_objects.order_by("?")

    @silk_profile()
    def list(self, request, *args, **kwargs):
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)


class ResolverPreguntaViewSet(GenericViewSet):
    serializer_class = AlternativaSeleccionadaSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        respuesta = get_object_or_404(
            Alternativa, pk=serializer.data["alternativa_seleccionada_id"]
        )
        data_calificada = respuesta.calificar()
        data = {
            "solucion": SolucionSerializer(data_calificada["solucion"]).data,
            "alternativa_enviada": AlternativaSerializer(respuesta).data,
            "es_correcta": data_calificada["es_correcta"],
            "puntaje_obtenido": data_calificada["puntaje_obtenido"],
        }
        return Response(data, status=status.HTTP_200_OK)

    def get_success_headers(self, data):
        try:
            return {"Location": str(data[api_settings.URL_FIELD_NAME])}
        except (TypeError, KeyError):
            return {}
