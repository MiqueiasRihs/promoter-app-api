from django.http import HttpResponse
from django.contrib.admin.views.decorators import staff_member_required
from PromoterApp.models import PriceVariation

from openpyxl import Workbook


@staff_member_required
def price_variation_table(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="variacao-de-preco.xlsx"'

    wb = Workbook()
    ws = wb.active
    ws.title = "Variação de preços"

    # headers
    headers = ["Nome", "EAN", "Preço", "Data"]
    ws.append(headers)

    # data from the model
    price_variation = PriceVariation.objects.all()
    for each_variation in price_variation:
        ws.append([
            each_variation.product.name,
            each_variation.product.ean,
            each_variation.price,
            each_variation.created_at.strftime('%d/%m/%Y')
        ])

    wb.save(response)
    return response