from rest_framework import serializers

from PromoterApp.models import Product, PriceVariation

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
    
    
    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.min_price = validated_data.get('min_price', instance.min_price)
        instance.max_price = validated_data.get('max_price', instance.max_price)
        
        prod_image = validated_data.get('image', None)
        if prod_image:
            instance.image = prod_image

        instance.save()
        return instance
    

class BaseProductSerializer(ProductSerializer):
    id = serializers.IntegerField()

    class Meta:
        model = Product
        fields = '__all__'


class PriceVariationSerializer(serializers.Serializer):
    price = serializers.FloatField()
    
    class Meta:
        model = PriceVariation
        fields = '__all__'
        
    def create(self, product_instance, validated_data):
        self.price_validation(product_instance, validated_data.get('price'))
        
        price_variation = PriceVariation.objects.create(
            product=product_instance,
            price=validated_data.get('price')
        )
        
        return price_variation
    
    
    def price_validation(self, product, price):
        if float(price) < float(product.min_price):
            raise serializers.ValidationError({
                "detail": f"O preço do produto não pode ser menor que {product.min_price}"
            })
    
        elif float(price) > float(product.max_price):
            raise serializers.ValidationError({
                "detail": f"O preço do produto não pode ser maior que {product.max_price}"
            })

        return True