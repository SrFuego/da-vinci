# apps/core/tests/test_viewsets.py
# Python imports


# Django imports
# from django.urls import reverse
# from django.utils.http import urlencode


# Third party apps imports
# from model_mommy import mommy
# from model_mommy.random_gen import gen_string
# from rest_framework import status
# from rest_framework.test import APITestCase


# Local imports
# from ..models import Model


# Create your viewset tests here.
# class ModelAPITestCase(APITestCase):
#     def setUp(self):
#         self.models = mommy.make(Model, _fill_optional=True, _quantity=10)
#         self.models_list_url = reverse('api_v1:model-list')
#         self.model_random = Model.objects.order_by('?').last()
#         self.model_detail_url = reverse(
#             'api_v1:model-detail', kwargs={'pk': self.model_random.pk})

#     def test_list(self):
#         response = self.client.get(self.models_list_url)
#         self.assertEqual(response.status_code, status.HTTP_200_OK)
#         self.assertEqual(len(response.data), 10)

#     def test_list_filter_by_field_1(self):
#         models_list_by_field_1_url = '{0}?{1}'.format(
#             self.models_list_url,
#             urlencode({'field_1': self.model_random.pk}))
#         response = self.client.get(models_list_by_field_1_url)
#         self.assertEqual(response.status_code, status.HTTP_200_OK)
#         self.assertEqual(len(response.data), 5)

#     def test_create(self):
#         data = {
#             'field_1': gen_string(max_length=50)
#         }
#         response = self.client.post(self.models_list_url, data)
#         self.assertEqual(response.status_code, status.HTTP_201_CREATED)

#     def test_retrieve(self):
#         response = self.client.get(self.model_detail_url)
#         self.assertEqual(response.status_code, status.HTTP_200_OK)
#         self.assertTrue('id' in response.data)
#         self.assertTrue('field_1' in response.data)
#         self.assertTrue('field_2' in response.data)

#     def test_partial_update(self):
#         data = {
#             'field_1': gen_string(max_length=50),
#         }
#         response = self.client.patch(self.model_detail_url, data)
#         self.assertEqual(response.status_code, status.HTTP_200_OK)

#     def test_update(self):
#         data = {
#             'field_1': gen_string(max_length=50)
#         }
#         response = self.client.put(self.model_detail_url, data)
#         self.assertEqual(response.status_code, status.HTTP_200_OK)

#     def test_destroy(self):
#         response = self.client.delete(self.model_detail_url)
#         self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

#     def tearDown(self):
#         for model in Model.objects.all():
#             model.delete()