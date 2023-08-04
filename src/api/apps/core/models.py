# apps/core/models.py
# Python imports


# Django imports
from django.db import models
from django.db.models import CheckConstraint, Q
from django.core.exceptions import ValidationError


# Third party apps imports


# Local imports
from .managers import PreguntaToUIManager


# Create your models here.
class Universidad(models.Model):
    nombre = models.CharField(max_length=50)
    abreviatura = models.CharField(max_length=50)
    # logo = models.ImageField()

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name_plural = "Universidades"


class Area(models.Model):
    nombre = models.CharField(max_length=50)
    letra = models.CharField(max_length=50)
    universidad = models.ForeignKey("Universidad", on_delete=models.CASCADE)
    # logo = models.ImageField()

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Área"


class Carrera(models.Model):
    nombre = models.CharField(max_length=50)
    area = models.ForeignKey("Area", on_delete=models.CASCADE)
    vacantes_admision = models.PositiveSmallIntegerField()
    vacantes_pre = models.PositiveSmallIntegerField()
    codigo = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre


class ProcesoDeAdmision(models.Model):
    universidad = models.ForeignKey("Universidad", on_delete=models.CASCADE)
    año = models.CharField(max_length=50)
    proceso = models.CharField(max_length=50)

    def __str__(self):
        return "{}-{}".format(self.año, self.proceso)

    class Meta:
        verbose_name = "Proceso de Admisión"
        verbose_name_plural = "Procesos de Admisión"


class ExamenDeAdmision(models.Model):
    area = models.ForeignKey("Area", on_delete=models.CASCADE)
    proceso_de_admision = models.ForeignKey(
        "ProcesoDeAdmision", on_delete=models.CASCADE
    )
    puntaje_correcta = models.FloatField()
    puntaje_incorrecta = models.FloatField()
    puntaje_en_blanco = models.FloatField(default=0)
    duracion = models.DurationField()
    cantidad_de_preguntas = models.PositiveSmallIntegerField(default=100)

    def __str__(self):
        return "{} {}, Area: {}".format(
            self.area.universidad.abreviatura,
            self.proceso_de_admision,
            self.area,
        )

    class Meta:
        verbose_name = "Examen de Admisión"
        verbose_name_plural = "Exámenes de admisión"


class Curso(models.Model):
    nombre = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre


class PreguntasPorCurso(models.Model):
    cantidad = models.PositiveSmallIntegerField()
    curso = models.ForeignKey("Curso", on_delete=models.CASCADE)
    area = models.ManyToManyField("Area")

    def __str__(self):
        return "{}: {}".format(self.curso.nombre, self.cantidad)

    class Meta:
        verbose_name = "Preguntas por curso"
        verbose_name_plural = "Preguntas por curso"


class Tema(models.Model):
    nombre = models.CharField(max_length=50)
    curso = models.ForeignKey("Curso", on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre


class Lectura(models.Model):
    nombre = models.CharField(max_length=50)
    texto = models.TextField()
    tema = models.ForeignKey("Tema", on_delete=models.CASCADE)
    # imagen = models.ImageField()

    def __str__(self):
        return self.nombre


class Pregunta(models.Model):
    enunciado = models.CharField(max_length=50)
    examenes_de_admision = models.ManyToManyField("ExamenDeAdmision")
    lectura = models.ForeignKey(
        "Lectura", on_delete=models.CASCADE, blank=True, null=True
    )
    tema = models.ForeignKey(
        "Tema", on_delete=models.CASCADE, blank=True, null=True
    )
    cantidad_alternativas = models.SmallIntegerField(default=5)
    # imagen = models.ImageField()
    objects = models.Manager()
    to_ui_objects = PreguntaToUIManager()

    def __str__(self):
        return self.enunciado

    @property
    def alternativas_registradas(self):
        return self.alternativa_set.all()

    @property
    def cantidad_alternativas_registradas(self):
        return self.alternativas_registradas.count()

    @property
    def alternativas(self):
        # to UI
        return self.alternativas_registradas.order_by("?")

    @property
    def falta_completar_alternativas(self):
        return (
            self.cantidad_alternativas_registradas < self.cantidad_alternativas
        )

    @property
    def alternativas_completas(self):
        return (
            self.cantidad_alternativas_registradas
            == self.cantidad_alternativas
        )

    @property
    def curso(self):
        return self.tema.curso

    class Meta:
        constraints = [
            CheckConstraint(
                check=Q(lectura__isnull=False) | Q(tema__isnull=False),
                name="check_pregunta_have_tema_or_lectura",
                violation_error_message="Cada pregunta debe tener un tema "
                "o pertenecer a una lectura",
            ),
        ]


class Alternativa(models.Model):
    valor = models.CharField(max_length=50)
    pregunta = models.ForeignKey(
        "Pregunta",
        on_delete=models.CASCADE,
    )
    # imagen = models.ImageField()

    def __str__(self):
        return self.valor

    def clean(self):
        if not self.id:
            if not self.pregunta.falta_completar_alternativas:
                raise ValidationError(
                    "Ya tiene {} alternativas".format(
                        self.pregunta.cantidad_alternativas_registradas
                    ),
                    code="invalid",
                )


class Solucion(models.Model):
    teoria = models.TextField()
    resolucion = models.TextField()
    pregunta = models.OneToOneField("Pregunta", on_delete=models.CASCADE)
    alternativa_correcta = models.OneToOneField(
        "alternativa", on_delete=models.CASCADE
    )
    # imagen = models.ImageField()

    def __str__(self):
        return "Solución de: {}".format(self.pregunta)

    def es_correcta(self, alternativa):
        return self.alternativa_correcta == alternativa

    class Meta:
        verbose_name = "Solución"
        verbose_name_plural = "Soluciones"
