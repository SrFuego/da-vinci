# language: es

Característica: Mostrar una pregunta individual
  Como usuario que desea resolver problemas
  Quiero resolver un problema de examen de admisión
  Para probar y mejorar mis conocimientos académicos

  Antecedentes:
    Dado un usuario en el home de la App Da Vinci
    Y selecciona "Pregunta Individual"
    Y le muestra "Pregunta Aleatoria" y "Elegir Curso"

  # Nueva
  Escenario: Pregunta Aleatoria
    Cuando selecciona "Pregunta Aleatoria"
    Entonces le muestra un problema de admisión y sus alternativas
    Y el Curso (puede ser cualquiera)
    Y el Tema (puede ser cualquiera del Curso)

  # Escenario: Pregunta de un Curso, cualquier Tema
  #   Cuando que selecciona "Elegir Curso"
  #   Y le muestra la lista de Cursos
  #   Y selecciona un Curso
  #   Y le da al botón: "Enviar"
  #   Y le muestra "Tema aleatorio" y "Elegir Tema"
  #   Y selecciona "Tema Aleatorio"
  #   Y le da al botón: "Enviar"
  #   Entonces le muestra un problema de admisión
  #   Y sus alternativas
  #   Y el Curso (el que seleccionó)
  #   Y el Tema (cualquiera del Curso seleccionado)

  # Escenario: Pregunta de un Curso, un Tema
  #   Cuando que selecciona "Elegir Curso"
  #   Y le muestra la lista de Cursos
  #   Y selecciona un Curso
  #   Y le muestra "Tema aleatorio" y "Elegir Tema"
  #   Y selecciona "Elegir Tema"
  #   Y le da al botón: "Enviar"
  #   Y le muestra la lista de temas de ese Curso
  #   Y selecciona el tema que quiere practicar
  #   Y le da al botón: "Empezar Problemas"
  #   Entonces le muestra un problema de admisión
  #   Y sus alternativas
  #   Y el Curso (el que seleccionó)
  #   Y el Tema (el que seleccionó)











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