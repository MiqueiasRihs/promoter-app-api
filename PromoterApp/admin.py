from django.contrib import admin
from django.core.exceptions import ValidationError

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


class PriceVariationAdmin(admin.ModelAdmin):
    form = PriceVariationForm
    list_display = ('product', 'price', 'created_at')
    autocomplete_fields = ['product',]


admin.site.register(PriceVariation, PriceVariationAdmin)
admin.site.register(Product, ProductAdmin)