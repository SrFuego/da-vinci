# apps/core/serializers.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.serializers import (
    ModelSerializer,
    Serializer,
    IntegerField,
    FloatField,
    BooleanField,
    CharField,
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
    alternativa_seleccionada_id = IntegerField(
        source="alternativaSeleccionadaId",
        write_only=True,
    )
    valor = CharField(read_only=True)

    class Meta:
        model = Alternativa
        fields = ("alternativa_seleccionada_id", "valor")


class CursoSerializer(ModelSerializer):
    class Meta:
        model = Curso
        fields = ("nombre", "slug")


class TemaSerializer(ModelSerializer):
    curso = CursoSerializer()

    class Meta:
        model = Tema
        fields = ("nombre", "slug", "curso")


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


class AlternativaSeleccionadaSerializer(Serializer):
    alternativa_seleccionada_id = IntegerField(
        source="alternativaSeleccionadaId"
    )

    def evaluar_respuesta(self):
        return True


class RespuestaSerializer(Serializer):
    solucion = SolucionSerializer()
    alternativa_enviada = AlternativaSerializer()
    es_correcta = BooleanField()
    puntaje_obtenido = FloatField()
