import logging
import random
from http import HTTPStatus

from behave import given, then, when

logger = logging.getLogger(__name__)


@given("que abro la App")
def step_impl(context):
    logger.info("App opened.")


@given("que hay preguntas disponibles en la base de datos")
def step_impl(context):
    context.examen = context.examen_de_admision_model.objects.first()
    context.curso = context.curso_model.objects.first()
    context.tema = context.tema_model.objects.first()
    context.pregunta = context.pregunta_model.objects.first()
    logger.info("Test data verified in database")


@when('selecciono "¡Sorpréndeme!"')
def step_impl(context):
    url = context.PREGUNTA_INDIVIDUAL_URL
    context.response = context.client.get(url)
    logger.info(
        f"Request made to {url},"
        f"response status: {context.response.status_code}"
    )


@then("debo ver una pregunta de examen de admisión")
def step_impl(context):
    assert context.response.status_code == HTTPStatus.OK
    context.data = context.response.json()


@then("la pregunta debe contener un enunciado")
def step_impl(context):
    assert "enunciado" in context.data
    assert len(context.data["enunciado"]) > 0


@then("la pregunta debe tener alternativas")
def step_impl(context):
    assert "alternativas" in context.data
    assert len(context.data["alternativas"]) > 0


@then("debo ver el curso al que pertenece")
def step_impl(context):
    assert "curso" in context.data["tema"]
    assert context.data["tema"]["curso"]["nombre"]


@then("debo ver el tema específico")
def step_impl(context):
    assert "tema" in context.data
    assert context.data["tema"]["nombre"]


# ++++++++++++++++++++++++++++++++++++++++++++++


@when('selecciono "Una por Una"')
def step_impl(context):
    url = context.CURSO_URL
    context.response = context.client.get(url)
    assert context.response.status_code == HTTPStatus.OK
    logger.info(
        f"Request made to {url},"
        f"response status: {context.response.status_code}"
    )


@then("debo ver una lista de cursos habilitados")
def step_impl(context):
    cursos = context.response.json()
    assert len(cursos) > 0
    logger.info(f"Found {len(cursos)} enabled Cursos")


@when("selecciono un curso específico")
def step_impl(context):
    cursos = context.response.json()
    context.curso_seleccionado = random.choice(cursos)
    url = context.TEMA_URL.format(context.curso_seleccionado["slug"])
    context.response = context.client.get(url)
    assert context.response.status_code == HTTPStatus.OK
    logger.info(f"Selected course: {context.curso_seleccionado['nombre']}")


@then("debo ver una lista de temas habilitados")
def step_impl(context):
    temas = context.response.json()
    assert len(temas) > 0
    logger.info(f"Found {len(temas)} enabled Temas")


@when('selecciono "Tema Aleatorio"')
def step_impl(context):
    url = f"{context.PREGUNTA_INDIVIDUAL_URL}"
    url += f"?curso={context.curso_seleccionado['slug']}"
    context.response = context.client.get(url)
    logger.info(
        f"Random question requested for course: {context.curso_seleccionado['nombre']}"
    )


@then("el curso debe corresponder al seleccionado")
def step_impl(context):
    assert (
        context.data["tema"]["curso"]["slug"]
        == context.curso_seleccionado["slug"]
    )
    logger.info("Course match verified")


@then("el tema debe ser uno válido del curso seleccionado")
def step_impl(context):
    assert (
        context.data["tema"]["curso"]["slug"]
        == context.curso_seleccionado["slug"]
    )
    logger.info("Topic belongs to selected course")


# ++++++++++++++++++++++++++++++++++++++++++++++


@when("selecciono un tema específico")
def step_impl(context):
    temas = context.response.json()
    context.tema_seleccionado = random.choice(temas)
    url = f"{context.PREGUNTA_INDIVIDUAL_URL}"
    url += f"?tema={context.tema_seleccionado['slug']}"
    context.response = context.client.get(url)
    logger.info(f"Selected topic: {context.tema_seleccionado['nombre']}")


@then("el tema debe corresponder al seleccionado")
def step_impl(context):
    assert context.data["tema"]["slug"] == context.tema_seleccionado["slug"]
    logger.info("Topic match verified")
