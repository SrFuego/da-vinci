# language: es

Característica: Pregunta Individual
    Como usuario interesado en ingresar a una universidad de Perú
    Quiero ver preguntas de diferentes maneras
    Para poder practicar y prepararme para el examen de admisión

    Antecedentes:
        Dado que abro la App
        Y que hay preguntas disponibles en la base de datos

    @api_happy_path @sorprendeme
    Escenario: Ver pregunta aleatoria exitosamente
        Cuando selecciono "¡Sorpréndeme!"
        Entonces debo ver una pregunta de examen de admisión
        Y la pregunta debe contener un enunciado
        Y la pregunta debe tener alternativas
        Y debo ver el curso al que pertenece
        Y debo ver el tema específico
    
    @api_happy_path @por_curso
    Escenario: Ver pregunta por Curso específico
        Cuando selecciono "Una por Una"
        Entonces debo ver una lista de cursos habilitados
        Cuando selecciono un curso específico
        Entonces debo ver una lista de temas habilitados
        Cuando selecciono "Tema Aleatorio"
        Entonces debo ver una pregunta de examen de admisión
        Y la pregunta debe contener un enunciado
        Y la pregunta debe tener alternativas
        Y el curso debe corresponder al seleccionado
        Y el tema debe ser uno válido del curso seleccionado

    @api_happy_path @por_tema
    Escenario: Ver pregunta por Tema específico
        Cuando selecciono "Una por Una"
        Entonces debo ver una lista de cursos habilitados
        Cuando selecciono un curso específico
        Entonces debo ver una lista de temas habilitados
        Cuando selecciono un tema específico
        Entonces debo ver una pregunta de examen de admisión
        Y la pregunta debe contener un enunciado
        Y la pregunta debe tener alternativas
        Y el curso debe corresponder al seleccionado
        Y el tema debe corresponder al seleccionado

    @ui_error_handling @skip
    Escenario: Sin conexión a internet
        Dado que no tengo conexión a internet
        Cuando selecciono "¡Sorpréndeme!"
        Entonces debo ver un mensaje de error
        Y el mensaje debe indicar "Verifica tu conexión a internet"
        Y debo ver un botón para reintentar

    @ui_interaction @skip
    Escenario: Interactuar con la pregunta
        Dado que veo una pregunta aleatoria
        Cuando selecciono una alternativa
        Entonces debe habilitarse el botón para enviar mi respuesta
