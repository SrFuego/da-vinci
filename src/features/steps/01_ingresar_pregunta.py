from behave import given, when, then


@given("un administrador autenticado dentro del backoffice")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Given un administrador autenticado dentro del backoffice"
    # )
    pass


@when("ingresa {pregunta}")
def step_impl(context, pregunta):
    # raise NotImplementedError('STEP: When ingresa "Cuanto es 2+2?"')
    pass


@when("agrega {cantidad_de_alternativas}")
def step_impl(context, cantidad_de_alternativas):
    # raise NotImplementedError('STEP: When agrega "{pregunta_1}"')
    pass


@when(
    "va agregando las alternativas una por una la cantidad de veces ingresada"
)
def step_impl(context, alternativas):
    # raise NotImplementedError(
    #     'STEP: When agrega "2,3,4" la cantidad de veces ingresada'
    # )
    pass


@then('le muestra "pregunta ingresada"')
def step_impl(context):
    # raise NotImplementedError(u'STEP: Then le muestra "pregunta ingresada"')
    pass


@then("se muestra en la App para los usuarios")
def step_impl(context):
    # raise NotImplementedError(
    #     "STEP: Then se muestra en la App para los usuarios"
    # )
    pass
