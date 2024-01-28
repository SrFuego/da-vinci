# config/settings/develop.py

import os

from .common import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]

# Django Rest Framework CORS configuration
CORS_ORIGIN_ALLOW_ALL = True

# Application definition

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "db.sqlite3",
    }
}

# DATABASES = {
#     'default': {
#         'ENGINE': os.environ.get(
#             'DB_ENGINE', 'django.db.backends.postgresql_psycopg2'),
#         'NAME': os.environ.get('DB_NAME'),
#         'USER': os.environ.get('DB_USER'),
#         'PASSWORD': os.environ.get('DB_PASSWORD'),
#         'HOST': os.environ.get('DB_HOST', '127.0.0.1'),
#         'PORT': os.environ.get('DB_PORT', '5432'),
#         'ATOMIC_TRANSACTIONS': True
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    # {
    #     "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    # },
    # {
    #     "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    # },
    # {
    #     "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    # },
    # {
    #     "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    # },
]


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = "/static/"

STATIC_ROOT = os.path.join(BASE_DIR, "static/")

MEDIA_URL = "/media/"

MEDIA_ROOT = os.path.join(BASE_DIR, "media/")


# # Django Rest Framework CORS configuration
# CORS_ORIGIN_ALLOW_ALL = True

# Override develop apps
THIRD_PARTY_APPS_DEVELOP = (
    "django_extensions",
    "behave_django",
    "django_dbml",
    "silk",
)

INSTALLED_APPS += THIRD_PARTY_APPS_DEVELOP

# Override develop middlewares
LOCAL_MIDDLEWARE = [
    "silk.middleware.SilkyMiddleware",
]


MIDDLEWARE = LOCAL_MIDDLEWARE + MIDDLEWARE


SILKY_PYTHON_PROFILER = True
SILKY_META = True
SILKY_PYTHON_PROFILER = True


# # Graph models conf
GRAPH_MODELS = {
    "all_applications": True,
    "group_models": True,
    "output": "docs/database/db.png",
    "exclude_models": ",".join(
        [
            "User",
            "AbstractUser",
            "Group",
            "Permission",
            "ContentType",
            "LogEntry",
            "Session",
            "AbstractBaseSession",
            # "Token",
        ]
    ),
}
