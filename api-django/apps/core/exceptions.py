# apps/core/exceptions.py
# Python imports


# Django imports


from rest_framework.response import Response
# Third party apps imports
from rest_framework.views import exception_handler

# Local imports


# Create your exceptions here.
def custom_exception_handler(exc, context):
    response = exception_handler(exc, context)
    
    if response is not None:
        response.data['status_code'] = response.status_code
        response.data['detail'] = str(exc)
        
        if hasattr(exc, 'get_full_details'):
            response.data['errors'] = exc.get_full_details()
            
    return response