# apps/core/models.py
# Python imports


# Django imports
from django.urls import reverse


# Third party apps imports
from behave import given, when, then


# Local imports


# Create your tests here.
@given("que seleccionó la opción de preguntas aleatorias 1x1")
def selecciona_preguntas_1x1(context):
    # raise NotImplementedError(
    #     "STEP: Given que seleccionó la opción de preguntas aleatorias 1x1"
    # )
    pass


@given('le muestra "{pregunta}"')
def muestra_una_pregunta_aleatoria(context, pregunta):
    response = context.test.client.get(reverse("api_v1:pregunta-list"))
    print(pregunta)
    print(type(context))
    print(dir(context))
    print(context.table)
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data[0])
    context.test.assertIn("alternativas", response.data[0])
    # context.test.assertEqual(response.status_code, 404)


@when('resuelve "{pregunta_1}"')
def resuelve_pregunta_aleatoria(context, pregunta_1):
    # raise NotImplementedError('STEP: When resuelve "{pregunta_1}"')
    pass


@when("selecciona una alternativa")
def selecciona_alternativa_de_pregunta_aleatoria(context):
    # raise NotImplementedError("STEP: When selecciona una alternativa")
    pass


@when('envía "{respuesta_1}"')
def envia_respuesta_de_pregunta_aleatoria(context, respuesta_1):
    # raise NotImplementedError('STEP: When envía "{respuesta_1}"')
    pass


@then('evalúa "{respuesta_1}"')
def evalua_respuesta(context, respuesta_1):
    # raise NotImplementedError('STEP: Then evalúa "{respuesta_1}"')
    pass


@then("la califica con el puntaje relacionado a la pregunta")
def califica_respuesta(context):
    # raise NotImplementedError(
    #     "STEP: Then la califica con el puntaje relacionado a la pregunta"
    # )
    pass


@then("muestra teoría del tema o temas relacionados")
def muestra_teoria_de_respuesta(context):
    # raise NotImplementedError(
    #     "STEP: Then muestra teoría del tema o temas relacionados"
    # )
    pass


@then("muestra una resolución con procedimiento")
def muestra_solucion_de_respuesta(context):
    # raise NotImplementedError(
    #     "STEP: Then muestra una resolución con procedimiento"
    # )
    pass


@then('muestra "pasar a la siguiente pregunta"')
def muestra_boton_siguiente_pregunta(context):
    # raise NotImplementedError(
    #     'STEP: Then muestra "pasar a la siguiente pregunta"'
    # )
    pass
