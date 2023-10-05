from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .serializer import BaseProductSerializer, ProductSerializer

from PromoterApp.models import Product


class ProductView(APIView):
    def post(self, request, *args, **kwargs):
        product_serializer = BaseProductSerializer(data=request.data)
        
        if product_serializer.is_valid():
            product_serializer.save()
            return Response(product_serializer.data, status=status.HTTP_201_CREATED)

        return Response(product_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    def get(self, request, product_id=None):
        if product_id is None:
            queryset = Product.objects.all()
            serializer = ProductSerializer(queryset, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)

        try:
            product = Product.objects.get(id=product_id)
            serializer = ProductSerializer(product)
            return Response(serializer.data, status=status.HTTP_200_OK)

        except Product.DoesNotExist:
            return Response({"detail": "Produto não encontrado."}, status=status.HTTP_404_NOT_FOUND)
        
    
    def put(self, request, product_id):
        
        try:
            instance = Product.objects.get(id=product_id)
        
        except Product.DoesNotExist:
            return Response({"detail": "Produto não encontrado."}, status=status.HTTP_404_NOT_FOUND)

        product_serializer = BaseProductSerializer(instance, data=request.data, partial=True)
        
        if product_serializer.is_valid():
            product_serializer.save()
            return Response(product_serializer.data, status=status.HTTP_200_OK)

        return Response(product_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        