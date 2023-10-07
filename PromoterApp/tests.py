from django.test import TestCase
from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework.test import APIClient

from datetime import datetime

from .models import Product, PriceVariation

class PriceVariationTableTestCase(TestCase):
    def setUp(self):
        self.user = User.objects.create_superuser(
            username="admin",
            email="admin@example.com",
            password="adminpassword"
        )

        self.product = Product.objects.create(
            name="Test Product",
            ean="1234567890123",
            min_price=10.0,
            max_price=20.0,
        )

        self.price_variation = PriceVariation.objects.create(
            product=self.product,
            price=15.0,
            created_at=datetime.now(),
        )

        self.client = APIClient()
        self.client.login(username="admin", password="adminpassword")

    def test_price_variation_table(self):
        url = reverse("price_variation_table")

        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response["Content-Type"], "application/ms-excel")
