HOST_URL = "http://localhost:8000/"
API_VERSION = "api/v1/"

PREGUNTA_ALEATORIA_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "pregunta_aleatoria/",
)
CURSO_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "curso/",
)
PREGUNTA_INDIVIDUAL_POR_CURSO_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "pregunta_individual/?curso_id=",
)
PREGUNTA_INDIVIDUAL_RESOLVER_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "resolver_pregunta_individual/",
)
