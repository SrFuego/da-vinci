# config/wsgi.py
"""
WSGI config for daVinci project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os

# from dotenv import load_dotenv

from django.core.wsgi import get_wsgi_application

# load_dotenv()

os.environ.setdefault(
    "DJANGO_SETTINGS_MODULE",
    "config.settings." + os.getenv("ENVIRONMENT_MODULE", "develop"),
)

application = get_wsgi_application()