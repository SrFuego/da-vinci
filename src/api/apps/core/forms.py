# apps/core/forms.py
# Python imports


# Django imports
from django import forms


# Third party apps imports


# Local imports


# Register your forms here.
class SolucionAdminForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.id:
            self.fields[
                "alternativa_correcta"
            ].queryset = self.instance.pregunta.alternativas_registradas.all()
