from django.contrib import admin

from .models import Product, PriceVariation
from .forms import PriceVariationForm


class ProductAdmin(admin.ModelAdmin):
    search_fields = ('name', 'ean',)
    readonly_fields = ['created_at', 'image_tag']
    list_display = ('name', 'ean', 'min_price', 'max_price', 'image', 'created_at',)
    
    fieldsets = (
        ('Informações Básicas', {
            'fields': ('name', 'ean', 'min_price', 'max_price', 'image_tag', 'image', 'created_at')
        }),
    )
    
    change_form_template = 'admin/PromoterApp/product/change_form.html'

    def change_view(self, request, object_id, form_url='', extra_context=None):
        extra_context = extra_context or {}
        
        product = Product.objects.get(pk=object_id)
        prices_variation = PriceVariation.objects.filter(product_id=object_id).order_by('created_at')

        extra_context = {
            'product_id': object_id,
            'created_at': [price.created_at for price in prices_variation],
            'prices': [float(price.price) for price in prices_variation],
            'image': product.image.name
        }

        return super().change_view(
            request, object_id, form_url, extra_context=extra_context,
        )


class PriceVariationAdmin(admin.ModelAdmin):
    form = PriceVariationForm
    list_display = ('product', 'price', 'created_at')
    autocomplete_fields = ['product',]
    
    change_list_template = 'admin/PromoterApp/pricevariation/change_list.html'
    

admin.site.register(PriceVariation, PriceVariationAdmin)
admin.site.register(Product, ProductAdmin)