# apps/core/models.py
# Python imports


# Django imports
from django.db import models


# Third party apps imports


# Local imports


# Create your models here.
class Pregunta(models.Model):
    enunciado = models.CharField(max_length=50)

    def __str__(self):
        return self.enunciado

    # class Meta:
    #     verbose_name = 'Pregunta'
    #     verbose_name_plural = 'Preguntas'


class Alternativa(models.Model):
    respuesta = models.CharField(max_length=50)
    correcta = models.BooleanField(default=False)
    pregunta = models.ForeignKey("Pregunta", on_delete=models.CASCADE)

    def __str__(self):
        return self.respuesta

    # class Meta:
    #     verbose_name = 'Pregunta'
    #     verbose_name_plural = 'Preguntas'
