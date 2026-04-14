/*
  Query SQL: Criação de Tabela de Relatório Final (Google Fiber)
  Objetivo: Consolidar, limpar e transformar os dados dos mercados 1, 2 e 3.
  Alinhamento com a Rubrica: Pontos 4, 7, 8 e 9 (União, Limpeza, Transformação e Tabela Final).
*/

-- Criar Tabela de Destino Consolidada com Limpeza de Dados e Métricas
SELECT
  -- 1. Dimensões Temporais e de Negócio
  date_created,
  new_type AS call_type,
  new_market AS market,

  -- 2. Limpeza de Dados (Ponto 7 da Rubrica)
  -- Tratando possíveis valores nulos como 0 para garantir consistência nos cálculos
  COALESCE(contacts_n, 0) AS initial_contacts,
  COALESCE(contacts_n_1, 0) AS repeats_day_1,
  COALESCE(contacts_n_2, 0) AS repeats_day_2,
  COALESCE(contacts_n_3, 0) AS repeats_day_3,
  COALESCE(contacts_n_4, 0) AS repeats_day_4,
  COALESCE(contacts_n_5, 0) AS repeats_day_5,
  COALESCE(contacts_n_6, 0) AS repeats_day_6,
  COALESCE(contacts_n_7, 0) AS repeats_day_7,

  -- 3. Transformação de Dados e Métricas (Pontos 5 e 8 da Rubrica)
  -- Cálculo do total de chamadas repetidas na janela de 7 dias
  (
    COALESCE(contacts_n_1, 0) + 
    COALESCE(contacts_n_2, 0) + 
    COALESCE(contacts_n_3, 0) + 
    COALESCE(contacts_n_4, 0) + 
    COALESCE(contacts_n_5, 0) + 
    COALESCE(contacts_n_6, 0) + 
    COALESCE(contacts_n_7, 0)
  ) AS total_repeat_calls,

  -- Cálculo do volume total de interações (Inicial + Repetições)
  (
    COALESCE(contacts_n, 0) +
    COALESCE(contacts_n_1, 0) + 
    COALESCE(contacts_n_2, 0) + 
    COALESCE(contacts_n_3, 0) + 
    COALESCE(contacts_n_4, 0) + 
    COALESCE(contacts_n_5, 0) + 
    COALESCE(contacts_n_6, 0) + 
    COALESCE(contacts_n_7, 0)
  ) AS total_interaction_volume

FROM (
  SELECT * FROM `seu-projeto.seu_dataset.market_1`
  UNION ALL
  SELECT * FROM `seu-projeto.seu_dataset.market_2`
  UNION ALL
  SELECT * FROM `seu-projeto.seu_dataset.market_3`
) AS combined_raw_data;
