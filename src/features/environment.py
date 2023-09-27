import coverage
from rest_framework.test import APIClient


# def django_ready(context, scenario):
def django_ready(context):
    context.test.client = APIClient()
    context.api_localhost = "http://localhost:8000/api/v1/"


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
