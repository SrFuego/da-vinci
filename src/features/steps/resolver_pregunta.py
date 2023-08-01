# apps/core/models.py
# Python imports


# Django imports
from django.apps import apps
from django.urls import reverse


# Third party apps imports
from behave import given, when, then


# Local imports


# Create your tests here.
Pregunta = apps.get_model("core", "Pregunta")
Alternativa = apps.get_model("core", "Alternativa")
ExamenDeAdmision = apps.get_model("core", "ExamenDeAdmision")
Tema = apps.get_model("core", "Tema")
Solucion = apps.get_model("core", "Solucion")


@given('que seleccionó la opción: "Preguntas 1x1"')
def selecciona_preguntas_1x1(context):
    # raise NotImplementedError(
    #     'STEP: Given que seleccionó la opción: "Preguntas 1x1"'
    # )
    pass


@given("le muestra una pregunta: {pregunta}")
def muestra_una_pregunta_aleatoria(context, pregunta):
    examen_de_admision = ExamenDeAdmision.objects.first()
    tema = Tema.objects.first()
    pregunta_db = Pregunta.objects.create(enunciado=pregunta, tema=tema)
    pregunta_db.examen_de_admision.add(examen_de_admision)

    response = context.test.client.get(reverse("api_v1:mostrar_pregunta-list"))
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertEqual(response.data["enunciado"], pregunta)


@given("sus alternativas: {alternativas}, una es la {correcta}")
def step_impl(context, alternativas, correcta):
    pregunta_aux = Pregunta.objects.first()
    for alternativa in alternativas.split(","):
        alternativa_aux = Alternativa.objects.create(
            respuesta=alternativa, pregunta=pregunta_aux
        )
        if alternativa is correcta:
            Solucion.objects.create(
                pregunta=pregunta_aux,
                alternativa=alternativa_aux,
                nombre="respuesta a: {pregunta_aux}",
                texto="solucionario de la pregunta",
            )
    response = context.test.client.get(reverse("api_v1:mostrar_pregunta-list"))
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("alternativas", response.data)
    context.test.assertEqual(
        ",".join(
            sorted(
                [item["respuesta"] for item in response.data["alternativas"]]
            )
        ),
        alternativas,
    )


@when("selecciona una alternativa")
def selecciona_alternativa_de_pregunta_aleatoria(context):
    # raise NotImplementedError("STEP: When selecciona una alternativa")
    pass


@when("envía {respuesta}")
def envia_respuesta_de_pregunta_aleatoria(context, respuesta):
    alternativa_seleccionada = Alternativa.objects.get(respuesta=respuesta)
    response = context.test.client.post(
        reverse("api_v1:enviar_alternativa_seleccionada-list"),
        {"alternativa_seleccionada_id": alternativa_seleccionada.id},
    )
    context.test.assertEqual(response.status_code, 200)


@then("evalúa {respuesta}")
def evalua_respuesta(context, respuesta):
    # raise NotImplementedError('STEP: Then evalúa {respuesta}')
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


@then('muestra boton: "pasar a la siguiente pregunta"')
def muestra_boton_siguiente_pregunta(context):
    # raise NotImplementedError(
    #     'STEP: Then muestra boton: "pasar a la siguiente pregunta"'
    # )
    pass
