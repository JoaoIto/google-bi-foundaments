# Planejamento do Projeto de BI: Google Fiber

Com base nas anotações da reunião com a equipe do Google Fiber, abaixo estão os documentos de planejamento de BI solicitados.

---

## 1. Documento de Requisitos das Partes Interessadas (Stakeholder Requirements Document)

**Problema Comercial ou Pergunta Principal:**
O Google Fiber precisa entender a frequência e os motivos pelos quais os clientes entram em contato com o suporte repetidas vezes após uma primeira consulta. O objetivo é compreender a eficácia da equipe de atendimento na resolução de problemas já no primeiro contato, além de explorar as tendências para identificar como melhorar a experiência geral do cliente.

**Partes Interessadas e Seus Cargos:**
*   **Emma Santiago:** Gerente de Contratação (Contato principal)
*   **Keith Portone:** Gerente de Projetos (Contato principal)
*   **Minna Rah:** Analista Líder de BI
*   **Membros da equipe de BI:** Ian Ortega e Sylvie Essa (Analistas de BI)

**Detalhes de Uso das Partes Interessadas:**
*   As partes interessadas (Emma, Keith, Minna, Ian e Sylvie) terão privilégios de visualização do painel (dashboard).
*   Os líderes e analistas usarão a ferramenta de BI para acessar e explorar os dados a fim de rastrear e reduzir os volumes de chamadas em diferentes mercados.
*   **Acessibilidade:** Conforme solicitado por Minna, o painel deve ser acessível, com letras grandes e ter suporte ou alternativas de texto para fala (Text-to-Speech).
*   **Autoatendimento:** As partes interessadas devem ter acesso a todos os conjuntos de dados que compõem o painel para explorar as etapas ativamente.

**Requisitos Primários (Métricas e Insights Necessários):**
*   Medir a frequência das chamadas repetidas após a consulta inicial para cada tipo de contato.
*   Identificar quais tipos de problemas geram mais chamadas repetidas (5 tipos pré-identificados).
*   Explorar as tendências de chamadas em três cidades (market_1, market_2 e market_3).
*   Visualizar as tendências de chamadas agregadas por diferentes intervalos de tempo: semanal, mensal, trimestral e anual.

---

## 2. Documento de Requisitos do Projeto (Project Requirements Document)

**Finalidade do Projeto:**
Desenvolver uma ferramenta de Business Intelligence (painel interativo) usando dados anonimizados para visualizar as tendências de chamadas repetidas dentro de janelas de sete dias. Essa ferramenta ajudará a liderança a reduzir o volume geral de chamadas, otimizar a operação e aumentar a satisfação do cliente.

**Entregas e Métricas Desejadas (Resultados Mensuráveis):**
1.  Gráfico ou tabela para medir as chamadas repetidas pela **data do primeiro contato**.
2.  Gráfico ou tabela para explorar as chamadas repetidas analisando simultaneamente por **mercado (cidade)** e **tipo de problema** (Tipo 1 a 5).
3.  Gráficos mostrando tendências gerais de chamadas repetidas agregadas por período (semana, mês, trimestre e ano).

**Principais Dependências e Premissas:**
*   **Dependências de Dados:** O painel dependerá de conjuntos de dados fictícios/anonimizados e devidamente aprovados fornecidos pela equipe de BI, contendo informações sobre cidades (market_1 ao market_3), tipos de chamadas (Tipo_1 ao Tipo_5), acompanhamento de chamadas em sete dias (contacts_n até contacts_n_6) e data da chamada.
*   **Dependências de Ferramenta e Acesso:** A ferramenta escolhida de BI deve suportar acessibilidade (letras grandes, text-to-speech) e permitir que os conjuntos de dados consolidados sejam extraídos diretamente pelas partes interessadas.
*   **Premissa:** Assumimos que o volume total de chamadas está devidamente mapeado nos contatos iniciais (contacts_n) e que medir contatos no intervalo dos primeiros seis a sete dias subsequentes descreverá com fidelidade a taxa de resolução no primeiro contato.

---

## 3. Documento de Estratégia (Strategy Document)

**Objetivos do Painel:**
Ilustrar as tendências de volume de chamadas repetidas filtráveis por janela de tempo, tipo de suporte (1 a 5) e região (1 a 3), atingindo as premissas de UX inclusiva.

**Fase 1: Captura de Dados (Capturar)**
*   **Fonte de origem dos dados:** Um ou mais arquivos tabulares pré-aprovados e anonimizados.
*   **Mapeamento de dados necessários:** Os dados fornecem "Número de Chamadas", "Número de chamadas repetidas ( contacts_n + até 6 dias)", "Tipo de Chamada (Type_1 a Type_5)", "Cidade (market_1, 2 e 3)", e "Data". 
*   **Engenharia Inicial:** Será necessário garantir que a data fornecida suporte o parsing (extração e agregação) para semana, mês, trimestre e ano. A correspondência e estruturação dos dados devem suportar uma hierarquia lógica.

**Fase 2: Análise e Design Experimental (Analisar)**
*   **Filtros e Lógica de Organização:** O painel será concebido para permitir que o usuário filtre as visões entre mercado (regional) e tipo de serviço, em função do tempo, gerando um mapa das principais categorias com maiores taxas de falha na resolução de primeiro contato.
*   **Prototipagem:** O modelo passará por iteração para garantir esquemas de cores de alto contraste, tipografia grande e validação da capacidade *screen reader / text-to-speech*.
*   **Métricas chave calculadas:** Volume inicial vs. Volume de chamadas repetidas por Tipo de Chamada.

**Fase 3: Monitoramento, Apresentação e Entrega (Monitorar)**
*   **Criação e Implantação:** O analista produzirá o painel. Concederá acesso primário de nível gerencial a Emma Santiago e Keith Portone, além do acesso dos analistas (Minna, Ian e Sylvie) com a camada de visibilidade total dos dados de base.
*   **Critérios de Sucesso e Medição de Impacto:** A eficácia do painel será testada apresentando insights à liderança fáceis de aplicar em ações que possam, no futuro, reduzir as taxas de não-resolução apontadas nos picos gráficos das cidades afetadas e tipos de problema críticos (ex: problemas no agendamento - Type_3 ou técnica - Type_2).

---

## 4. Perguntas Sobre Informações Ausentes

1. **Ferramenta de BI e Soluções Técnicas de Acessibilidade:** "Para acomodar precisamente a exigência da Minna Rah de texto alternativo para fala (Text-to-Speech), a equipe prefere ou recomenda uma ferramenta de BI ou plugin específico que a central de atendimento atualmente utiliza ou está testando (por exemplo, Power BI, Tableau, Looker)?"
2. **Definição Temporal das "Chamadas Repetidas":** "O conjunto de dados atual acompanha as chamadas do cliente dentro de uma linha do tempo de 7 dias (contacts_n_6). Se os clientes retornarem após os 7 dias pelo mesmo problema (e tiverem que ter outro contanto gerado), precisamos que o painel os cruze e categorize como falha na resolução inicial, ou o escopo do nosso monitoramento se restringe rigorosamente a janela da primeira semana?"
3. **Indicadores Mínimos de Margem de Sucesso/Alvo:** "A liderança já determinou uma meta quantificável para a redução no volume de chamadas (por exemplo, X% a menos após identificar os pontos de dor), e eu deveria incluí-la como uma linha alvo *(target line)* em alguns gráficos do painel, ou nesta fase buscamos apenas a etapa estrita da descoberta exploratória?"
