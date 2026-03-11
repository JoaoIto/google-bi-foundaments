# Google Business Intelligence - Projeto Final (Google Fiber)

<div align="center">
  <a href="https://coursera.org/verify/O3KJO7CXWBTA">
    <img src="https://github.com/JoaoIto/google-bi-foundaments/blob/main/docs/certificado.png?raw=true" alt="Certificado - Foundations of Business Intelligence (Google / Coursera)" width="600">
  </a>
  <br>
  <i><b>Certificado Oficial:</b> <a href="https://coursera.org/verify/O3KJO7CXWBTA">Foundations of Business Intelligence (autorizado pelo Google)</a> - Concluído por <b>João Victor Póvoa França</b>.</i>
</div>

---

Este repositório contém a documentação e os requisitos de negócios para o projeto final (fictício) do Certificado Profissional de Business Intelligence do Google. Neste cenário, atuamos como um analista de BI fazendo uma entrevista para a equipe de atendimento ao cliente do Google Fiber.

## Visão Geral do Cenário

O **Google Fiber** fornece internet de fibra óptica. A equipe de atendimento ao cliente deseja explorar tendências de **chamadas repetidas** para reduzir a frequência com que os clientes precisam ligar de volta para resolver o mesmo problema. Nós recebemos anotações de uma reunião com as partes interessadas (Emma Santiago, Keith Portone e Minna Rah) e temos a missão de traduzir essas necessidades de negócios em documentos formais de planejamento de BI.

## Estrutura do Projeto

Os artefatos de planejamento estão consolidados na pasta `docs/`. O projeto final exige as seguintes etapas para a construção da solução de BI:

### Etapa 1: Análise e Entendimento do Problema
Reunir informações a partir das anotações feitas com as partes interessadas (Gerentes de Contratação e Projetos e Analista Líder de BI) e entender que a meta principal é: **Rastrear e reduzir o volume de chamadas repetidas de clientes após a primeira consulta.**

### Etapa 2: Preencher Documento de Requisitos das Partes Interessadas
O `Stakeholder Requirements Document` define o problema comercial:
- **Quem são os stakeholders?** (Emma, Keith, Minna, etc.)
- **Como usarão a ferramenta?**
- **Requisitos de acessibilidade:** Letras grandes e Text-to-Speech (solicitação de Minna).
- **Métricas Primárias:** Frequência de chamadas repetidas, tipos de problemas e dados demográficos do mercado (cidades 1, 2 e 3).

### Etapa 3: Preencher Documento de Requisitos do Projeto
O `Project Requirements Document` traduz necessidades de negócio em requisitos técnicos:
- **Resultados e Métricas Esperadas:** Painel interativo com gráficos medindo as chamadas repetidas agrupadas por data, mercado e tipo de problema ("Type_1" a "Type_5").
- **Agregações necessárias:** Suporte para visualizações por semana, mês, trimestre e ano.

### Etapa 4: Preencher Documento de Estratégia de BI
O `Strategy Document` detalha o plano de execução nas três fases fundamentais de BI:
1. **Capturar:** Levantar os dados (chamadas, contatos na janela de 7 dias, etc).
2. **Analisar:** Aplicar as transformações para categorizar e permitir os agrupamentos temporais.
3. **Monitorar:** Desenhar o painel (dashboard) com os altos contrastes de acessibilidade solicitados e disponibilizá-lo para exploração pela liderança.

### Etapa 5: Identificar Lacunas e Fazer Perguntas
A etapa final de planejamento técnico levanta [perguntas base](./docs/Google_Fiber_Planejamento.md) de fatores não respondidos nos requisitos (ex: Quais metas ou margens de redução a equipe espera?).

---

Para acessar os documentos oficiais unificados, leia:
**👉 [Painel de Detalhamento do Planejamento](./docs/README.md)**
