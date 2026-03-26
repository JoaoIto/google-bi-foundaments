# 🏗️ ModelagemDimensional e Arquitetura de Dados: Aplicação Prática

Esta seção documenta a transição dos requisitos de negócio (Parte 1) para a estrutura técnica de dados (Parte 2). O objetivo é construir um Data Warehouse robusto para o cenário da Google Fiber, utilizando os princípios de modelagem dimensional.

## 1. Princípios de Design e Contrato de Dados (Schema)

A criação deste Data Warehouse segue rigorosamente os quatro elementos-chave para a validação e utilidade dos dados:

1.  **Definição de Dados Relevantes:** O modelo foca exclusivamente nos dados necessários para responder às perguntas de negócio definidas na Parte 1, eliminando ruídos e otimizando o armazenamento.
2.  **Tipagem Estrita e Nomenclatura:** Adotou-se a convenção de nomenclatura `snake_case` (ex: `order_id`) por ser um padrão de mercado que melhora a legibilidade e consistência. Cada coluna possui um tipo de dado técnico definido (ex: `INTEGER`, `TIMESTAMP`, `STRING`) para garantir a integridade.
3.  **Formatação Consistente:** O esquema impõe regras de validação para garantir que cada entrada de dados seja uma instância fiel do modelo, essencial para a precisão das ferramentas de visualização.
4.  **Integridade Referencial via Chaves:** O modelo utiliza **Chaves Primárias (PK)** para identificação única de registros e **Chaves Estrangeiras (FK)** para estabelecer conexões confiáveis entre as tabelas.

---

## 2. Estudo de Caso de Referência: Francisco's Electronics

A engenheira de BI, Mia, projetou o repositório `sales_warehouse` com decisões estratégicas que servem de base para este projeto:

* **Esquema em Estrela (Star Schema):** Escolhido por ser otimizado para leitura, análises históricas e agregações rápidas. Simplifica a lógica de relatórios e melhora a performance de consultas.
* **Precisão Numérica:** Utilização de `DECIMAL(10,2)` para campos financeiros, garantindo precisão até o centavo e evitando erros de arredondamento comuns em cálculos flutuantes.

O mapeamento de chaves da tabela central `Sales` exemplifica como a integridade é mantida:

| Chave Estrangeira (na tabela Sales) | Tabela de Referência (Dimensão) | Objetivo Técnico |
| :--- | :--- | :--- |
| `order_id` | `Orders` | Integrar a venda ao registro operacional do pedido. |
| `product_id` | `Products` | Associar a transação ao item específico do inventário. |
| `user_id` | `Users` | Identificar de forma única o cliente que realizou a compra. |
| `shipping_address_id` | `Locations` | Definir a localização de destino para logística de envio. |

---

## 3. Aplicação Prática: Data Warehouse Google Fiber Support

Nesta fase, aplicamos os conceitos acima para modelar os dados de chamados de suporte da Google Fiber. O objetivo é criar um esquema que permita analisar e reduzir o volume de chamadas repetidas.

### 🌟 Escolha da Arquitetura: Esquema em Estrela

Assim como no caso de referência, foi adotado o **Esquema em Estrela**. Esta arquitetura centraliza a tabela de **Fatos** (o evento do chamado) e a conecta a tabelas de **Dimensão** (os contextos do evento). Esta abordagem facilita as consultas complexas e agregações necessárias para os dashboards definidos na Parte 1.

### 📊 Diagrama de Entidade-Relacionamento (ERD) e Dicionário Técnico

O diagrama abaixo visualiza as tabelas, colunas, chaves e relacionamentos do banco de dados `fiber_support_warehouse`.

```markdown
# [Diagrama ERD Placeholder]
# Este diagrama deve ser gerado e inserido como uma imagem no README final.
# Ele deve mostrar a tabela fact_tickets no centro conectada às dim_markets, dim_problem_types, e dim_date.
```

Abaixo está o dicionário de dados detalhando a tipagem e o raciocínio técnico para cada campo:

#### Tabela de Fatos: `fact_support_tickets`
Esta tabela registra os eventos quantificáveis (as "métricas") de cada chamado de suporte.

| Coluna (Campo) | Tipo de Dado (SQL/BigQuery) | Descrição Técnica e Racional |
| :--- | :--- | :--- |
| `ticket_id` (PK) | `INTEGER` / `INT64` | Identificador único e sequencial de cada chamado. Serve como chave primária. |
| `market_id` (FK) | `INTEGER` / `INT64` | Chave estrangeira ligando o chamado ao mercado regional. |
| `problem_type_id` (FK) | `INTEGER` / `INT64` | Chave estrangeira ligando o chamado à categoria do problema. |
| `date_id` (FK) | `DATE` / `DATE` | Chave estrangeira ligando o chamado à dimensão de tempo. |
| `is_repeated_call` | `BOOLEAN` / `BOOL` | Campo binário (Verdadeiro/Falso) indicando se este é um chamado repetido de um cliente anterior. Essencial para a métrica de sucesso do projeto. |
| `call_duration_seconds` | `INTEGER` / `INT64` | Tempo de duração do atendimento em segundos. Utilizado para medir eficiência operacional. |

#### Tabela de Dimensão: `dim_markets`
Esta tabela fornece o contexto geográfico do chamado.

| Coluna (Campo) | Tipo de Dado (SQL/BigQuery) | Descrição Técnica e Racional |
| :--- | :--- | :--- |
| `market_id` (PK) | `INTEGER` / `INT64` | Identificador único do mercado regional. |
| `market_name` | `VARCHAR(100)` / `STRING` | Nome do mercado (ex: 'Market A', 'Market B'). Utilizado para filtros e agrupamentos nos relatórios. |

#### Tabela de Dimensão: `dim_problem_types`
Esta tabela detalha as categorias e descrições dos problemas relatados.

| Coluna (Campo) | Tipo de Dado (SQL/BigQuery) | Descrição Técnica e Racional |
| :--- | :--- | :--- |
| `problem_type_id` (PK) | `INTEGER` / `INT64` | Identificador único do tipo de problema. |
| `problem_category` | `VARCHAR(100)` / `STRING` | Categoria de alto nível (ex: 'WiFi', 'Suporte Técnico', 'Financeiro'). |
| `problem_description` | `TEXT` / `STRING` | Descrição detalhada do problema específico relatado pelo cliente. |

#### Tabela de Dimensão: `dim_date`
Esta tabela é vital para análises temporais, sazonalidade e tendências.

| Coluna (Campo) | Tipo de Dado (SQL/BigQuery) | Descrição Técnica e Racional |
| :--- | :--- | :--- |
| `date_id` (PK) | `DATE` / `DATE` | A data exata como chave primária (ex: '2023-10-27'). |
| `full_date` | `DATE` / `DATE` | A data completa, muitas vezes redundante com o ID mas útil para manipulação. |
| `month_name` | `VARCHAR(20)` / `STRING` | Nome do mês (ex: 'Janeiro'). Utilizado para agregações mensais. |
| `quarter` | `INTEGER` / `INT64` | O trimestre do ano (1, 2, 3 ou 4). Essencial para as métricas trimestrais solicitadas pelos stakeholders. |
| `year` | `INTEGER` / `INT64` | O ano da ocorrência. |

---

> **Principais Conclusões e Próximos Passos:**
> O design deste esquema fornece a base infraestrutural para responder às perguntas críticas do projeto Google Fiber. Ao utilizar o Esquema em Estrela e tipagem estrita, garantimos integridade e performance. Os próximos passos envolverão a criação de scripts SQL para implementar este modelo no BigQuery e o desenvolvimento de pipelines de ETL para popular estas tabelas a partir de fontes de dados brutos.
