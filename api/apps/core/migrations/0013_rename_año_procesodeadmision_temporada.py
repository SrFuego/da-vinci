# Generated by Django 4.2.3 on 2023-08-04 21:00

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0012_rename_nombre_lectura_titulo"),
    ]

    operations = [
        migrations.RenameField(
            model_name="procesodeadmision",
            old_name="año",
            new_name="temporada",
        ),
    ]
