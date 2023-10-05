from rest_framework import serializers

from PromoterApp.models import Product

class ProductSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=350)
    ean = serializers.CharField(max_length=13)
    min_price = serializers.FloatField()
    max_price = serializers.FloatField()
    image = serializers.FileField(required=False)

    def create(self, validated_data):
        image_data = validated_data.pop('image', None)
        product = Product.objects.create(**validated_data)

        if image_data:
            product.image = image_data
            product.save()

        return product
    
