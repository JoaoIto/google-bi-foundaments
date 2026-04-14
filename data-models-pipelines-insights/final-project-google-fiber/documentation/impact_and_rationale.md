# Justificativa Técnica e Impacto do Projeto

Este documento serve como preparação para apresentações e entrevistas técnicas, explicando as decisões tomadas durante a fase de engenharia de dados do projeto Google Fiber.

## 1. Por que usamos UNION ALL?
**Decisão**: Optamos pelo `UNION ALL` em vez de `JOIN` para combinar as tabelas dos mercados 1, 2 e 3.

**Justificativa**: 
- As tabelas possuem **estruturas de colunas idênticas** (esquemas homogêneos).
- O objetivo era a **unificação horizontal** (empilhamento de linhas) para criar um dataset global de atendimento, e não o enriquecimento de linhas existentes com novas colunas.
- O `UNION ALL` é computacionalmente mais eficiente que o `UNION` (que remove duplicatas), e neste cenário, cada linha representa um evento único de data/tipo que deve ser preservado.

## 2. Limpeza e Transformação (Data Cleaning)
**Ação**: Implementação de `COALESCE` para tratar valores nulos.

**Justificativa**: 
- Identificamos valores `null` em alguns campos de repetições (ex: `contacts_n_7`). 
- Cálculos matemáticos em SQL que envolvem `NULL` resultam em `NULL`. Para garantir a **integridade da Tabela de Relatório**, os nulos foram convertidos em `0`, permitindo somas precisas do volume total de interações.

## 3. Impacto no Negócio
O desenvolvimento desta **Tabela de Destino Unificada** tem impactos diretos na operação:
- **Redução de Ruído**: Ao consolidar as cidades, a liderança agora tem uma visão holística, podendo comparar o desempenho de resolução entre diferentes mercados em um único lugar.
- **Eficiência Operacional**: Identificar picos de chamadas repetidas por "Tipo de Problema" permite que a equipe de treinamento foque em scripts de resolução específicos que estão falhando no primeiro contato.
- **Escalabilidade**: O pipeline SQL está preparado para receber novos mercados (Market 4, 5, etc.) bastando adicionar novos blocos de `UNION ALL`.

## 4. Próximas Etapas
Com os dados limpos e as métricas de repetição já calculadas na camada de dados (BigQuery), a próxima fase no Tableau focará puramente em **storytelling visual** e identificação de tendências sazonais.
