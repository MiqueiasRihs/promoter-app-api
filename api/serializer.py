from rest_framework import serializers

from PromoterApp.models import Product

class BaseProductSerializer(serializers.Serializer):
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
    
    
    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.min_price = validated_data.get('min_price', instance.min_price)
        instance.max_price = validated_data.get('max_price', instance.max_price)
        
        prod_image = validated_data.get('image', None)
        if prod_image:
            instance.image = prod_image

        instance.save()
        return instance
    

class ProductSerializer(BaseProductSerializer):
    id = serializers.IntegerField()

    class Meta:
        model = Product
        fields = '__all__'
