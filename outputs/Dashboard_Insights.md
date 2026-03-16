# 📊 Painel de Insights: Google Fiber Support Analysis

Este documento apresenta as visualizações geradas pelo dashboard interativo e as principais conclusões extraídas para auxiliar na tomada de decisão estratégica da equipe do Google Fiber.

---

## 📈 Gráfico 1: Tendência Mensal de Chamadas Repetidas
*Foco: Eficácia da Resolução no Primeiro Contato.*

### 🔍 O que o gráfico mostra?
Este gráfico de linha rastreia a **Taxa de Repetição (%)** ao longo do tempo. Ele revela como a eficácia do atendimento varia mês a mês.

![Gráfico Agregações por Trimestre](./grafico1-agregacoes-tri.png)

### 💡 Insights Principais:
- **Volatilidade:** Existem picos claros de repetição em meses específicos (ex: Março, Julho, Dezembro). Isso pode indicar períodos de alta demanda ou lançamentos de novos serviços que geram mais dúvidas.
- **Linha de Base:** A taxa média flutua entre **31% e 35%**. Qualquer valor acima dessa faixa deve disparar um alerta para treinamentos imediatos na equipe de suporte.

---

## 📊 Gráfico 2: Volume de Repetições por Mercado e Tipo
*Foco: Identificação de problemas regionais específicos.*

### 🔍 O que o gráfico mostra?
Compara as 3 cidades (`market_1`, `2` e `3`) cruzando com os 5 tipos de problemas no **primeiro dia** após o contato inicial.

![Gráfico Volume de Repetições por Mercado e Tipo](./grafico2-Market-Problem-Type.png)

### 💡 Insights Principais:
- **Gargalos Técnicos:** O `Type_5 (Internet/Wifi)` e o `Type_2 (Technician)` são consistentemente os maiores causadores de retornos em todos os mercados.
- **Disparidade Regional:** O `market_2` apresenta um volume ligeiramente superior de problemas de WiFi comparado aos outros, sugerindo que a infraestrutura local ou a qualidade do sinal nessa região pode precisar de revisão técnica.

---

## 🌡️ Gráfico 3: Concentração (Heatmap)
*Foco: Visão Holística de Atendimento.*

### 🔍 O que o gráfico mostra?
Um mapa de calor que destaca onde está o maior volume bruto de chamadas originais.

![Gráfico Concentração (Heatmap)](./grafico3-heatmap.png)

### 💡 Insights Principais:
- **Hotspots de Contrato:** O `Type_1 (Account)` tem uma concentração amarela forte no `market_2`. Isso sugere que promoções ou mudanças em faturas afetaram mais essa base de clientes, gerando volume excessivo de chamadas de gestão de conta.
- **Oportunidade de Melhoria:** Problemas de `Scheduling (Type_3)` são mais baixos no `market_3`, o que pode indicar que o sistema de agendamento nessa cidade é mais eficiente ou que há mais técnicos disponíveis.

---

## 🏛️ Gráfico 4: Performance Trimestral
*Foco: Relatório para Liderança (Emma e Keith).*

### 🔍 O que o gráfico mostra?
Comparação entre o volume total de chamadas (`contacts_n`) e o volume que resultou em repetição (`has_repeat`) por trimestre.

![Gráfico Performance Trimestral](./grafico4-performance-trimestral.png)

### 💡 Insights Principais:
- **Volume vs. Qualidade:** Embora o volume total possa cair em certos trimestres, a barra de repetições (laranja) deve diminuir proporcionalmente. Se a barra laranja crescer enquanto a azul cai, a qualidade do atendimento está piorando apesar da menor demanda.
- **Planejamento de Recursos:** Este gráfico permite à Emma prever se precisará de mais analistas no próximo trimestre com base na tendência de crescimento anual.

---

> **Conclusão Geral:** A redução nas chamadas do Google Fiber depende diretamente da melhoria na resolução de primeiro contato para problemas de **Internet/Wifi**. Focar em guias de autoatendimento para esses problemas pode reduzir significativamente o volume geral de chamadas.
