# Generated by Django 4.2.3 on 2023-07-29 03:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
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
            ],
        ),
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
                ("correcta", models.BooleanField(default=False)),
                (
                    "pregunta",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="core.pregunta"
                    ),
                ),
            ],
        ),
    ]