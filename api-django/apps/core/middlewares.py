# apps/core/middlewares.py
# Python imports


# Django imports


# Third party apps imports
from rest_framework.throttling import UserRateThrottle

# Local imports


# Create your middlewares here.
class CustomRateThrottle(UserRateThrottle):
    rate = '100/hour'  # Límite de 100 requests por hora

class SecurityMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Implementar headers de seguridad
        response = self.get_response(request)
        response['X-Content-Type-Options'] = 'nosniff'
        response['X-Frame-Options'] = 'DENY'
        response['Strict-Transport-Security'] = 'max-age=31536000'
        return response