HOST_URL = "http://localhost:8000/"
API_VERSION = "api/v1/"


CURSO_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "curso/",
)


TEMA_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "curso/{}/tema/",
)


PREGUNTA_INDIVIDUAL_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "pregunta_individual/",
)


PREGUNTA_INDIVIDUAL_RESOLVER_URL = "{}{}{}".format(
    HOST_URL,
    API_VERSION,
    "resolver_pregunta_individual/",
)
