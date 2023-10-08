# Projeto de Controle de Produtos e Variações de Preços - Tradex

Este é um projeto de API REST baseado em Django e Python, desenvolvido para atender aos requisitos de controle de produtos e variações de preços. Ele fornece endpoints para adicionar, editar, listar e excluir produtos, bem como para registrar variações de preço em produtos específicos. Além disso, o projeto inclui uma interface de administração que oferece recursos adicionais, como a visualização de um gráfico de tabelas que exibe a variação de preço ao longo do tempo. Os usuários administradores também têm a opção de exportar uma tabela contendo essas variações de preço, proporcionando uma visão abrangente do histórico de preços dos produtos.

## Tecnologias

As tecnologias utilizadas nesse projeto foram:

- Django
- Postgres
- Docker
- Swagger

## Pré-requisitos

Antes de iniciar o projeto, certifique-se de ter o seguinte instalado:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Configuração

Siga estas etapas para configurar e executar o projeto:

1. Clone o repositório:

   ```bash
   git clone https://github.com/MiqueiasRihs/promoter-app-api
   cd PromoterApp
   ```

2. Inicialize os contêineres do Docker:

   ```bash
   docker-compose up --build
   ```

   Isso irá iniciar a aplicação Django e o banco de dados PostgreSQL.  
   **Na raiz do repositório está disponivel um dump com dados de exemplos, este dump é carregado assim que o container sobe.**

## Acessos

Para acessar o /admin está sendo criado automaticamente um usuário inicial para testes no momento em que o contêiner sobe, os acessos são:

- Acesse a interface de administração em http://localhost:8000/admin/

```bash
usuário: admin
senha: admin
```

## Documentação

Você pode acessar a documentação da API Swagger em [http://localhost:8000/api/docs/](http://localhost:8000/api/docs/) para explorar os endpoints, testá-los e também obter mais detalhes técnicos e informações sobre os modelos de dados.

## API Endpoints

### 1. Cadastro de Produtos

**Endpoint:** `/api/products/`  
**Método:** `POST`  
**Descrição:** Endpoint para cadastrar novos produtos.  
**Corpo da Requisição:**

```json
{
    "name": "Nome do Produto",
    "ean": "1234567890123",
    "min_price": 19.89,
    "max_price": 25.0,
    "image": "/media/produtos/nome-do-arquivo.jpg"
}
```

**Resposta:**
- **Status Code:** 201 (Created)

```json
{
    "name": "Nome do Produto",
    "ean": "1234567890123",
    "min_price": 19.89,
    "max_price": 25.0,
    "image": "/media/produtos/nome-do-arquivo.jpg"
}
```

### 2. Listagem de Produtos

**Endpoint:** `/api/products/`  
**Método:** `GET`  
**Descrição:** Endpoint para listar todos os produtos cadastrados.

**Resposta:**
- **Status Code:** 200 (OK)

```json
[
    {
        "id": 1,
        "name": "Produto A",
        "ean": "1234567890123",
        "min_price": 10.0,
        "max_price": 20.0,
        "image": "/media/produtos/produto-a.jpg"
    },
    {
        "id": 2,
        "name": "Produto B",
        "ean": "9876543210987",
        "min_price": 15.0,
        "max_price": 30.0,
        "image": "/media/produtos/produto-b.jpg"
    }
    // Outros produtos...
]
```

### 3. Detalhes de um Produto

**Endpoint:** `/api/products/{product_id}/`  
**Método:** `GET`  
**Descrição:** Endpoint para obter detalhes de um produto específico.

**Resposta:**
- **Status Code:** 200 (OK)

```json
{
    "id": 1,
    "name": "Produto A",
    "ean": "1234567890123",
    "min_price": 10.0,
    "max_price": 20.0,
    "image": "/media/produtos/produto-a.jpg"
}
```

### 4. Atualização de um Produto

**Endpoint:** `/api/products/{product_id}/`  
**Método:** `PUT`  
**Descrição:** Endpoint para atualizar um produto existente.

**Corpo da Requisição:**

```json
{
    "name": "Novo Nome do Produto",
    "ean": "1234567890123",
    "min_price": 15.0,
    "max_price": 25.0,
    "image": "/media/produtos/novo-nome-do-arquivo.jpg"
}
```

**Resposta:**
- **Status Code:** 200 (OK)

```json
{
    "id": 1,
    "name": "Novo Nome do Produto",
    "ean": "1234567890123",
    "min_price": 15.0,
    "max_price": 25.0,
    "image": "/media/produtos/novo-nome-do-arquivo.jpg"
}
```

### 5. Exclusão de um Produto

**Endpoint:** `/api/products/{product_id}/`  
**Método:** `DELETE`  
**Descrição:** Endpoint para excluir um produto existente.

**Resposta:**
- **Status Code:** 204 (No Content)

### 6. Cadastro de variação de preço

**Endpoint:** `/api/price-variation/{product_id}/`  
**Método:** `POST`  
**Descrição:** Endpoint para cadastrar variações de preço de um produto.  
**Corpo da Requisição:**

```json
{
    "price": 25.0
}
```

**Resposta:**
- **Status Code:** 201 (Created)

```json
{
    "price": 25.0
}
```

## Modelos de Dados

O projeto utiliza dois modelos de dados principais:

### 1. Produto

- **Nome (name):** O nome do produto.
- **Código EAN (ean):** O código único de 13 dígitos associado ao produto.
- **Preço Mínimo (min_price):** O preço mínimo do produto.
- **Preço Máximo (max_price):** O preço máximo do produto.
- **Imagem (image):** Uma imagem opcional do produto.

### 2. Variação de Preço

- **Preço (price):** O preço registrado na variação de preço.

Esses modelos de dados são fundamentais para o controle de produtos e suas variações de preço ao longo do tempo, facilitando o gerenciamento e o acompanhamento das informações relacionadas aos produtos. Os produtos podem ser adicionados, editados e excluídos, enquanto as variações de preço permitem o registro das mudanças nos preços dos produtos em diferentes momentos. Esses dados são essenciais para o trabalho dos promotores e para o controle eficiente dos produtos em sua aplicação.

## Testes Unitários

Os testes unitários são executados automaticamente quando o contêiner é iniciado. Se desejar executá-los manualmente, você pode usar o seguinte comando:

```bash
python3 manage.py test
```

## Autor

Este projeto foi desenvolvido por Miquéias.
