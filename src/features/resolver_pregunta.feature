# language: es

Característica: Resolver pregunta
Como postulante que desea ingresar a San Marcos
Quiero resolver un problema de admisión
Para probar y mejorar mis conocimientos

Esquema del escenario: Responder preguntas indefinidamente (1x1)

Dado que seleccionó la opción: "Preguntas 1x1"
Y le muestra una pregunta: <pregunta>
Y sus alternativas: <alternativas>, una es la <correcta>
Cuando selecciona una alternativa
Y envía <respuesta>
Entonces evalúa <respuesta>
Y la califica con el puntaje relacionado a la pregunta
Y muestra teoría del tema o temas relacionados
Y muestra una resolución con procedimiento
Y muestra boton: "pasar a la siguiente pregunta"

Ejemplos: Bateria de preguntas
| pregunta       | alternativas | correcta | respuesta |
| Cuanto es 2+2? | 2,3,4,5,6    | 4        | 2         |
| Cuanto es 2+2? | 2,3,4,5,6    | 4        | 3         |
| Cuanto es 2+2? | 2,3,4,5,6    | 4        | 4         |
| Cuanto es 2+2? | 2,3,4,5,6    | 4        | 5         |
| Cuanto es 2+2? | 2,3,4,5,6    | 4        | 6         |
