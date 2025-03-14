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
            pregunta = self.instance.pregunta
            alternativas = pregunta.alternativas_registradas.all()
            self.fields["alternativa_correcta"].queryset = alternativas
