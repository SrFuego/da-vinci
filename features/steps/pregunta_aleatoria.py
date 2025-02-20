import logging
from http import HTTPStatus

from behave import given, then, when

logger = logging.getLogger(__name__)


@given("que abro la App")
def step_impl(context):
    logger.info("App opened.")


@given("que hay preguntas disponibles en la base de datos")
def step_impl(context):
    logger.info("Ensuring questions are available in the database.")


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
