# language: es

Característica: Seleccionar evaluacion
Como postulante que desea ingresar a San Marcos
Quiero seleccionar como se me van a presentar las preguntas
Para resolver de acuerdo a mi tiempo disponible un examen completo o preguntas sueltas

Esquema del escenario: Navegar por las opciones

Dado un usuario en el home de la App Da Vinci
Cuando selecciona "<opcion>"
Entonces le muestra "<ejercicios>"

Ejemplos: Tipos de evaluación
| opcion        | ejercicios                             |
| 1x1           | una pregunta con sus alternativas      |
| examen pasado | un examen de admisión de 100 preguntas |







# Escenario: Responder preguntas indefinidamente (1x1)
# Dado que estoy en el home de la App
# Y selecciono la opción de preguntas aleatorias 1x1
# Cuando resuelvo una pregunta
# Y selecciono una alternativa
# Y envío mi respuesta
# Entonces evalúa mi respuesta
# Y la califica con el puntaje de la pregunta
# Y muestra teoria del tema o temas relacionados
# Y muestra una resolucion con procedimiento
# Y muestra "pasar a la siguiente pregunta"
