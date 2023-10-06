from django.urls import path
from django.conf.urls.static import static
from rest_framework_swagger.views import get_swagger_view
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from rest_framework import permissions
from django.conf import settings

from .views import ProductView, PriceVariation

schema_view = get_schema_view(
    openapi.Info(
        title="Tradex PromoterAPP API",
        default_version='v1',),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('products/', ProductView.as_view(), name='product-list'),
    path('products/<int:product_id>/', ProductView.as_view(), name='product-detail'),

    path('price-variation/<int:product_id>/', PriceVariation.as_view(), name='price-variation-list'),
    
    path('docs/', schema_view.with_ui('swagger', cache_timeout=0),name='schema-swagger-ui'),
]
