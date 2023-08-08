# language: es

Característica: Resolver pregunta individual
  Como usuario que desea resolver problemas
  Quiero resolver un problema de examen de admisión
  Para probar y mejorar mis conocimientos académicos

  Esquema del escenario: Flujo de enviar respuesta y mostrar solución
    Dado que le muestra una pregunta: <pregunta>
    Y sus alternativas: <alternativas>
    Y una de ellas es la correcta: <correcta>
    Cuando selecciona una alternativa
    Entonces la envía y se evalúa su <respuesta>
    Y la califica con el puntaje relacionado a: <pregunta>
    Y muestra teoría del tema o temas relacionados
    Y muestra una resolución con procedimiento
    Y muestra un botón: "pasar a la siguiente pregunta"

  Ejemplos: Bateria de preguntas
    | pregunta       | alternativas | correcta | respuesta |
    | Cuanto es 2+2? | 2,3,4,5,6    | 4        | 2         |
    | Cuanto es 2+2? | 2,3,4,5,6    | 4        | 3         |
    | Cuanto es 2+2? | 2,3,4,5,6    | 4        | 4         |
    | Cuanto es 2+2? | 2,3,4,5,6    | 4        | 5         |
    | Cuanto es 2+2? | 2,3,4,5,6    | 4        | 6         |
