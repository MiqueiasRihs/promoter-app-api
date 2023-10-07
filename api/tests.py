from django.test import TestCase
from django.core.files.uploadedfile import SimpleUploadedFile

from rest_framework import status
from rest_framework.test import APIClient

from PromoterApp.models import Product, PriceVariation


class ProductAPITestCase(TestCase):
    
    def setUp(self):
        self.client = APIClient()
        
        with open('media/produtos/camera.jpg', 'rb') as image_file:
            image_data = image_file.read()
            image = SimpleUploadedFile(name='test_image.jpg', content=image_data, content_type='image/jpeg')

            self.product_data = {
                "name": "Produto Teste",
                "ean": "9876543210986",
                "min_price": 10.0,
                "max_price": 20.0,
                "image": image
            }
        
            self.product = Product.objects.create(
                name="Produto Teste",
                ean="1234567890111",
                min_price=16.0,
                max_price=35.0,
                image=image_file.name
            )

        self.product_id = self.product.id


    def tearDown(self):
        PriceVariation.objects.all().delete()
        Product.objects.all().delete()

    
    def test_create_product(self):
        response = self.client.post('/api/products/', self.product_data, format="multipart")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Product.objects.count(), 2)
        
        
    def test_create_already_created_product(self):
        response = self.client.post('/api/products/', format="multipart", data={
            "name": "Produto Teste",
            "ean": "1234567890111",
            "min_price": 13.0,
            "max_price": 18.0,
        })
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.json(), {'error': 'EAN já existe no banco de dados.'})

    
    def test_get_product_list(self):
        response = self.client.get('/api/products/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    
    def test_get_product_detail(self):
        response = self.client.get(f'/api/products/{self.product_id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], self.product_id)

    
    def test_update_product(self):
        updated_data = {
            "name": "Produto Atualizado",
            "min_price": 15.0
        }
        response = self.client.put(f'/api/products/{self.product_id}/', updated_data, format='multipart')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.product.refresh_from_db()
        self.assertEqual(self.product.name, updated_data["name"])
        self.assertEqual(self.product.min_price, updated_data["min_price"])

    
    def test_delete_product(self):
        response = self.client.delete(f'/api/products/{self.product_id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Product.objects.count(), 0)

    
    def test_create_price_variation(self):
        price_variation_data = {
            "price": 20.0
        }
        response = self.client.post(f'/api/price-variation/{self.product_id}/', price_variation_data, format='json')
        price_variation_count = PriceVariation.objects.filter(product_id=self.product_id)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(price_variation_count.count(), 1)
        
    
    def test_create_price_variation_max_price_erro(self):
        response = self.client.post(f'/api/price-variation/{self.product_id}/', format='json', data={
            "price": 200.0
        })
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.json(), {'detail': 'O preço do produto não pode ser maior que R$ 35,00'})
        
    
    def test_create_price_variation_min_price_erro(self):
        response = self.client.post(f'/api/price-variation/{self.product_id}/', format='json', data={
            "price": 3.0
        })
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.json(), {'detail': 'O preço do produto não pode ser menor que R$ 16,00'})

    
    def test_create_price_variation_missing_product_id(self):
        price_variation_data = {
            "price": 15.0
        }
        response = self.client.post('/api/products/price_variation/', price_variation_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    
    def test_create_price_variation_nonexistent_product(self):
        price_variation_data = {
            "price": 15.0
        }
        response = self.client.post('/api/products/999/price_variation/', price_variation_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
