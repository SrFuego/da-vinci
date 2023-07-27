from behave import given, when, then


@given("que seleccionó la opción de preguntas aleatorias 1x1")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Given que seleccionó la opción de preguntas aleatorias 1x1"
    # )
    pass


@given('le muestra "{pregunta_1}"')
def step_impl(context, pregunta_1):
    # raise NotImplementedError('STEP: Given le muestra "{pregunta_1}"')
    pass


@when('resuelve "{pregunta_1}"')
def step_impl(context, pregunta_1):
    # raise NotImplementedError('STEP: When resuelve "{pregunta_1}"')
    pass


@when("selecciona una alternativa")
def step_impl(context):
    # raise NotImplementedError("STEP: When selecciona una alternativa")
    pass


@when('envía "{respuesta_1}"')
def step_impl(context, respuesta_1):
    # raise NotImplementedError('STEP: When envía "{respuesta_1}"')
    pass


@then('evalúa "{respuesta_1}"')
def step_impl(context, respuesta_1):
    # raise NotImplementedError('STEP: Then evalúa "{respuesta_1}"')
    pass


@then("la califica con el puntaje relacionado a la pregunta")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Then la califica con el puntaje relacionado a la pregunta"
    # )
    pass


@then("muestra teoría del tema o temas relacionados")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Then muestra teoría del tema o temas relacionados"
    # )
    pass


@then("muestra una resolución con procedimiento")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Then muestra una resolución con procedimiento"
    # )
    pass


@then('muestra "pasar a la siguiente pregunta"')
def step_impl(context):
    # raise NotImplementedError(
    #     'STEP: Then muestra "pasar a la siguiente pregunta"'
    # )
    pass
