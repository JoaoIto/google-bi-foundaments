# Atividade 5: Tendências Culturais com Google Books Ngrams

Este estudo explora um dos maiores conjuntos de dados públicos do BigQuery: o **Google Books Ngrams**. Ele permite analisar como o uso de certas palavras e conceitos evoluiu ao longo de séculos.

---

## O Dataset: `google_books_ngrams_2020`

O GoogleBooks Ngrams contém a contagem de palavras (1-grams) e sequências de palavras (2-grams, 3-grams, etc.) encontradas em milhões de livros digitalizados pelo Google.
- **Tabelas Usadas:** `eng_1` (Palavras individuais em inglês).
- **Bilhões de Linhas:** É um excelente exercício de BI para aprender a lidar com volumes massivos de dados (**Petabytes**).

---

## O Desafio de BI: Análise de Tendências
Como profissional de BI, você pode usar esses dados para entender mudanças culturais, o surgimento de tecnologias ou o declínio de termos obsoletos.

### Exemplo de Pergunta de Negócio:
"Como o interesse por 'Data', 'Science' e 'Technology' cresceu a partir da segunda metade do século XX?"

---

## Como Praticar

1. **Acesse o Console:** [BigQuery Studio](https://console.cloud.google.com/bigquery).
2. **Abra o arquivo SQL:** Use a query disponível em [`query_ngrams.sql`](./query_ngrams.sql).
3. **Filtragem e UNNEST:** Como a coluna `years` é um ARRAY (lista), usamos `UNNEST` para processar os dados por ano.

---

## Consulta SQL de Exemplo (Versão Corrigida)

```sql
SELECT
 term,
 y.year,
 SUM(y.term_frequency) AS total_occurrences
FROM
 `bigquery-public-data.google_books_ngrams_2020.chi_sim_1`,
 UNNEST(years) AS y
WHERE
 term IN ('data', 'science', 'technology')
 AND y.year >= 1950
GROUP BY
 term, y.year
ORDER BY
 y.year ASC, total_occurrences DESC;
```

> [!TIP]
> **Por que usar UNNEST?** No BigQuery, quando um campo é do tipo `RECORD` ou `REPEATED` (como o `years` neste dataset), ele armazena vários valores em uma única linha. O `UNNEST` "achata" esses dados, permitindo que você aplique filtros (como `y.year >= 1950`) e agregações em cada item individual da lista.

---

## Conclusão
Analisar o Ngrams é uma forma poderosa de visualizar o **Pipeline de Insights** na prática: transformar bilhões de registros brutos em um gráfico de linhas que mostra claramente a ascensão da era da informação.

![queryResult](./assets/queryResult.png)