import coverage

from rest_framework.test import APIClient

from steps.draft_urls import (
    PREGUNTA_ALEATORIA_URL,
    CURSO_URL,
    PREGUNTA_INDIVIDUAL_POR_CURSO_URL,
    PREGUNTA_INDIVIDUAL_RESOLVER_URL,
)


# def django_ready(context, scenario):
def django_ready(context):
    context.test.client = APIClient()
    context.PREGUNTA_ALEATORIA_URL = PREGUNTA_ALEATORIA_URL
    context.CURSO_URL = CURSO_URL
    context.PREGUNTA_INDIVIDUAL_POR_CURSO_URL = (
        PREGUNTA_INDIVIDUAL_POR_CURSO_URL
    )
    context.PREGUNTA_INDIVIDUAL_RESOLVER_URL = PREGUNTA_INDIVIDUAL_RESOLVER_URL


def before_all(context):
    context.fixtures = [
        "src/api/apps/core/fixtures/universidad.json",
        "src/api/apps/core/fixtures/area.json",
        "src/api/apps/core/fixtures/proceso_de_admision.json",
        "src/api/apps/core/fixtures/carrera.json",
        "src/api/apps/core/fixtures/examen_de_admision.json",
        "src/api/apps/core/fixtures/curso.json",
        "src/api/apps/core/fixtures/tema.json",
        "src/api/apps/core/fixtures/preguntas_por_curso.json",
        "src/api/apps/core/fixtures/lectura.json",
        "src/api/apps/core/fixtures/pregunta.json",
        "src/api/apps/core/fixtures/alternativa.json",
        "src/api/apps/core/fixtures/solucion.json",
    ]
    cov = coverage.Coverage()
    cov.start()
    context.cov = cov


def after_all(context):
    cov = context.cov
    cov.stop()
    cov.save()
    cov.html_report(directory="./cov")
