"""Establecer un primer contacto feature tests."""

from pytest_bdd import (
    given,
    scenario,
    then,
    when,
)


@scenario("../features/primer_contacto.feature", "Landing page")
def test_landing_page():
    """Landing page."""


@given("una persona en un navegador web")
def _():
    """una persona en un navegador web."""
    # raise NotImplementedError
    pass


@when("abre davinci.srfuego.dev")
def _():
    """abre davinci.srfuego.dev."""
    # raise NotImplementedError
    pass


@then(
    "se le muestra informacion de los proximos examenes de admision, screenshots de la App y links de instalacion para Android y iOS, etc"
)
def _():
    """se le muestra informacion de los proximos examenes de admision, screenshots de la App y links de instalacion para Android y iOS, etc."""
    # raise NotImplementedError
    pass
