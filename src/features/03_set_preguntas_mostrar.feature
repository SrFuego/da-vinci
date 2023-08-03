# # language: es

# Característica: Mostrar un conjunto de preguntas
#   Como usuario que desea practicar un curso o tema específico
#   Quiero resolver problemas de examen de admisión
#   Para probar y mejorar mis conocimientos en esa rama del conocimiento

#   Antecedentes:
#     Dado un usuario en el home de la App Da Vinci
#     Y selecciona "Set de Preguntas"
#     Y selecciona la cantidad de preguntas: 4, 6 u 8
#     Y le muestra "Curso Aleatorio" y "Elegir Curso"

#   Escenario: Curso Aleatorio
#     Dado que selecciona "Curso Aleatorio"
#     Cuando le da al botón: "Enviar"
#     Entonces le muestra un conjunto de preguntas de admisión
#     Y sus respectivas alternativas
#     Y las preguntas pertenecen a un mismo curso
#     Y los temas son del mismo curso aleatorio

#   Escenario: Curso elegido, tema random
#     Dado que selecciona "Elegir Curso"
#     Cuando le da al botón: "Enviar"
#     Y le muestra la lista de Cursos
#     Y selecciona un Curso
#     Y le da al botón: "Enviar"
#     Y le muestra "Tema aleatorio" y "Elegir Tema"
#     Y selecciona "Tema Aleatorio"
#     Y le da al botón: "Enviar"
#     Entonces le muestra un conjunto de problemas de admisión
#     Y sus respectivas alternativas
#     Y las preguntas pertenecen al mismo Curso (el que seleccionó)
#     Y los temas son cualquiera del Curso seleccionado

#   Escenario: Curso elegido, tema o temas elegidos
#     Dado que selecciona "Elegir Curso"
#     Cuando le da al botón: "Enviar"
#     Y le muestra la lista de Cursos
#     Y selecciona un Curso
#     Y le da al botón: "Enviar"
#     Y le muestra "Tema aleatorio" y "Elegir Tema"
#     Y selecciona "Elegir Tema"
#     Y le da al botón: "Enviar"
#     Y le muestra la lista de temas de ese Curso
#     Y selecciona el tema o los temas que quiere practicar
#     Y le da al botón: "Empezar Problemas"
#     Entonces le muestra un conjunto de problemas de admisión
#     Y sus respectivas alternativas
#     Y las preguntas pertenecen al mismo Curso (el que seleccionó)
#     Y los temas son cualquiera de los seleccionados
