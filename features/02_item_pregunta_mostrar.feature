# language: es

# ## Entra en Evaluacion 1x1
# - Muestra PEA con sus alternativas
# - Responde la PEA, envia la respuesta
# - Luego sale si es acierto o error
# - Despues sale la Solucion detallada de la PEA
# >Sigue esa misma secuencia


Característica: Mostrar una pregunta individual
  Como usuario que desea resolver problemas
  Quiero resolver un problema de examen de admisión
  Para probar y mejorar mis conocimientos académicos

  Antecedentes:
    Dado un usuario en el home de la App Da Vinci
    Y selecciona "Pregunta Individual"
    Y le muestra "Curso Aleatorio" con la "Lista de Cursos"

  Escenario: Pregunta Individual Curso Aleatorio
    Cuando selecciona "Curso Aleatorio"
    Entonces le muestra un problema aleatorio y sus alternativas
    Y el Curso (puede ser cualquiera)
    Y el Tema (puede ser cualquiera del Curso)
    Y el examen de admisión en el que vino esa pregunta (institución, año, etc)

  Escenario: Pregunta Individual de un Curso, Tema aleatorio
    Cuando selecciona "un Curso"
    Y le muestra "Tema Aleatorio" con la "Lista de Temas del Curso"
    Y selecciona "Tema Aleatorio"
    Entonces le muestra un problema del curso y sus alternativas
    Y el Curso (el que seleccionó)
    Y el Tema (cualquiera del Curso seleccionado)
    Y el examen de admisión en el que vino esa pregunta (institución, año, etc)

  Escenario: Pregunta Individual de un Curso, de un Tema
    Cuando selecciona "un Curso"
    Y le muestra "Tema Aleatorio" con la "Lista de Temas del Curso"
    Y selecciona "un Tema"
    Entonces le muestra un problema del tema y sus alternativas
    Y el Curso (el que seleccionó)
    Y el Tema (el que seleccionó)
    Y el examen de admisión en el que vino esa pregunta (institución, año, etc)










  # Escenario: Elige un Curso, varios Temas
  #   Dado que selecciona un curso
  #   Cuando le da al botón: "Enviar"
  #   Y le muestra la lista de temas de ese curso
  #   Y selecciona los temas que quiere practicar
  #   Y le da al botón: "Empezar Problemas"
  #   Entonces le muestra un problema con sus alternativas
  #   Y es del curso que seleccionó
  #   Y es de alguno de los temas que seleccionó

  # Escenario: Elige varios Cursos, Temas aleatorios
  #   Dado que selecciona varios cursos
  #   Cuando le da al botón: "Enviar"
  #   Y le muestra una lista de temas por curso
  #   Y selecciona "Tema Aleatorio" en cada curso
  #   Y le da al botón: "Empezar Problemas"
  #   Entonces le muestra un problema con sus alternativas
  #   Y es de alguno de los cursos que seleccionó
  #   Y es de cualquier tema de esos cursos

  # Escenario: Elige varios Cursos, un Tema por curso
  #   Dado que selecciona varios cursos
  #   Cuando le da al botón: "Enviar"
  #   Y le muestra una lista de temas por curso
  #   Y selecciona el tema que quiere practicar de cada curso
  #   Y le da al botón: "Empezar Problemas"
  #   Entonces le muestra un problema con sus alternativas
  #   Y es de alguno de los cursos que seleccionó
  #   Y es de uno de los temas que seleccionó (de cada curso)

  # Escenario: Elige varios Cursos, varios Temas
  #   Dado que selecciona varios cursos
  #   Cuando le da al botón: "Enviar"
  #   Y le muestra una lista de temas por curso
  #   Y selecciona los temas que quiere practicar de cada curso
  #   Y le da al botón: "Empezar Problemas"
  #   Entonces le muestra problema con sus alternativas
  #   Y es de alguno de los cursos que seleccionó
  #   Y es de alguno de los temas que seleccionó (de cada curso)
