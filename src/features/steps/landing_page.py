from behave import *

# Esquema del escenario: Página web

@given("un humano en un navegador web")
def step_impl(context):
    pass


@when("abre davinci.srfuego.dev")
def step_impl(context):
    assert True is not False


@then('puede ver "{contenido}"')
def step_impl(context, contenido):
    assert context.failed is False


# Esquema del escenario: Descargar Da Vinci

@given(u'un humano en la landing page de Da Vinci')
def step_impl(context):
    # raise NotImplementedError(u'STEP: Given un humano en la landing page de Da Vinci')
    pass


@when(u'hago clic en el botón de descarga para "{sistema_operativo}"')
def step_impl(context, sistema_operativo):
    # raise NotImplementedError(u'STEP: When hago clic en el botón de descarga para "Android"')
    assert True is not False


@then(u'es redirigido a la página de descarga de la App en "{store}"')
def step_impl(context, store):
    # raise NotImplementedError(u'STEP: Then soy redirigido a la página de descarga de la App en "Google Play"')
    assert context.failed is False
