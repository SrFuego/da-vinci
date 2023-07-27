# language: es

Característica: Seleccionar evaluacion
Como usuario que desea resolver problemas
Quiero seleccionar como se me van a presentar las preguntas
Para elegir resolver un examen completo o preguntas sueltas

Esquema del escenario: Navegar por las opciones

Dado un usuario en el home de la App Da Vinci
Cuando selecciona "<opcion>"
Entonces le muestra "<ejercicios>"

Ejemplos: Tipos de evaluación
| opcion        | ejercicios                             |
| 1x1           | una pregunta con sus alternativas      |
| examen pasado | un examen de admisión de 100 preguntas |
