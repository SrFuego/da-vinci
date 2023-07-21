Feature: Establecer un primer contacto

    Antes de que entren a la App deben conocernos por algun lado sea: redes sociales, una landing page, publicidad, etc y luego se instalan la App

    Scenario: Landing page

        Given una persona en un navegador web
        When abre davinci.srfuego.dev
        Then se le muestra informacion de los proximos examenes de admision, screenshots de la App y links de instalacion para Android y iOS, etc