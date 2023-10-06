from django.contrib import admin

from .models import Product, PriceVariation
from .forms import PriceVariationForm


class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'ean', 'min_price', 'max_price', 'created_at', 'is_enabled',)
    search_fields = ('name', 'ean',)
    readonly_fields = ['created_at']
    
    fieldsets = (
        ('Informações Básicas', {
            'fields': ('name', 'ean', 'min_price', 'max_price', 'created_at')
        }),
        ('Situação', {
            'fields': ('is_enabled',)
        }),
    )
    
    list_filter = ('is_enabled',)
    
    change_form_template = 'admin/PromoterApp/product/change_form.html'

    def change_view(self, request, object_id, form_url='', extra_context=None):
        extra_context = extra_context or {}
        
        prices = PriceVariation.objects.filter(product_id=object_id).order_by('created_at')
        extra_context['product_id'] = object_id
        extra_context['created_at'] = [price.created_at for price in prices]
        extra_context['prices'] = [float(price.price) for price in prices]

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