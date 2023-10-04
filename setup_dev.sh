#!/bin/sh


attempts=1
max_attempts=10

while [ $attempts -lt $max_attempts ]; do
    if pg_isready -h tradex_postgres -p 5432 -U postgres -d tradex_promoter; then
        echo -e "\n================ Banco de dados PostgreSQL está pronto! ================\n"
        
        echo ">>> Executando migrações..."
        python3 manage.py makemigrations
        python3 manage.py migrate
        python3 manage.py createcachetable

        echo ">>> Criando superusuário..."
        python3 manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL

        # echo ">>> Populando a tabela SetUserFormConfiguration..."
        # python3 manage.py ONEOFF_set_user_form_configuration

        # echo ">>> Iniciando os testes unitários..."
        # python -m pytest

        echo ">>> Iniciando o servidor Django..."
        python3 manage.py runserver 0.0.0.0:8000
        break
    else
        echo -e "\nTentativa $attempts: Banco de dados não está pronto. Aguarde um momento, reconectando...\n"
        attempts=$((attempts+1))
        sleep 5
    fi
done

if [ $attempts -eq $max_attempts ]; then
    echo "O banco de dados não subiu após $max_attempts tentativas."
fi