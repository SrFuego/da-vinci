# language: es

Característica: Resolver pregunta
Como postulante que desea ingresar a San Marcos
Quiero resolver un problema de admisión
Para probar y mejorar mis conocimientos

Esquema del escenario: Responder preguntas indefinidamente (1x1)

Dado que seleccionó la opción de preguntas aleatorias 1x1
Y le muestra "<pregunta>"
# | Cuanto es 2+2? | 4         |
Cuando resuelve "<pregunta>"
Y selecciona una alternativa
Y envía "<respuesta>"
Entonces evalúa "<respuesta>"
Y la califica con el puntaje relacionado a la pregunta
Y muestra teoría del tema o temas relacionados
Y muestra una resolución con procedimiento
Y muestra "pasar a la siguiente pregunta"

Ejemplos: Bateria de preguntas
| pregunta       | respuesta |
| Cuanto es 2+2? | 4         |
