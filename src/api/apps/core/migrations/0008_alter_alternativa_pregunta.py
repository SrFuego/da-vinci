# Generated by Django 4.2.3 on 2023-08-04 06:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0007_alter_alternativa_pregunta"),
    ]

    operations = [
        migrations.AlterField(
            model_name="alternativa",
            name="pregunta",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to="core.pregunta"
            ),
        ),
    ]