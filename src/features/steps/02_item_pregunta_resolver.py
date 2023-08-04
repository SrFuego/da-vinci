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


@given("que le muestra una pregunta: {pregunta}")
def le_muestra_una_pregunta(context, pregunta):
    examen_de_admision = ExamenDeAdmision.objects.first()
    tema = Tema.objects.first()
    for pregunta_aux in Pregunta.objects.all():
        pregunta_aux.delete()
    pregunta_db = Pregunta.objects.create(enunciado=pregunta, tema=tema)
    pregunta_db.examenes_de_admision.add(examen_de_admision)
    context.pregunta_db = pregunta_db


@given("sus alternativas: {alternativas}")
def le_muestra_sus_alternativas(context, alternativas):
    for alternativa in alternativas.split(","):
        Alternativa.objects.create(
            valor=alternativa, pregunta=context.pregunta_db
        )
    context.alternativas_from_UI = alternativas


@given("una de ellas es la correcta: {correcta}")
def una_de_sus_alternativas_es_correcta(context, correcta):
    for alternativa in context.pregunta_db.alternativas:
        if alternativa.valor is correcta:
            Solucion.objects.create(
                pregunta=context.pregunta_db,
                alternativa_correcta=alternativa,
                resolucion="solucionario de la pregunta",
                teoria="teoria de la pregunta",
            )
    response = context.test.client.get(reverse("api_v1:mostrar_pregunta-list"))
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.test.assertEqual(
        ",".join(
            sorted([item["valor"] for item in response.data["alternativas"]])
        ),
        context.alternativas_from_UI,
    )
    context.test.assertEqual(
        response.data["enunciado"], context.pregunta_db.enunciado
    )


@when("selecciona una alternativa")
def selecciona_una_alternativa(context):
    # raise NotImplementedError("STEP: When selecciona una alternativa")
    pass


@when("la envía como {respuesta}")
def la_envia_como_respuesta(context, respuesta):
    alternativa_seleccionada = Alternativa.objects.get(valor=respuesta)
    data = {"alternativa_seleccionada_id": alternativa_seleccionada.id}
    response = context.test.client.post(
        reverse("api_v1:enviar_alternativa_seleccionada-list"), data
    )
    context.test.assertEqual(response.status_code, 200)
    context.response_data = response.data


@then("se evalúa su {respuesta}")
def se_evalua_su_respuesta(context, respuesta):
    context.test.assertIn("alternativa_enviada", context.response_data)
    context.test.assertIn("solucion", context.response_data)
    context.test.assertIn(
        "alternativa_correcta", context.response_data["solucion"]
    )
    context.test.assertIn("es_correcta", context.response_data)


@then("la califica con el puntaje relacionado a: {pregunta}")
def califica_su_respuesta_con_el_puntaje_de_la_pregunta(context, pregunta):
    context.test.assertIn("puntaje_obtenido", context.response_data)


@then("muestra teoría del tema o temas relacionados")
def muestra_teoria_de_respuesta(context):
    context.test.assertIn("teoria", context.response_data["solucion"])


@then("muestra una resolución con procedimiento")
def muestra_solucion_de_respuesta(context):
    context.test.assertIn("resolucion", context.response_data["solucion"])


@then('muestra un botón: "pasar a la siguiente pregunta"')
def muestra_boton_siguiente_pregunta(context):
    # raise NotImplementedError(
    #     'STEP: Then muestra un botón: "pasar a la siguiente pregunta"'
    # )
    pass
