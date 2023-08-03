from behave import given, when, then

# Esquema del escenario: Página web


@given("un humano en un navegador web")
def step_impl(context):
    # raise NotImplementedError("STEP: Given un humano en un navegador web")
    pass


@when("abre davinci.srfuego.dev")
def step_impl(context):
    # raise NotImplementedError("STEP: When abre davinci.srfuego.dev")
    pass


@then("puede ver {contenido}")
def step_impl(context, contenido):
    # raise NotImplementedError('STEP: Then puede ver "{contenido}"')
    pass


# Esquema del escenario: Descargar Da Vinci


@given("un humano en la landing page de Da Vinci")
def step_impl(context):
    # raise NotImplementedError("STEP: Given un humano en la landing page de Da Vinci")
    pass


@when("hago clic en el botón de descarga para {sistema_operativo}")
def step_impl(context, sistema_operativo):
    # raise NotImplementedError(
    #     'STEP: When hago clic en el botón de descarga para "{sistema_operativo}"'
    # )
    pass


@then("es redirigido a la página de descarga de la App en {store}")
def step_impl(context, store):
    # raise NotImplementedError(
    #     'STEP: Then es redirigido a la página de descarga de la App en "{store}"'
    # )
    pass
