# Python imports
import random


# Django imports


# Third party apps imports
from behave import given, when, then


# Local imports


# Create your tests here.


@given("un usuario en el home de la App Da Vinci")
def usuario_en_el_home(context):
    pass


@given('selecciona "Pregunta Individual"')
def selecciona_pregunta_individual(context):
    pass


@given('le muestra "Pregunta Aleatoria" y "Elegir Curso"')
def pantalla_de_opciones(context):
    pass


# Flujo Pregunta Individual Aleatoria


@when('selecciona "Pregunta Aleatoria"')
def selecciona_pregunta_aleatoria(context):
    pass


@then("le muestra un problema aleatorio y sus alternativas")
def muestra_problema_aleatorio_de_admision(context):
    response = context.test.client.get(context.PREGUNTA_ALEATORIA_URL)
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.response_data = response.data


@then("el Curso (puede ser cualquiera)")
def muestra_el_curso(context):
    context.test.assertIn("curso", context.response_data)
    context.test.assertTrue(len(context.response_data["curso"]) > 0)
    curso_response = context.curso_model.objects.get(
        nombre=context.response_data["curso"]["nombre"]
    )
    context.curso_response = curso_response


@then("el Tema (puede ser cualquiera del Curso)")
def muestra_el_tema(context):
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(len(context.response_data["tema"]) > 0)
    tema_response = context.tema_model.objects.get(
        nombre=context.response_data["tema"]["nombre"]
    )
    context.test.assertIn(tema_response, context.curso_response.tema_set.all())


@then(
    "el examen de admisión en el que vino esa pregunta (institución, año, etc)"
)
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Then el examen de admisión en el que vino"
    #     " esa pregunta (institución, año, etc)"
    # )
    # TODO: Mostrar examen de admisión
    pass


# Flujo Pregunta Individual por Curso


@when('que selecciona "Elegir Curso"')
def selecciona_elegir_curso(context):
    pass


@when("le muestra la lista de Cursos")
def muestra_lista_cursos(context):
    response = context.test.client.get(context.CURSO_URL)
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("cursos", response.data)
    context.lista_cursos = response.json()["cursos"]


@when("selecciona un Curso")
def selecciona_un_curso(context):
    curso_aleatorio = random.choice(context.lista_cursos)
    context.curso_aleatorio_id = curso_aleatorio["id"]


@then("le muestra un problema del curso y sus alternativas")
def muestra_problema_del_curso(context):
    response = context.test.client.get(
        "{}{}".format(
            context.PREGUNTA_INDIVIDUAL_POR_CURSO_URL,
            context.curso_aleatorio_id,
        )
    )
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.curso_seleccionado = context.curso_model.objects.get(
        id=context.curso_aleatorio_id
    )
    context.response_data = response.data


# @when('le da al botón: "Enviar"')
# def step_impl(context):
#     # raise NotImplementedError('STEP: When le da al botón: "Enviar"')
#     pass


@then("el Curso (el que seleccionó)")
def muestra_el_curso_seleccionado(context):
    context.test.assertIn("curso", context.response_data)
    context.test.assertTrue(len(context.response_data["curso"]) > 0)
    context.test.assertEquals(
        context.curso_seleccionado.nombre,
        context.response_data["curso"]["nombre"],
    )


@then("el Tema (cualquiera del Curso seleccionado)")
def muestra_el_tema_y_es_del_curso(context):
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(len(context.response_data["tema"]) > 0)
    tema_response = context.tema_model.objects.get(
        nombre=context.response_data["tema"]["nombre"]
    )
    context.test.assertIn(
        tema_response, context.curso_seleccionado.tema_set.all()
    )
