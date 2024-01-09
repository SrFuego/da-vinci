# diagram.py

from diagrams import Cluster, Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.onprem.database import Postgresql
from diagrams.aws.network import ELB
from diagrams.custom import Custom
from diagrams.programming.language import Dart, Python
from diagrams.programming.framework import Django, Flutter
from diagrams.onprem.client import Users
from diagrams.generic.os import Android, IOS
from diagrams.generic.device import Mobile, Tablet
from diagrams.onprem.vcs import Git, Github

# from diagrams.onprem.network import Gunicorn, Nginx, Traefik

with Diagram("Da Vinci", show=False):
    user = Users("Users")

    with Cluster("User layer"):
        dart = Dart("Dart")
        flutter = Flutter("Flutter")

        with Cluster(
            "\n".join(
                [
                    "Web",
                    "https://davinci.srfuego.dev",
                ]
            )
        ):
            vercel = Custom(
                "Vercel",
                "./assets/vercel.png",
            )
        with Cluster("Mobile"):
            with Cluster("Android"):
                google_play = Custom(
                    "Google Play",
                    "./assets/google-play.png",
                )
            with Cluster("iOS"):
                app_store = Custom(
                    "App Store",
                    "./assets/app-store.png",
                )

    with Cluster("Server layer"):
        pythonanywhere = Custom(
            "Pythonanywhere",
            "./assets/pythonanywhere.png",
        )
        with Cluster(
            "\n".join(
                [
                    "API layer",
                    "https://srfuego.pythonanywhere.com/api/v1/",
                ]
            )
        ):
            python = Python("Python")
            django = Django("Django")
            django_rest = Custom(
                "Django Rest Framework",
                "./assets/django-rest-framework.png",
            )
            sqlite = Custom(
                "SQLite3",
                "./assets/sqlite.png",
            )
        # with Cluster("Database layer"):
        #     database = Postgresql("Postgres")

    # vercel
    user >> vercel >> flutter
    user << vercel << flutter

    user >> google_play >> flutter
    user << google_play << flutter

    user >> app_store >> flutter
    user << app_store << flutter

    flutter >> dart
    flutter << dart

    dart >> pythonanywhere >> django_rest >> django >> python >> sqlite
    dart << pythonanywhere << django_rest << django << python << sqlite
    # api
    # database
