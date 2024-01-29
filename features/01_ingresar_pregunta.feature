# language: es

Característica: Ingresar pregunta
  Como administrador en el backoffice
  Quiero ingresar una pregunta de un examen de admisión
  Para que se muestre a los usuarios de Da Vinci

  Esquema del escenario: Base de datos de preguntas
    Dado un administrador autenticado dentro del backoffice
    Cuando ingresa <pregunta>
    Y agrega <cantidad_de_alternativas>
    Y agrega alternativas la cantidad de veces ingresada
    Entonces le muestra "pregunta ingresada"
    Y se muestra en la App para los usuarios

    Ejemplos: Tipos de evaluacion
      | pregunta       | cantidad_de_alternativas | alternativas |
      | Cuanto es 2+2? | 3                        | 2,3,4        |
