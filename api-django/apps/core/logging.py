# apps/core/logging.py
# Python imports
import logging

# Django imports
from django.conf import settings

# Third party apps imports


# Local imports


# Create your loggers here.
class CustomLogger:
    @staticmethod
    def log_request(request, response):
        logger = logging.getLogger('api_requests')
        logger.info(
            f"Method: {request.method} Path: {request.path} "
            f"Status: {response.status_code} "
            f"User: {request.user.id if request.user.is_authenticated else 'anonymous'}"
        )
