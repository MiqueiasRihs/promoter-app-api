from django.contrib import admin
from django.urls import path, include

from . import admin_views

admin.autodiscover()
admin.site.site_header = u'Promoter App - Back office '

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # API
    path('api/', include('api.urls')),

    #Reposts
    path('relatorios/', include([
        path('variacao-de-preco/', admin_views.price_variation_table, name='price_variation_table'),
    ])), 
]