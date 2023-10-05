from django import forms
from .utils import to_money

class PriceVariationForm(forms.ModelForm):
    def clean(self):
        price = self.cleaned_data.get('price', None)
        product = self.cleaned_data.get('product', None)

        if price:
            if float(price) < float(product.min_price):
                raise forms.ValidationError({
                    "price": f"O preço do produto não pode ser menor que {to_money(product.min_price)}"
                })
        
            elif float(price) > float(product.max_price):
                raise forms.ValidationError({
                    "price": f"O preço do produto não pode ser maior que {to_money(product.max_price)}"
                })