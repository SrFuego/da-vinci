# Generated by Django 4.2.9 on 2024-02-06 03:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        (
            "core",
            "0019_alter_curso_options_alter_tema_options_curso_slug_and_more",
        ),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="curso",
            options={"ordering": ["slug"]},
        ),
    ]
