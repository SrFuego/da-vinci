# language: es

Característica: Pregunta Aleatoria
    Como usuario interesado en ingresar a una universidad de Perú
    Quiero ver una pregunta aleatoria
    Para poder practicar y prepararme para el examen de admisión

    Antecedentes:
        Dado que abro la App
        Y que hay preguntas disponibles en la base de datos

    @api_happy_path
    Escenario: Ver pregunta aleatoria exitosamente
        Cuando selecciono "¡Sorpréndeme!"
        Entonces debo ver una pregunta de examen de admisión
        Y la pregunta debe contener un enunciado
        Y la pregunta debe tener alternativas
        Y debo ver el curso al que pertenece
        Y debo ver el tema específico

    @ui_error_handling
    Escenario: Sin conexión a internet
        Dado que no tengo conexión a internet
        Cuando selecciono "¡Sorpréndeme!"
        Entonces debo ver un mensaje de error
        Y el mensaje debe indicar "Verifica tu conexión a internet"
        Y debo ver un botón para reintentar

    @ui_interaction
    Escenario: Interactuar con la pregunta
        Dado que veo una pregunta aleatoria
        Cuando selecciono una alternativa
        Entonces debe habilitarse el botón para enviar mi respuesta
