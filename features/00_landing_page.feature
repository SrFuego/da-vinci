# language: es

Característica: Landing page
  Como usuario interesado en ingresar a una universidad de Perú
  Quiero ver la landing page de Da Vinci
  Para obtener información sobre la plataforma, los servicios que ofrece y descargar la App

  Esquema del escenario: Página web
    Dado un humano en un navegador web
    Cuando abre davinci.srfuego.dev
    Entonces puede ver <contenido>

    Ejemplos: Contenidos de la Página web
      | contenido                                                             |
      | el logotipo de Da Vinci                                               |
      | un título que dice "Prepárate para el éxito universitario"            |
      | una breve descripción de la App, destacando sus ventajas y beneficios |
      | una sección con testimonios de usuarios satisfechos                   |
      | los proximos examenes de admision                                     |
      | screenshots de la App                                                 |
      | links de instalacion para Android                                     |
      | links de instalacion para iOS                                         |

  Esquema del escenario: Descargar Da Vinci
    Dado un humano en la landing page de Da Vinci
    Cuando hago clic en el botón de descarga para <sistema_operativo>
    Entonces es redirigido a la página de descarga de la App en <store>

    Ejemplos: Fuentes de descarga
      | sistema_operativo | store       |
      | Android           | Google Play |
      | iOS               | App Store   |
