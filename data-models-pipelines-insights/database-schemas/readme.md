# Modelagem de Dados: Estruturas e Melhores Práticas

Para garantir que um banco de dados de BI seja funcional e livre de erros, ele deve seguir um contrato rigoroso: o **Esquema (Schema)**. O esquema funciona como a "planta baixa" que valida e organiza os dados para que sejam úteis aos usuários finais.

## 1. Os 4 Pilares de um Esquema de Sucesso

Antes de criar qualquer tabela, verifique se esses quatro elementos estão presentes:

* **Dados Relevantes:** O modelo deve cobrir apenas o necessário para responder às perguntas de negócio. Menos é mais; dados irrelevantes geram ruído e custo.
* **Nomenclatura e Tipagem:** Cada coluna precisa de um nome claro e um **Tipo de Dado** definido (ex: `INTEGER`, `VARCHAR`, `TIMESTAMP`). Isso evita que um texto entre onde deveria estar um número.
* **Formatação Consistente:** Cada entrada deve ser uma instância fiel do esquema. A padronização garante que ferramentas de BI (como Tableau ou Looker) consigam ler os dados sem falhas.
* **Chaves Exclusivas (O "Elo"):** O uso de **Chaves Primárias (PK)** e **Chaves Estrangeiras (FK)** é o que permite conectar tabelas e realizar cruzamentos de dados complexos.

---

## 2. Estudo de Caso: Francisco's Electronics

Neste cenário, a engenheira Mia projetou o `sales_warehouse` para suportar o lançamento de um e-commerce. Abaixo, analisamos as decisões estratégicas por trás do design:

### Por que o Esquema em Estrela (Star Schema)?
Mia escolheu o **Esquema em Estrela** porque ele é otimizado para **leitura e performance**. 
* **Estrutura:** Uma tabela central de **Fatos** (ex: `Sales`) conectada a várias tabelas de **Dimensão** (ex: `Products`, `Users`).
* **Vantagem:** Consultas mais simples, agregações (Soma, Média) mais rápidas e lógica de relatórios simplificada para o gerente de vendas.



### Convenções de Nomenclatura: Snake Case
A escolha do `snake_case` (ex: `order_id`, `created_at`) não é apenas estética. É um padrão de mercado que:
1. Evita problemas com sistemas que diferenciam maiúsculas/minúsculas.
2. Melhora a legibilidade para outros analistas e engenheiros.

### Precisão Numérica com `DECIMAL(10,2)`
Para campos financeiros, Mia evitou erros de arredondamento comuns em tipos flutuantes.
* **O que significa?** O dado pode ter até 10 dígitos no total, sendo 2 após o ponto decimal. 
* **Por que usar?** Garante que o cálculo de impostos e taxas seja exato até o último centavo.

---

## 3. Mapeamento de Chaves (Integridade Referencial)

A tabela central `Sales` atua como o ponto de união. Veja como as chaves estrangeiras (`FK`) garantem a integridade do sistema:

| Chave Estrangeira (na tabela Sales) | Tabela de Referência (Dimensão) | Objetivo |
| :--- | :--- | :--- |
| `order_id` | `Orders` | Conectar a venda ao pedido original. |
| `product_id` | `Products` | Saber qual item foi vendido. |
| `user_id` | `Users` | Identificar o cliente. |
| `shipping_address_id` | `Locations` | Saber para onde enviar o produto. |

---

