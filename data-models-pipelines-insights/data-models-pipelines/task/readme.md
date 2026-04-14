# Documentação da Atividade de Pipeline ETL (Teste)

Esta pasta contém um exemplo prático de uma pipeline ETL desenvolvida em Python, projetada para ser executada no **Google Colab**. O objetivo é demonstrar na prática os conceitos aprendidos sobre extração, transformação e carregamento de dados.

## 1. O Arquivo do Notebook
O arquivo `etl_test.ipynb` é um Jupyter Notebook que simula o fluxo de dados de uma loja de tecnologia.

---

## 2. Explicação dos Trechos de Código

### A. Setup e Bibliotecas
O script utiliza as seguintes bibliotecas principais:
* **Pandas**: Essencial para manipulação de tabelas (DataFrames).
* **Numpy**: Utilizado para operações matemáticas.
* **Datetime**: Para lidar com formatos de data.

### B. Fase: Extração (Extract)
A função `extract_data()` simula a origem dos dados. 
* **Entrada**: Um dicionário Python simulando registros de um banco de dados.
* **O que faz**: Cria um DataFrame inicial com colunas como `id_pedido`, `data`, `produto`, `quantidade` e `valor_unitario`.
* **Saída**: Um DataFrame "bruto" (raw data).

### C. Fase: Transformação (Transform)
A função `transform_data()` realiza a limpeza e a inteligência sobre os dados.
* **Passos realizados**:
 1. **Tipagem**: Converte a coluna de texto para `datetime`.
 2. **Cálculo de Transação**: Multiplica `quantidade` por `valor_unitario` para gerar o `valor_total`.
 3. **Cálculo de Imposto**: Aplica uma regra de negócio de 10% sobre o total.
 4. **Agrupamento Temporal**: Cria uma coluna de `mes_referencia` para facilitar relatórios mensais.
* **Entrada**: DataFrame bruto.
* **Saída**: DataFrame limpo e enriquecido com novas métricas.

### D. Fase: Carregamento (Load)
A função `load_data()` simula a entrega para o destino final (Data Warehouse ou Plataforma de BI).
* **O que faz**: Agrupa os dados por **Categoria** e calcula o faturamento total e o volume de pedidos por tipo de produto.
* **Entrada**: DataFrame transformado.
* **Saída**: Um relatório analítico exibido na tela e a geração de um arquivo físico chamado `relatorio_final_vendas.csv`.

---

## 3. Esquema de Dados (Schema)

| Coluna | Descrição | Tipo |
| :--- | :--- | :--- |
| `id_pedido` | Identificador único da transação | Integer |
| `data` | Data da compra | Datetime |
| `produto` | Nome do item vendido | String |
| `categoria` | Segmento do produto (Hardware, Periférico, etc) | String |
| `quantidade` | Volume de itens no pedido | Integer |
| `valor_unitario` | Preço de um único item | Float |
| `valor_total` | Faturamento bruto da linha (Qtd * Preço) | Float |
| `imposto` | Valor do imposto retido (10%) | Float |

---

## 4. Como Executar no Google Colab
1. Acesse o [Google Colab](https://colab.research.google.com/).
2. Faça o upload do arquivo `etl_test.ipynb`.
3. Clique em **Ambiente de Execução > Executar tudo**.
4. Observe a saída das tabelas em cada estágio.
