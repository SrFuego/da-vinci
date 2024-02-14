# apps/core/viewsets.py
# Python imports


# Django imports
from django.shortcuts import get_object_or_404, get_list_or_404


# Third party apps imports
from rest_framework import status

# from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from drf_spectacular.utils import OpenApiParameter, extend_schema
from silk.profiling.profiler import silk_profile


# Local imports
from .models import (
    Alternativa,
    Curso,
    Tema,
    Pregunta,
)
from .serializers import (
    AlternativaSerializer,
    AlternativaSeleccionadaSerializer,
    CursoSerializer,
    TemaSerializer,
    PreguntaSerializer,
    SolucionSerializer,
    RespuestaSerializer,
)


# Create your viewsets here.
class CursoViewSet(GenericViewSet):
    queryset = Curso.to_ui_objects.all()
    serializer_class = CursoSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset(),
        )
        serializer = self.get_serializer(
            queryset,
            many=True,
        )
        return Response(serializer.data)


class TemaViewSet(GenericViewSet):
    serializer_class = TemaSerializer

    def get_queryset(self):
        queryset = Tema.to_ui_objects.filter(
            curso__slug=self.kwargs["curso"],
        )
        get_list_or_404(queryset)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset(),
        )
        serializer = self.get_serializer(
            queryset,
            many=True,
        )
        return Response(serializer.data)


class PreguntaIndividualViewSet(GenericViewSet):
    def get_queryset(self):
        if "curso" in self.request.query_params:
            curso_seleccionado = get_object_or_404(
                Curso,
                slug=self.request.query_params["curso"],
            )
            return Pregunta.to_ui_objects.filter(
                tema__in=curso_seleccionado.tema_set.all()
            ).order_by("?")
        if "tema" in self.request.query_params:
            tema_seleccionado = get_object_or_404(
                Tema,
                slug=self.request.query_params["tema"],
            )
            return Pregunta.to_ui_objects.filter(
                tema=tema_seleccionado
            ).order_by("?")
        return Pregunta.to_ui_objects.order_by("?")

    def get_serializer_class(self):
        if self.request.method == "GET":
            return PreguntaSerializer
        if self.request.method == "POST":
            # return AlternativaSeleccionadaSerializer
            return AlternativaSerializer

    @silk_profile()
    @extend_schema(
        parameters=[
            OpenApiParameter(
                name="curso",
                description="Slug del Curso",
                type=str,
            ),
            OpenApiParameter(
                name="tema",
                description="Slug del Tema",
                type=str,
            ),
        ]
    )
    def list(self, request, *args, **kwargs):
        get_list_or_404(self.get_queryset())
        pregunta_random = self.get_queryset().first()
        serializer = self.get_serializer(pregunta_random)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        print(request.data)
        serializer_in = self.get_serializer(data=request.data)
        serializer_in.is_valid(raise_exception=True)
        print(serializer_in.data)
        respuesta = get_object_or_404(
            Alternativa,
            pk=serializer_in.data["alternativa_seleccionada_id"],
        )
        data_calificada = respuesta.calificar()
        data = {
            "solucion": SolucionSerializer(
                data_calificada["solucion"],
            ).data,
            "alternativa_enviada": AlternativaSerializer(
                respuesta,
            ).data,
            "es_correcta": data_calificada["es_correcta"],
            "puntaje_obtenido": data_calificada["puntaje_obtenido"],
        }
        serializer_out = RespuestaSerializer(data=data)
        serializer_out.is_valid()
        return Response(serializer_out.data)
