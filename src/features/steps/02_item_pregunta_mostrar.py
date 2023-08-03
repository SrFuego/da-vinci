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
Curso = apps.get_model("core", "Curso")
Tema = apps.get_model("core", "Tema")
Solucion = apps.get_model("core", "Solucion")

# Flujo Pregunta Aleatoria


@given("un usuario en el home de la App Da Vinci")
def usuario_en_el_home(context):
    pass


@given('selecciona "Pregunta Individual"')
def selecciona_pregunta_individual(context):
    pass


@given('le muestra "Pregunta Aleatoria" y "Elegir Curso"')
def pantalla_de_opciones(context):
    pass


@when('selecciona "Pregunta Aleatoria"')
def selecciona_pregunta_aleatoria(context):
    pass


@then("le muestra un problema de admisión y sus alternativas")
def muestra_problema_de_admision(context):
    response = context.test.client.get(reverse("api_v1:mostrar_pregunta-list"))
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.response_data = response.data


@then("el Curso (puede ser cualquiera)")
def muestra_el_curso(context):
    curso_response = Curso.objects.get(
        nombre=context.response_data["curso"]["nombre"]
    )
    context.test.assertTrue(curso_response is not None)
    context.test.assertIn("curso", context.response_data)
    context.test.assertTrue(len(context.response_data["curso"]) > 0)
    context.curso_response = curso_response


@then("el Tema (puede ser cualquiera del Curso)")
def muestra_el_tema(context):
    tema_response = Tema.objects.get(
        nombre=context.response_data["tema"]["nombre"]
    )
    context.test.assertTrue(tema_response is not None)
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(len(context.response_data["tema"]) > 0)
    context.test.assertIn(tema_response, context.curso_response.tema_set.all())
