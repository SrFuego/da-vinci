# apps/core/serializers.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.serializers import (
    ModelSerializer,
    Serializer,
    ValidationError,
    IntegerField,
)


# Local imports
from .models import Alternativa, Pregunta, Solucion


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


class SolucionSerializer(ModelSerializer):
    alternativa = AlternativaSerializer(read_only=True)
    pregunta = PreguntaSerializer(read_only=True)

    class Meta:
        model = Solucion
        fields = ("id", "nombre", "texto", "pregunta", "alternativa")
        read_only_fields = ("nombre", "texto")


class AlternativaSeleccionadaSerializer(Serializer):
    alternativa_seleccionada_id = IntegerField()


class PreguntaPostSerializer(ModelSerializer):
    class Meta:
        model = Pregunta
        fields = ("id",)


class SolucionPostSerializer(ModelSerializer):
    class Meta:
        model = Solucion
        fields = ("id",)


class RespuestaEnviadaSerializer(Serializer):
    # pregunta = PreguntaSerializer()
    solucion = SolucionSerializer()


class RespuestaEnviadaPostSerializer(Serializer):
    pregunta = PreguntaPostSerializer()
    solucion = SolucionPostSerializer()

    # def to_representation(self, instance):
    #     response = super().to_representation(instance)
    #     response['other_field'] = instance.id# also response['other_field'] = otherSerializer(instance.model)
    #     return response
