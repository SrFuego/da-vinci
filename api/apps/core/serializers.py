# apps/core/serializers.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.serializers import (
    ModelSerializer,
    Serializer,
    # ValidationError,
    IntegerField,
)


# Local imports
from .models import (
    Alternativa,
    Curso,
    Pregunta,
    Solucion,
    Tema,
)


# Create your serializers here.
class AlternativaSerializer(ModelSerializer):
    class Meta:
        model = Alternativa
        fields = ("id", "valor")


class CursoSerializer(ModelSerializer):
    class Meta:
        model = Curso
        fields = ("id", "nombre", "slug")


class TemaSerializer(ModelSerializer):
    class Meta:
        model = Tema
        fields = ("id", "nombre", "slug")


class PreguntaSerializer(ModelSerializer):
    alternativas = AlternativaSerializer(many=True)
    curso = CursoSerializer()
    tema = TemaSerializer()

    class Meta:
        model = Pregunta
        fields = (
            "id",
            "enunciado",
            "alternativas",
            "curso",
            "tema",
        )


class SolucionSerializer(ModelSerializer):
    alternativa_correcta = AlternativaSerializer(read_only=True)
    pregunta = PreguntaSerializer(read_only=True)

    class Meta:
        model = Solucion
        fields = (
            "id",
            "teoria",
            "resolucion",
            "pregunta",
            "alternativa_correcta",
        )
        read_only_fields = ("texto",)


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
    solucion = SolucionSerializer()
