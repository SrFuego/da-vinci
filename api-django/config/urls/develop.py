# config/urls/develop.py
from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path

from .base import APIVersioning

urlpatterns = APIVersioning.urlpatterns
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += [path("silk/", include("silk.urls", namespace="silk"))]
