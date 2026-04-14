/*
  Query SQL: Criação de Tabela de Relatório Final (Google Fiber) - VERSÃO FINAL
  Objetivo: Consolidar, limpar e transformar os dados dos mercados Um, Dois e Três.
  Alinhamento com a Rubrica: Pontos 4, 7, 8 e 9 (União, Limpeza, Transformação e Tabela Final).
  
  Nota: Aplicado SAFE_CAST para garantir que colunas STRING sejam tratadas como INTEGER 
  durante os cálculos matemáticos.
*/

SELECT
  -- 1. Dimensões Temporais e de Negócio
  date_created,
  new_type AS call_type,
  new_market AS market,

  -- 2. Limpeza de Dados e Conversão de Tipos (Pontos 7 e 8 da Rubrica)
  COALESCE(SAFE_CAST(contacts_n AS INT64), 0) AS initial_contacts,
  COALESCE(SAFE_CAST(contacts_n_1 AS INT64), 0) AS repeats_day_1,
  COALESCE(SAFE_CAST(contacts_n_2 AS INT64), 0) AS repeats_day_2,
  COALESCE(SAFE_CAST(contacts_n_3 AS INT64), 0) AS repeats_day_3,
  COALESCE(SAFE_CAST(contacts_n_4 AS INT64), 0) AS repeats_day_4,
  COALESCE(SAFE_CAST(contacts_n_5 AS INT64), 0) AS repeats_day_5,
  COALESCE(SAFE_CAST(contacts_n_6 AS INT64), 0) AS repeats_day_6,
  COALESCE(SAFE_CAST(contacts_n_7 AS INT64), 0) AS repeats_day_7,

  -- 3. Transformação de Dados e Métricas
  (
    COALESCE(SAFE_CAST(contacts_n_1 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_2 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_3 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_4 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_5 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_6 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_7 AS INT64), 0)
  ) AS total_repeat_calls,

  (
    COALESCE(SAFE_CAST(contacts_n AS INT64), 0) +
    COALESCE(SAFE_CAST(contacts_n_1 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_2 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_3 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_4 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_5 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_6 AS INT64), 0) + 
    COALESCE(SAFE_CAST(contacts_n_7 AS INT64), 0)
  ) AS total_interaction_volume

FROM (
  SELECT * FROM `marketUm.marketUm`
  UNION ALL
  SELECT * FROM `marketTwo.marketTwo`
  UNION ALL
  SELECT * FROM `marketThree.marketThree`
) AS combined_raw_data;
