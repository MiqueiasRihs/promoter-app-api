from django.http import HttpResponse
from django.contrib.admin.views.decorators import staff_member_required
from PromoterApp.models import PriceVariation

from openpyxl import Workbook


@staff_member_required
def price_variation_table(request, product_id=None):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="variacao-de-preco.xlsx"'

    wb = Workbook()
    ws = wb.active
    ws.title = "Variação de preços"

    # headers
    headers = ["Nome", "EAN", "Preço", "Data"]
    ws.append(headers)

    if product_id:
        price_variation = PriceVariation.objects.filter(product=product_id).order_by('created_at')
    
    else:
        price_variation = PriceVariation.objects.all().order_by('created_at')

    for each_variation in price_variation:
        ws.append([
            each_variation.product.name,
            each_variation.product.ean,
            each_variation.price,
            each_variation.created_at.strftime('%d/%m/%Y')
        ])

    wb.save(response)
    return response