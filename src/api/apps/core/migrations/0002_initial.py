# Generated by Django 4.2.3 on 2023-07-29 18:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("core", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Alternativa",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("respuesta", models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name="Area",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                ("letra", models.CharField(max_length=50)),
            ],
            options={
                "verbose_name": "Área",
            },
        ),
        migrations.CreateModel(
            name="Curso",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name="ExamenDeAdmision",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("puntaje_correcta", models.FloatField()),
                ("puntaje_incorrecta", models.FloatField()),
                ("puntaje_en_blanco", models.FloatField(default=0)),
                ("duracion", models.DurationField()),
                (
                    "area",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="core.area"
                    ),
                ),
            ],
            options={
                "verbose_name": "Examen de Admisión",
                "verbose_name_plural": "Exámenes de admisión",
            },
        ),
        migrations.CreateModel(
            name="Lectura",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                ("texto", models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name="Pregunta",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("enunciado", models.CharField(max_length=50)),
                ("cantidad_alternativas", models.SmallIntegerField(default=5)),
                (
                    "examen_de_admision",
                    models.ManyToManyField(to="core.examendeadmision"),
                ),
                (
                    "lectura",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="core.lectura",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Universidad",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                ("abreviatura", models.CharField(max_length=50)),
            ],
            options={
                "verbose_name_plural": "Universidades",
            },
        ),
        migrations.CreateModel(
            name="Tema",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                (
                    "curso",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="core.curso"
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Solucion",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                ("texto", models.TextField()),
                (
                    "alternativa",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="core.alternativa",
                    ),
                ),
                (
                    "pregunta",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE, to="core.pregunta"
                    ),
                ),
            ],
            options={
                "verbose_name": "Solución",
                "verbose_name_plural": "Soluciones",
            },
        ),
        migrations.CreateModel(
            name="ProcesoDeAdmision",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("año", models.CharField(max_length=50)),
                ("proceso", models.CharField(max_length=50)),
                (
                    "universidad",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="core.universidad",
                    ),
                ),
            ],
            options={
                "verbose_name": "Proceso de Admisión",
                "verbose_name_plural": "Procesos de Admisión",
            },
        ),
        migrations.CreateModel(
            name="PreguntasPorCurso",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("cantidad", models.PositiveSmallIntegerField()),
                ("area", models.ManyToManyField(to="core.area")),
                (
                    "curso",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="core.curso"
                    ),
                ),
            ],
            options={
                "verbose_name": "Preguntas por curso",
                "verbose_name_plural": "Preguntas por curso",
            },
        ),
        migrations.AddField(
            model_name="pregunta",
            name="tema",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="core.tema",
            ),
        ),
        migrations.AddField(
            model_name="lectura",
            name="tema",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to="core.tema"
            ),
        ),
        migrations.AddField(
            model_name="examendeadmision",
            name="proceso_de_admision",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to="core.procesodeadmision"
            ),
        ),
        migrations.CreateModel(
            name="Carrera",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=50)),
                ("vacantes_admision", models.PositiveSmallIntegerField()),
                ("vacantes_pre", models.PositiveSmallIntegerField()),
                ("codigo", models.CharField(max_length=50)),
                (
                    "area",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="core.area"
                    ),
                ),
            ],
        ),
        migrations.AddField(
            model_name="area",
            name="universidad",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to="core.universidad"
            ),
        ),
        migrations.AddField(
            model_name="alternativa",
            name="pregunta",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to="core.pregunta"
            ),
        ),
    ]
