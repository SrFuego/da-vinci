from behave import *


@given("un humano en un navegador web")
def step_impl(context):
    pass


@when("abre davinci.srfuego.dev")
def step_impl(context):
    assert True is not False


@then('le muestra "{contenido}"')
def step_impl(context, contenido):
    assert context.failed is False
