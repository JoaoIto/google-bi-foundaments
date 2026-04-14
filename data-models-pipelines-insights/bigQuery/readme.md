# BigQuery Technical Hub - Fundamentos, Pipelines e Insights

Este repositório consolidado serve como o centro de conhecimento para o módulo de **Google BigQuery**. Aqui exploramos desde a arquitetura teórica de sistemas de banco de dados modernos até a aplicação prática de engenharia de dados e análise de Business Intelligence.

---

## Sumário de Atividades e Práticas

Abaixo, apresentamos a trilha de aprendizado deste módulo, conectando cada atividade aos seus conceitos nucleares e resultados práticos.

| Atividade | Conceitos Chave | Prática Realizada |
| :--- | :--- | :--- |
| 1 **[Tabela de Destino](./activity-1-destination-table/README.md)** | Extração, SELECT, GROUP BY | Identificação de densidade arbórea em São Francisco via SQL público. |
| 2 **[Fusão de Dados & Sandbox](./activity-2-fusion-and-sandbox/README.md)** | Data Fusion, Sandbox, Public Data | Estudo do caso Aviva Coffee e configuração de ambiente BigQuery sem custos. |
| 3 **[Unificação de Dados](./activity-3-create-destination/README.md)** | ETL, Extração (Total/Incremental), CSV | Criação de pipeline para o Gabinete do Prefeito de SF com exportação de dados. |
| 4 **[Estudo de Caso: Wayfair](./activity-4-wayfair-case-study/README.md)** | Stakeholder Mgmt, Escalabilidade | Análise de design de pipelines complexos em escala global. |
| 5 **[Tendências Culturais (Ngrams)](./activity-5-cultural-trends-ngrams/README.md)** | Big Data, UNNEST, Time-series | Análise histórica de tendências literárias usando Petabytes de dados (Ngrams). |

---

## Deep Dive: Conceitos e Arquitetura

### 1. Ecossistemas de Dados
Para suportar o BI moderno, é fundamental distinguir entre os diferentes sistemas de armazenamento:
- **Data Warehouse:** Consolidado, consistente e otimizado para consultas analíticas (ex: BigQuery).
- **Data Lake:** Repositório de dados brutos em seu formato original (pode conter estruturados e não-estruturados).
- **Data Mart:** Subconjunto de um Warehouse focado em um assunto ou departamento específico.

### 2. Processamento Analítico vs Transacional
- **OLTP (Online Transaction Processing):** Otimizado para registrar transações rápidas (ex: uma venda no caixa). Organizado geralmente por **linhas**.
- **OLAP (Online Analytical Processing):** Otimizado para análise complexa e agregação de grandes volumes. Organizado geralmente de forma **colunar**.

### 3. Modelagem Dimensional
O design que facilita a vida do analista de BI:
- **Fato:** Uma medida quantitativa (ex: valor da venda, número de árvores).
- **Dimensão:** Contextualiza o fato (ex: data, endereço, tipo de árvore).
- **Esquemas:**
 - **Star Schema:** Uma tabela de fatos central ligada a várias dimensões.
 - **Snowflake Schema:** Dimensões secundárias que se expandem a partir das dimensões principais (mais normalizado).

---

## Glossário Temático do Módulo

### Arquitetura e Bancos de Dados
- **Banco de Dados Colunar:** Organizado por colunas, ideal para BI (agregações rápidas).
- **Sistemas Combinados vs Separados:** Bancos onde armazenamento e computação ocorrem no mesmo local ou em locais remotos/distribuídos.
- **Migração de Banco de Dados:** Processo de mover dados entre plataformas (Origem para Destino).
- **Hospedagem Única vs Distribuída:** Dados em um único local físico vs distribuídos globalmente.

### Modelagem de Dados
- **Atributo:** Característica que descreve uma dimensão.
- **Chave Primária e Estrangeira:** Identificadores únicos e suas referências em outras tabelas para manter a integridade relacional.
- **Pattern de Design:** Soluções estabelecidas para modelar dados conforme as necessidades de negócio.
- **Padrão Lógico vs Físico:** Representação das tabelas e sua implementação técnica final.

### Processos, Pipelines e BI
- **ETL (Extrair, Transformar, Carregar):** O coração da unificação de dados.
- **Data Pipeline:** Série de processos que transportam dados da origem ao destino final.
- **Tipos de Extração:**
 - **Notificação:** Disparo automático por mudanças.
 - **Incremental:** Apenas o que mudou desde a última carga.
 - **Completa:** Cópia total da fonte.
- **Governança de BI:** Definir sistemas e estruturas para garantir que os dados sejam ativos confiáveis.

### Estratégia e Metas
- **KPI (Key Performance Indicator):** Valor quantificável ligado diretamente à estratégia de negócio.
- **Métrica vs Métrica de Vaidade:** Dados que medem o sucesso real vs dados que servem apenas para "impressionar" sem gerar insights.
- **Stakeholder:** Parte interessada no projeto (Prefeito, Engenheiro, Gerente).
- **Maturidade dos Dados:** O quanto uma empresa consegue efetivamente extrair valor de seus dados.

---

## Tecnologias e Linguagens
- **Google DataFlow:** Processamento moderno de dados sem servidor.
- **Python:** Linguagem multipropósito líder em Ciência de Dados.
- **Linguagens Compiladas vs Interpretadas:** Execução direta por máquina vs uso de um intérprete.
- **API (Interface de Programação):** A ponte que permite a comunicação entre diferentes softwares.

---
<div align="center">
 <sub>Este módulo faz parte do <b>Google Business Intelligence Professional Certificate</b>.</sub>
</div>
