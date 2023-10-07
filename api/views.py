from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from drf_yasg.utils import swagger_auto_schema

from .serializer import BaseProductSerializer, ProductSerializer, PriceVariationSerializer

from PromoterApp.models import Product

from rest_framework.parsers import MultiPartParser


class ProductView(APIView):
    parser_classes = [MultiPartParser]

    @swagger_auto_schema(request_body=ProductSerializer)
    def post(self, request, *args, **kwargs):
        # Deserialize the incoming JSON data with the ProductSerializer
        product_serializer = ProductSerializer(data=request.data)
        
        if product_serializer.is_valid():
            ean = product_serializer.validated_data.get('ean')
            # Check if a product with the same EAN already exists in the database
            if Product.objects.filter(ean=ean).exists():
                return Response({'error': 'EAN já existe no banco de dados.'}, status=status.HTTP_400_BAD_REQUEST)

            # Save the new product to the database
            product_serializer.save()
            return Response(product_serializer.data, status=status.HTTP_201_CREATED)

        return Response(product_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, product_id=None):
        if product_id is None:
            # Retrieve a list of all products from the database
            queryset = Product.objects.all()
            serializer = BaseProductSerializer(queryset, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)

        try:
            # Retrieve a specific product by its ID from the database
            product = Product.objects.get(id=product_id)
            serializer = BaseProductSerializer(product)
            return Response(serializer.data, status=status.HTTP_200_OK)

        except Product.DoesNotExist:
            return Response({"detail": "Produto não encontrado."}, status=status.HTTP_404_NOT_FOUND)
        
    
    def put(self, request, product_id=None):
        if product_id is None:
            return Response({"detail": "O parâmetro 'product_id' é obrigatório."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Retrieve the existing product from the database by its ID
            instance = Product.objects.get(id=product_id)
        
        except Product.DoesNotExist:
            return Response({"detail": "Produto não encontrado."}, status=status.HTTP_404_NOT_FOUND)

        # Deserialize the incoming JSON data and update the product instance
        product_serializer = ProductSerializer(instance, data=request.data, partial=True)
        
        if product_serializer.is_valid():
            product_serializer.save()
            return Response(product_serializer.data, status=status.HTTP_200_OK)

        return Response(product_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
    
    def delete(self, request, product_id=None):
        if product_id is None:
            return Response({"detail": "O parâmetro 'product_id' é obrigatório."}, status=status.HTTP_400_BAD_REQUEST)
            
        try:
            product = Product.objects.get(id=product_id)
        
        except Product.DoesNotExist:
            return Response({"detail": "Produto não encontrado."}, status=status.HTTP_404_NOT_FOUND)

        product.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class PriceVariation(APIView):
    @swagger_auto_schema(request_body=PriceVariationSerializer)
    def post(self, request, product_id=None):
        if product_id is None:
            return Response({"detail": "O parâmetro 'product_id' é obrigatório."}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            # Retrieve the product instance by its ID
            product_instance = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            return Response({'error': 'Produto não encontrado.'}, status=status.HTTP_404_NOT_FOUND)
            
        # Deserialize the incoming JSON data with the PriceVariationSerializer
        price_variation_serializer = PriceVariationSerializer(data=request.data)
        
        if price_variation_serializer.is_valid():
            # Create a new price variation for the specified product
            price_variation_serializer.create(product_instance, validated_data=request.data)
            return Response(price_variation_serializer.data, status=status.HTTP_201_CREATED)

        return Response(price_variation_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
