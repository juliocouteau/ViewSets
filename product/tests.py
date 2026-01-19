from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Category

class TestCategoryViewSet(APITestCase):
    def test_get_category(self):
        Category.objects.create(title='Livros', slug='livros')
        response = self.client.get(reverse('category-list'))
        self.assertEqual(response.status_code, status.HTTP_200_OK)