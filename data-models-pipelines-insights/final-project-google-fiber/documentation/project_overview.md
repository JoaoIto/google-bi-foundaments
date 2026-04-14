# Visão Geral do Projeto: Google Fiber

Este projeto final do Curso 2 foca na **preparação e modelagem de dados** para resolver um problema real de atendimento ao cliente: a redução de chamadas repetidas.

## Cenário do Negócio
O Google Fiber fornece internet de fibra óptica. A equipe de atendimento quer entender por que os clientes ligam repetidas vezes (dentro de uma janela de 7 dias) para o suporte. Reduzir essas repetições melhora a satisfação do cliente e a eficiência operacional.

## Metas Técnicas
1. **Consolidação**: Unir dados de três diferentes cidades/mercados (`market_1`, `market_2`, `market_3`).
2. **Modelagem**: Criar uma tabela de destino (Target Table) que unifique as estruturas idênticas.
3. **Métricas**: Preparar os campos para o cálculo da taxa de resolução no primeiro contato no Curso 3.

## Tabela de Relatório Final (Rubrica Item 9)
A solução gera uma **Reporting Table** consolidada (`google_fiber_final_report`) que contém todos os componentes necessários para a visualização:
- `market`: Origem geográfica.
- `call_type`: Categoria do problema.
- `initial_contacts`: Volume base.
- `total_repeat_calls`: Soma das repetições em 7 dias.
- `total_interaction_volume`: Volume total processado.

## Habilidades Demonstradas
- Utilização do BigQuery para ingestão de dados CSV.
- Escrita de queries SQL complexas usando `UNION ALL`.
- Transformação de dados brutos em tabelas de relatório prontas para visualização.

---
Este projeto serve como ponte para o Curso 3, onde os dados aqui gerados serão visualizados no Tableau.
