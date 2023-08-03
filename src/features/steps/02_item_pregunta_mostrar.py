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

# Flujo Pregunta Aleatoria


@given("un usuario en el home de la App Da Vinci")
def usuario_en_el_home(context):
    # raise NotImplementedError(
    #     "STEP: Given un usuario en el home de la App Da Vinci"
    # )
    pass


@given('selecciona "Pregunta Individual"')
def selecciona_pregunta_individual(context):
    # raise NotImplementedError('STEP: Given selecciona "Pregunta Individual"')
    pass


@given('le muestra "Pregunta Aleatoria" y "Elegir Curso"')
def pantalla_de_opciones(context):
    # raise NotImplementedError(
    #     'STEP: Given le muestra "Pregunta Aleatoria" y "Elegir Curso"'
    # )
    pass


@when('selecciona "Pregunta Aleatoria"')
def selecciona_pregunta_aleatoria(context):
    # raise NotImplementedError('STEP: When selecciona "Pregunta Aleatoria"')
    pass


@then("le muestra un problema de admisión y sus alternativas")
def muestra_problema_de_admision(context):
    response = context.test.client.get(reverse("api_v1:mostrar_pregunta-list"))
    context.response_data = response.data
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)


@then("el Curso (puede ser cualquiera)")
def muestra_el_curso(context):
    # context.test.assertIn("curso", context.response_data)
    pass
    # "curso" tiene data
    # Curso existe en la DB


@then("el Tema (puede ser cualquiera del Curso)")
def muestra_el_tema(context):
    # context.test.assertIn("tema", context.response_data)
    pass
    # "tema" tiene data
    # Tema existe en la DB
    # Tema pertenece al Curso
