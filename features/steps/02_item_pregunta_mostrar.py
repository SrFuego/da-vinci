# Python imports
import random


# Django imports


# Third party apps imports
from behave import given, when, then


# Local imports


# Create your tests here.


@given("un usuario en el home de la App Da Vinci")
def step_impl(context):
    pass


@given('selecciona "Pregunta Individual"')
def step_impl(context):
    pass


@given('le muestra "Curso Aleatorio" con la "Lista de Cursos"')
def step_impl(context):
    response = context.test.client.get(context.CURSO_URL)
    context.test.assertEqual(response.status_code, 200)
    # context.test.assertIn("cursos", response.data)
    context.lista_cursos = response.json()


# Flujo Pregunta Individual Aleatoria


@when('selecciona "Curso Aleatorio"')
def step_impl(context):
    pass


@then("le muestra un problema aleatorio y sus alternativas")
def step_impl(context):
    response = context.test.client.get(
        context.PREGUNTA_INDIVIDUAL_URL,
    )
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.response_data = response.data


@then("el Curso (puede ser cualquiera)")
def step_impl(context):
    context.test.assertIn("curso", context.response_data["tema"])
    context.test.assertTrue(
        len(context.response_data["tema"]["curso"]) > 0,
    )
    curso_response = context.curso_model.objects.get(
        nombre=context.response_data["tema"]["curso"]["nombre"]
    )
    context.curso_response = curso_response


@then("el Tema (puede ser cualquiera del Curso)")
def step_impl(context):
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(
        len(context.response_data["tema"]) > 0,
    )
    tema_response = context.tema_model.objects.get(
        nombre=context.response_data["tema"]["nombre"]
    )
    context.test.assertIn(
        tema_response,
        context.curso_response.tema_set.all(),
    )


@then(
    "el examen de admisión en el que vino esa pregunta (institución, año, etc)"
)
def step_impl(context):
    # TODO: cuando hayan preguntas de examen de admisión
    pass


# Flujo Pregunta Individual por un Curso


@when('selecciona "un Curso"')
def step_impl(context):
    curso_aleatorio = context.curso_model.objects.get(
        slug=random.choice(context.lista_cursos)["slug"],
    )
    context.curso_aleatorio = curso_aleatorio


@when('le muestra "Tema Aleatorio" con la "Lista de Temas del Curso"')
def step_impl(context):
    response = context.test.client.get(
        context.TEMA_URL.format(
            context.curso_aleatorio.slug,
        )
    )
    context.test.assertEqual(response.status_code, 200)
    context.lista_temas = response.json()
    queryset_temas_del_curso = context.curso_aleatorio.tema_set.all()
    for tema in context.lista_temas:
        context.test.assertIn(
            tema["slug"],
            list(
                queryset_temas_del_curso.values_list(
                    "slug",
                    flat=True,
                ),
            ),
        )


@when('selecciona "Tema Aleatorio"')
def step_impl(context):
    pass


@then("le muestra un problema del curso y sus alternativas")
def step_impl(context):
    response = context.test.client.get(
        "{}?curso={}".format(
            context.PREGUNTA_INDIVIDUAL_URL,
            context.curso_aleatorio.slug,
        )
    )
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.curso_seleccionado = context.curso_model.objects.get(
        slug=context.curso_aleatorio.slug
    )
    context.response_data = response.data


@then("el Curso (el que seleccionó)")
def step_impl(context):
    # context.test.assertIn("curso", context.response_data)
    context.test.assertTrue(
        len(context.response_data["tema"]["curso"]) > 0,
    )
    context.test.assertEquals(
        context.curso_seleccionado.nombre,
        context.response_data["tema"]["curso"]["nombre"],
    )


@then("el Tema (cualquiera del Curso seleccionado)")
def step_impl(context):
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(
        len(context.response_data["tema"]) > 0,
    )
    tema_response = context.tema_model.objects.get(
        nombre=context.response_data["tema"]["nombre"]
    )
    context.test.assertIn(
        tema_response, context.curso_seleccionado.tema_set.all()
    )


# Flujo Pregunta Individual por un Tema


@when('selecciona "un Tema"')
def step_impl(context):
    tema_aleatorio = random.choice(context.lista_temas)
    context.tema_aleatorio_slug = tema_aleatorio["slug"]


@then("le muestra un problema del tema y sus alternativas")
def step_impl(context):
    response = context.test.client.get(
        "{}?tema={}".format(
            context.PREGUNTA_INDIVIDUAL_URL,
            context.tema_aleatorio_slug,
        )
    )
    context.test.assertEqual(response.status_code, 200)
    context.test.assertIn("enunciado", response.data)
    context.test.assertIn("alternativas", response.data)
    context.tema_seleccionado = context.tema_model.objects.get(
        slug=context.tema_aleatorio_slug
    )
    context.curso_seleccionado = context.tema_seleccionado.curso
    context.test.assertIn("tema", response.data)
    context.test.assertEqual(
        response.data["tema"]["slug"],
        context.tema_aleatorio_slug,
    )
    context.test.assertEqual(
        response.data["tema"]["nombre"],
        context.tema_seleccionado.nombre,
    )
    context.response_data = response.data


@then("el Tema (el que seleccionó)")
def step_impl(context):
    context.test.assertIn("tema", context.response_data)
    context.test.assertTrue(len(context.response_data["tema"]) > 0)
    context.test.assertEquals(
        context.tema_seleccionado.nombre,
        context.response_data["tema"]["nombre"],
    )
    context.test.assertEquals(
        context.curso_seleccionado,
        context.tema_seleccionado.curso,
    )
