# apps/core/viewsets.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.viewsets import GenericViewSet
from rest_framework.response import Response


# Local imports
from .models import Pregunta
from .serializers import PreguntaSerializer


# Create your viewsets here.
class PreguntaViewSet(GenericViewSet):
    queryset = Pregunta.objects.order_by("?")
    serializer_class = PreguntaSerializer

    def list(self, request, *args, **kwargs):
        pregunta_random = self.get_queryset()[0]
        queryset = Pregunta.objects.filter(id=pregunta_random.id)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
