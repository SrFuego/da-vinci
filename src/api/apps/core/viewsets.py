# apps/core/viewsets.py
# Python imports


# Django imports
from django.shortcuts import get_object_or_404


# Third party apps imports
from rest_framework import status
from rest_framework.response import Response
from rest_framework.settings import api_settings
from rest_framework.viewsets import GenericViewSet


# Local imports
from .models import Alternativa, Curso, Pregunta
from .serializers import (
    AlternativaSerializer,
    AlternativaSeleccionadaSerializer,
    CursoSerializer,
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


class MostrarPreguntaPorCursoViewSet(GenericViewSet):
    serializer_class = PreguntaSerializer

    def get_queryset(self):
        curso_seleccionado = Curso.objects.get(
            id=self.request.query_params["curso_id"]
        )
        return Pregunta.to_ui_objects.filter(
            tema__in=curso_seleccionado.tema_set.all()
        ).order_by("?")

    def list(self, request, *args, **kwargs):
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)


class MostrarPreguntaViewSet(GenericViewSet):
    serializer_class = PreguntaSerializer

    def get_queryset(self):
        return Pregunta.to_ui_objects.order_by("?")

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
