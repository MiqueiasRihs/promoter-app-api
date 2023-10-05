from django.db import models
from django.core.validators import RegexValidator


class Product(models.Model):
    name = models.CharField(max_length=350, verbose_name=u'Nome')
    ean = models.CharField(max_length=13, verbose_name='EAN', unique=True, validators=[RegexValidator(
                           regex='^.{13}$', message='O Ean deve conter 13 caracteres', code='nomatch')])
    image = models.ImageField(null=True, blank=True, verbose_name='Imagem principal', upload_to='produtos')
    min_price = models.DecimalField(verbose_name=u'Preço mínimo', decimal_places=2, max_digits=8, default=0.0, blank=True, null=True)
    max_price = models.DecimalField(verbose_name=u'Preço máximo', decimal_places=2, max_digits=8, default=0.0, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Criado em')
    is_enabled = models.BooleanField(default=True, verbose_name='Está habilitado?')

    class Meta:
        verbose_name = u"Produto"
        verbose_name_plural = u"Produtos"

    def __str__(self):
        return f"{self.name} - {self.ean}"


class PriceVariation(models.Model):
    product = models.ForeignKey(Product, verbose_name='Produto', related_name='product',  on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Criado em')
    
    class Meta:
        verbose_name = u"Variação de preço"
        verbose_name_plural = u"Variações de preço"

    def __str__(self):
        return f"{self.product.name} - {self.product.ean}"
    