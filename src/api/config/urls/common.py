# config/urls/common.py

"""
URL configuration for daVinci project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import include, path

# from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter

from apps.core.routers import core_list as core_router

# API_TITLE = "Da Vinci"
# API_DESCRIPTION = "API de prueba"


routers_tuples = (core_router,)
routers_lists: list = sum(
    [list(router_tuple) for router_tuple in routers_tuples], []
)

router = DefaultRouter()

for router_list in sorted(routers_lists):
    router.register(router_list[0], router_list[1], basename=router_list[0])


urlpatterns = [
    path("admin/", admin.site.urls),
    # path(
    #     r'api-auth/',
    #     include('rest_framework.urls', namespace='rest_framework')),
    # path(
    #     r"docs/",
    #     include_docs_urls(title=API_TITLE, description=API_DESCRIPTION),
    # ),
    path("api/v1/", include((router.urls, "api_v1"), namespace="api_v1")),
    # path(r'api/v1/rest-auth/', include('rest_auth.urls'))
]
