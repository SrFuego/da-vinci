# apps/core/validators.py
# Python imports


# Django imports
from django.apps import apps
from django.core.exceptions import ValidationError


# Third party apps imports


# Local imports


# Create your validators here.


def restrict_quantity(value):
    Alternativa = apps.get_model("core", "Alternativa")
    Pregunta = apps.get_model("core", "Pregunta")
    pregunta = Pregunta.objects.get(id=value)
    cantidad_alternativas = Alternativa.objects.filter(
        pregunta=pregunta
    ).count()
    if cantidad_alternativas >= pregunta.cantidad_alternativas:
        raise ValidationError(
            "Ya tiene {} alternativas".format(pregunta.cantidad_alternativas)
        )
