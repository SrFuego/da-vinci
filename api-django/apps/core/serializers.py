# apps/core/serializers.py
# Python imports


# Django imports


# Third party apps imports
from drf_spectacular.utils import extend_schema_field
from rest_framework.serializers import (
    BooleanField,
    CharField,
    DateTimeField,
    FloatField,
    IntegerField,
    ModelSerializer,
    Serializer,
    SerializerMethodField,
)

# Local imports
from .models import Alternativa, Curso, Pregunta, Solucion, Tema


# Create your serializers here.
class HealthCheckSerializer(Serializer):
    status = CharField()
    database = CharField()
    timestamp = DateTimeField()


class AlternativaSerializer(ModelSerializer):
    class Meta:
        model = Alternativa
        fields = (
            "id",
            "valor",
        )


class CursoSerializer(ModelSerializer):
    class Meta:
        model = Curso
        fields = (
            "nombre",
            "slug",
        )


class TemaSerializer(ModelSerializer):
    curso = CursoSerializer()

    class Meta:
        model = Tema
        fields = (
            "nombre",
            "slug",
            "curso",
        )


class PreguntaSerializer(ModelSerializer):
    alternativas = AlternativaSerializer(many=True)
    tema = TemaSerializer()

    class Meta:
        model = Pregunta
        fields = (
            "enunciado",
            "alternativas",
            "tema",
        )


class SolucionSerializer(ModelSerializer):
    alternativa_correcta = AlternativaSerializer(read_only=True)
    pregunta = PreguntaSerializer(read_only=True)

    class Meta:
        model = Solucion
        fields = (
            "teoria",
            "resolucion",
            "pregunta",
            "alternativa_correcta",
        )
        read_only_fields = ("texto",)


class RespuestaSerializer(Serializer):
    solucion = SolucionSerializer()
    alternativa_enviada = AlternativaSerializer()
    es_correcta = BooleanField()
    puntaje_obtenido = FloatField()


class AlternativaRespuestaSerializer(ModelSerializer):
    alternativa_seleccionada_id = IntegerField(
        source="id",
        write_only=True,
    )
    solucion = SolucionSerializer(
        source="pregunta.solucion",
        read_only=True,
    )
    alternativa_enviada = SerializerMethodField()
    es_correcta = BooleanField(read_only=True)
    puntaje_obtenido = FloatField(read_only=True)

    class Meta:
        model = Alternativa
        fields = (
            "alternativa_seleccionada_id",
            "solucion",
            "alternativa_enviada",
            "es_correcta",
            "puntaje_obtenido",
        )

    @extend_schema_field(AlternativaSerializer)
    def get_alternativa_enviada(self, obj):
        if type(obj) == Alternativa:
            return AlternativaSerializer(obj).data
        return None
