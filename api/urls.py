from django.urls import path

from .views import ProductView, PriceVariation

urlpatterns = [
    path('products/', ProductView.as_view(), name='product-list'),
    path('products/<int:product_id>/', ProductView.as_view(), name='product-detail'),

    path('price-variation/<int:product_id>/', PriceVariation.as_view(), name='price-variation-list'),
]
