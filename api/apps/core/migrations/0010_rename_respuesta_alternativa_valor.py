# Generated by Django 4.2.3 on 2023-08-04 07:20

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0009_remove_solucion_nombre"),
    ]

    operations = [
        migrations.RenameField(
            model_name="alternativa",
            old_name="respuesta",
            new_name="valor",
        ),
    ]
