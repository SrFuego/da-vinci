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
    PreguntaSerializer,
    AlternativaSeleccionadaSerializer,
    SolucionSerializer,
)


# Create your viewsets here.
class MostrarPreguntaViewSet(GenericViewSet):
    queryset = Pregunta.objects.order_by("?")
    serializer_class = PreguntaSerializer

    def list(self, request, *args, **kwargs):
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)


class ResolverPreguntaViewSet(GenericViewSet):
    # queryset = Pregunta.objects.order_by("?")
    serializer_class = AlternativaSeleccionadaSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        alternativa = get_object_or_404(
            Alternativa, pk=serializer.data["alternativa_seleccionada_id"]
        )
        solucion = alternativa.pregunta.solucion
        respuesta_enviada = SolucionSerializer(solucion)
        return Response(respuesta_enviada.data, status=status.HTTP_200_OK)

    def get_success_headers(self, data):
        try:
            return {"Location": str(data[api_settings.URL_FIELD_NAME])}
        except (TypeError, KeyError):
            return {}
