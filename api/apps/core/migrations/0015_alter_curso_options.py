# Generated by Django 4.2.4 on 2023-09-28 07:02

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0014_alter_pregunta_enunciado"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="curso",
            options={"ordering": ["nombre"]},
        ),
    ]