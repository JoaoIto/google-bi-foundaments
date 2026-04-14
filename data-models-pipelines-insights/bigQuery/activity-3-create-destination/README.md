# Atividade 3: Unificar Dados com Tabelas de Destino

Esta atividade foca em um estágio crítico do pipeline de BI: a **Extração** e o uso de **Tabelas de Destino** para unificar e processar dados brutos em informações acionáveis.

---

## Visão Geral
Como profissional de BI, você usa tabelas de destino como locais predeterminados para consolidar dados vindos de diversas fontes. Isso permite que a equipe de BI processe e limpe os dados antes de servirem como base para dashboards e tomadores de decisão.

---

## Cenário: Consultoria para o Gabinete do Prefeito de São Francisco
O Prefeito de São Francisco planeja lançar um **Programa Anual de Valorização das Árvores**, que decorará as árvores das ruas da cidade. Para isso, o gabinete precisa de uma lista dos **10 principais endereços com maior densidade de árvores**.

### Objetivo do BI:
- Localizar árvores maduras em endereços específicos.
- Prover dados para planejamento de suprimentos (decorações) e logística de limpeza após o evento.

### O Dataset: `San Francisco Street Trees`
Disponível publicamente no BigQuery, este dataset contém mais de 190.000 linhas de dados históricos (desde 1955) sobre as árvores mantidas pelo Departamento de Obras Públicas, incluindo IDs únicos, localizações exatas e coordenadas geográficas.

---

## Passo a Passo da Execução

1. **Acesse o Console:** Abra o [BigQuery Studio](https://console.cloud.google.com/bigquery).
2. **Adicione Dados Públicos:**
 - Clique em **`+ ADICIONAR`** no menu Explorer.
 - Selecione **`Conjuntos de dados públicos`**.
 - Pesquise por "San Francisco Street Trees" e selecione "View Dataset".
3. **Execute a Consulta:** Use o arquivo de consulta localizado em [`data/querySanFrancisco.sql`](./data/querySanFrancisco.sql).
4. **Salve os Resultados:** Após a execução, clique em **`SALVAR RESULTADOS`** e escolha **`CSV (arquivo local)`**.

---

## Análise da Consulta SQL

```sql
SELECT
 address,
 COUNT(address) AS number_of_trees
FROM
 `bigquery-public-data.san_francisco_trees.street_trees`
WHERE
 address != "null"
GROUP BY address
ORDER BY number_of_trees DESC
LIMIT 10;
```

### Explicação das Cláusulas:
- **SELECT INTO**: Seleciona os endereços e utiliza `COUNT()` para quantificar as árvores em cada local.
- **WHERE**: Garante que endereços nulos sejam excluídos da lista oficial.
- **GROUP BY / ORDER BY**: Agrupa os resultados por localidade e os organiza do maior para o menor número de árvores.
- **LIMIT 10**: Restringe as top 10 localidades prioritárias para o evento.

---

## Resultados e Recomendações de BI

Os dados extraídos foram salvos no link abaixo:
 **[Ver Resultados CSV (Exportados)](./data/bq-results-sanfrancisco-trees.csv)**

### Próximos Passos (Estratégicos):
Para agregar valor real ao trabalho do prefeito, um profissional de BI deve recomendar:
1. **Painel de Controle:** Visualização dos endereços com as árvores mais adequadas para decoração.
2. **Gerenciamento de Suprimentos:** Estimativa exata de materiais com base no `number_of_trees`.
3. **Logística Eficiente:** Planejamento de rotas de decoração e limpeza para otimizar o tempo das equipes urbanas.

---

> [!NOTE]
> Os dados desta atividade foram fornecidos pelo portal oficial [data.sfgov.org](https://data.sfgov.org/).
