# Estudo de Caso: Fusão de Dados e BigQuery Sandbox

Este módulo foca na integração de dados de múltiplas fontes e no uso do BigQuery como um Data Warehouse centralizado para gerar insights de negócio.

---

## Estudo de Caso: Cafeteria Aviva

### O Problema
Aviva, uma profissional de BI em uma rede de cafeterias, precisava identificar quais itens sazonais do menu eram mais populares e lucrativos. O objetivo era apoiar decisões sobre preços, promoções e a manutenção ou descontinuação de produtos.

### A Solução (Extração e Fusão)
Para resolver o problema, Aviva seguiu estratégias de extração de dados:
1. **Reunião com Stakeholders:** Identificou objetivos, métricas (vendas, marketing) e fontes de dados (vendas, feedback, POS).
2. **Observação Prática:** Acompanhou as equipes em ação para entender como o dado impacta as metas da organização.
3. **Organização no BigQuery:** Após extrair os dados, ela os transformou e carregou em uma **tabela de destino** unificada no BigQuery.

### Os Resultados
A análise revelou que:
- Produtos de **Hortelã-pimenta** (peppermint) perderam popularidade.
- Produtos de **Canela** (cinnamon) tiveram aumento na demanda.
- **Ação:** A empresa decidiu aposentar três itens de hortelã e lançar novas ofertas baseadas em canela com campanhas promocionais.

---

## Atividade Prática: BigQuery Sandbox

O BigQuery Sandbox permite explorar os recursos do BigQuery sem custo e **sem a necessidade de um cartão de crédito**.

### 1. Como configurar o Sandbox:
1. Acesse o [Console do Google Cloud](https://console.cloud.google.com/).
2. Faça login com sua conta Google.
3. No menu de navegação, selecione **BigQuery**.
4. Se aparecer um banner sobre o "BigQuery Sandbox", clique em **Confirmar** ou **Começar**.
5. Crie um novo projeto (ex: `bi-studies-sandbox`).

> [!TIP]
> No modo Sandbox, você tem limites gratuitos mensais (10GB de armazenamento e 1TB de processamento de consultas). Os conjuntos de dados no Sandbox têm um tempo de vida padrão de 60 dias.

### 2. Guia Passo a Passo no Console
Siga estes passos para executar sua primeira consulta em dados reais:

1. **Acesse o BigQuery Studio:** Abra o [Console do BigQuery](https://console.cloud.google.com/bigquery).
2. **Abra o Editor:** No centro da tela, clique no botão **`+ Consulta SQL`**.
![alt text](./assets/image.png)
3. **Cole a Query de Exemplo:** Use o código abaixo ou o arquivo [`query_exemplo.sql`](./query_exemplo.sql) salvo nesta pasta.
4. **Execute:** Clique no botão azul **`EXECUTAR`** no topo da aba.

### 3. Explorando Dados Públicos
Para descobrir novos conjuntos de dados:
1. No painel **Explorer** (à esquerda), clique no botão **`+ ADICIONAR`**.
2. Selecione **`Conjuntos de dados públicos`**.
3. Pesquise por termos como "usa_names", "austin_bikeshare" ou "weather".

---

## Consulta de Prática (Baby Names)
Tente descobrir os 10 nomes de bebês mais populares nos EUA em 2023:

```sql
SELECT
 name,
 SUM(number) AS total
FROM
 `bigquery-public-data.usa_names.usa_1910_current`
WHERE
 year = 2023
GROUP BY
 name
ORDER BY
 total DESC
LIMIT 10;
```

> [!NOTE]
> Esta consulta utiliza o conjunto de dados público `usa_names`.

---

## Consulta Adicional (Austin Bike Share)
Tente descobrir qual estação de bicicletas em Austin possui mais viagens iniciadas:

```sql
SELECT
 start_station_name,
 COUNT(*) as total_trips
FROM
 `bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY
 start_station_name
ORDER BY
 total_trips DESC
LIMIT 10;
```

---

## Principais Conclusões
- A fusão de dados permite responder perguntas complexas que uma única fonte não conseguiria.
- Tabelas de destino facilitam a criação de dashboards claros.
- O modo Sandbox é a ferramenta ideal para profissionais de BI treinarem SQL e modelagem sem custos.
