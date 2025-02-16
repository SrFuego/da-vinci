# apps/core/tests/test_models.py
# Python imports


# Django imports
# from django.contrib.auth import get_user_model
# from django.test import TestCase


# Third party apps imports
# from model_mommy import mommy


# Local imports
# from apps.other_app.models import OtherModel, AnotherModel
# from ..models import Model


# Create your model tests here.
# class ModelTestCase(TestCase):
#     def setUp(self):
#         self.model = mommy.make(Model, _fill_optional=True)
#         self.field_list = [
#             field.name for field in Model._meta.get_fields()]

#     def test_have_fields_needed_by_he_business(self):
#         self.assertTrue('field_1' in self.field_list)
#         self.assertTrue('field_2' in self.field_list)
#         self.assertTrue('user' in self.field_list)

#     def test_have_field_1_fk(self):
#         self.assertTrue(self.model.field_1.__class__ is OtherModel)

#     def test_have_field_2_m2m(self):
#         self.assertTrue(self.model.field_2.model is AnotherModel)

#     def test_have_user_fk(self):
#         self.assertTrue(self.model.user.__class__ is get_user_model())

#     def test_method_str(self):
#         self.assertIn(self.model.user.username, self.model.__str__())

#     def tearDown(self):
#         self.model.delete()