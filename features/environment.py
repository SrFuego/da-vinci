import coverage


from steps.draft_urls import (
    PREGUNTA_ALEATORIA_URL,
    CURSO_URL,
    PREGUNTA_INDIVIDUAL_POR_CURSO_URL,
    PREGUNTA_INDIVIDUAL_RESOLVER_URL,
)


# def django_ready(context, scenario):
def django_ready(context):
    from django.apps import apps
    from rest_framework.test import APIClient

    context.test.client = APIClient()

    context.PREGUNTA_ALEATORIA_URL = PREGUNTA_ALEATORIA_URL
    context.CURSO_URL = CURSO_URL
    context.PREGUNTA_INDIVIDUAL_POR_CURSO_URL = (
        PREGUNTA_INDIVIDUAL_POR_CURSO_URL
    )
    context.PREGUNTA_INDIVIDUAL_RESOLVER_URL = PREGUNTA_INDIVIDUAL_RESOLVER_URL

    context.pregunta_model = apps.get_model("core", "Pregunta")
    context.examen_de_admision_model = apps.get_model(
        "core", "ExamenDeAdmision"
    )
    context.tema_model = apps.get_model("core", "Tema")
    context.alternativa_model = apps.get_model("core", "Alternativa")
    context.solucion_model = apps.get_model("core", "Solucion")
    context.curso_model = apps.get_model("core", "Curso")


def before_all(context):
    context.fixtures = [
        "api/apps/core/fixtures/universidad.json",
        "api/apps/core/fixtures/area.json",
        "api/apps/core/fixtures/proceso_de_admision.json",
        "api/apps/core/fixtures/carrera.json",
        "api/apps/core/fixtures/examen_de_admision.json",
        "api/apps/core/fixtures/curso.json",
        "api/apps/core/fixtures/tema.json",
        "api/apps/core/fixtures/preguntas_por_curso.json",
        "api/apps/core/fixtures/lectura.json",
        "api/apps/core/fixtures/pregunta.json",
        "api/apps/core/fixtures/alternativa.json",
        "api/apps/core/fixtures/solucion.json",
    ]
    cov = coverage.Coverage()
    cov.start()
    context.cov = cov


def after_all(context):
    cov = context.cov
    cov.stop()
    cov.save()
    cov.html_report(directory="./htmlcov")
