import logging

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)

import coverage
from django.apps import apps
from rest_framework.test import APIClient

from features.draft_urls import CURSO_URL, PREGUNTA_INDIVIDUAL_URL, TEMA_URL


# def django_ready(context, scenario):
def django_ready(context):
    context.client = APIClient()

    context.CURSO_URL = CURSO_URL
    context.TEMA_URL = TEMA_URL
    context.PREGUNTA_INDIVIDUAL_URL = PREGUNTA_INDIVIDUAL_URL

    try:
        context.pregunta_model = apps.get_model("core", "Pregunta")
        context.examen_de_admision_model = apps.get_model(
            "core", "ExamenDeAdmision"
        )
        context.tema_model = apps.get_model("core", "Tema")
        context.alternativa_model = apps.get_model("core", "Alternativa")
        context.solucion_model = apps.get_model("core", "Solucion")
        context.curso_model = apps.get_model("core", "Curso")
    except LookupError as e:
        raise RuntimeError(f"Model loading error: {e}")


def before_all(context):
    context.fixtures = [
        "api-django/apps/core/fixtures/universidad.json",
        "api-django/apps/core/fixtures/area.json",
        "api-django/apps/core/fixtures/proceso_de_admision.json",
        "api-django/apps/core/fixtures/carrera.json",
        "api-django/apps/core/fixtures/examen_de_admision.json",
        "api-django/apps/core/fixtures/curso.json",
        "api-django/apps/core/fixtures/tema.json",
        "api-django/apps/core/fixtures/preguntas_por_curso.json",
        "api-django/apps/core/fixtures/lectura.json",
        "api-django/apps/core/fixtures/pregunta.json",
        "api-django/apps/core/fixtures/alternativa.json",
        "api-django/apps/core/fixtures/solucion.json",
    ]
    cov = coverage.Coverage()
    cov.start()
    context.cov = cov


def after_all(context):
    cov = context.cov
    cov.stop()
    cov.save()
    cov.html_report(directory="./htmlcov")
