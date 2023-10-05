import locale

def to_money(amount):
    if not amount and amount != 0:
        return
    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
    return locale.currency(float(amount), grouping=True)