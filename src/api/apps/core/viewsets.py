# apps/core/viewsets.py
# Python imports


# Django imports
from django.shortcuts import get_object_or_404


# Third party apps imports
from rest_framework import status
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.settings import api_settings


# Local imports
from .models import Pregunta, Alternativa
from .serializers import (
    AlternativaSerializer,
    AlternativaSeleccionadaSerializer,
    PreguntaSerializer,
    SolucionSerializer,
)


# Create your viewsets here.
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
        alternativa_seleccionada = get_object_or_404(
            Alternativa, pk=serializer.data["alternativa_seleccionada_id"]
        )
        solucion = alternativa_seleccionada.pregunta.solucion
        examen_de_admision = (
            alternativa_seleccionada.pregunta.examenes_de_admision.first()
        )
        es_correcta = solucion.es_correcta(alternativa_seleccionada)
        if es_correcta:
            puntaje_obtenido = examen_de_admision.puntaje_correcta
        else:
            puntaje_obtenido = examen_de_admision.puntaje_incorrecta
        data = {
            "solucion": SolucionSerializer(
                alternativa_seleccionada.pregunta.solucion
            ).data,
            "alternativa_enviada": AlternativaSerializer(
                alternativa_seleccionada
            ).data,
            "es_correcta": es_correcta,
            "puntaje_obtenido": puntaje_obtenido,
        }
        return Response(data, status=status.HTTP_200_OK)

    def get_success_headers(self, data):
        try:
            return {"Location": str(data[api_settings.URL_FIELD_NAME])}
        except (TypeError, KeyError):
            return {}
