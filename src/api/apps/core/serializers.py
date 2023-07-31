# apps/core/serializers.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.serializers import ModelSerializer


# Local imports
from .models import Alternativa, Pregunta


# Create your serializers here.
class AlternativaSerializer(ModelSerializer):
    class Meta:
        model = Alternativa
        fields = ("id", "respuesta")


class PreguntaSerializer(ModelSerializer):
    alternativas = AlternativaSerializer(many=True)

    class Meta:
        model = Pregunta
        fields = ("id", "enunciado", "alternativas")
