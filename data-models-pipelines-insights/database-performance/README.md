# Otimização e Desempenho de Banco de Dados

## 1. Introdução

O desempenho do banco de dados é uma consideração fundamental para os profissionais de Business Intelligence (BI). Uma otimização bem-sucedida garante que os usuários consigam obter o que precisam do sistema da forma mais rápida, eficiente e acessível possível.

Em termos simples, o **desempenho do banco de dados** é uma medida da carga de trabalho que pode ser processada pelo banco de dados, bem como dos custos associados a esse processamento. 

A otimização tem um foco principal: **maximizar a velocidade e a eficiência na recuperação dos dados**. Quando um banco de dados está devidamente otimizado, as partes interessadas (*stakeholders*) têm acesso rápido aos dados vitais de que precisam, permitindo que tomem decisões inteligentes e ágeis.

---

## 2. Os Cinco Fatores de Desempenho

Existem cinco fatores primários que influenciam o desempenho de um banco de dados na perspectiva do BI. Compreendê-los ajuda a antecipar lentidões, projetar esquemas melhores e garantir a continuidade dos negócios. 

Para ilustrar esses fatores de forma mais tangível, usaremos um cenário onde **você atua como um profissional de BI** focado na equipe de vendas estruturando bancos de dados para analisar o comportamento dos clientes e o sucesso de campanhas de marketing em tempo real.

| Fator | Definição | Exemplo Prático na Função de BI |
| :--- | :--- | :--- |
| **Carga de Trabalho (Workload)** | A combinação de transações, consultas, análises de *data warehousing* e comandos que o banco está processando. É flexível e varia diariamente de acordo com o volume de dados e engajamento dos usuários. | Diariamente, seu banco de dados processa relatórios de vendas pesados, faz cálculos de receita e responde a consultas dinâmicas de ferramentas como Tableu ou Looker. Esses conjuntos simultâneos de operações são a carga de trabalho no momento. |
| **Taxa de Transferência (Throughput)** | A capacidade total estrutural (hardware/software) do banco de processar múltiplas solicitações de carga sem engasgos. Determina o verdadeiro tamanho da carga de trabalho viável. | É a velocidade real ditada por I/O, processadores, capacidade multi-threading, qualidade do SGDB (Sistema Gerenciador) e infraestrutura base. |
| **Recursos (Resources)** | As ferramentas de hardware e software disponíveis. Isso inclui especificamente o **espaço em disco e a memória**. Eles são uma parte vital da capacidade do processamento. | O sistema de banco de dados é amplamente baseado na nuvem, o que significa que depende da banda larga e do tipo de servidor dedicado e plano em nuvem contratado. Esses recursos também flutuam dinamicamente. |
| **Otimização (Optimization)** | A ação e processo de refinar o sistema ou as consultas para maximizar a velocidade em que cada extração ou transação de dados acontece sem falhas. | Testar diferentes *Design Patterns* ou índices na modelagem garante um tempo de consulta de 2 segundos em vez de 1 minuto, sendo essa uma parte corriqueira do seu trabalho. |
| **Contenção (Contention)** | Atrasos bruscos originados quando múltiplos processos ou componentes tentam usar o acesso concorrente a um de seus recursos de maneira conflitante na mesma janela de tempo. À medida que a contenção aumenta, o *Throughput* piora drasticamente. | A equipe de vendas faz uma atualização massiva sobre o cliente XPTO enquanto, ao mesmo tempo, um motor de automação exige informações dessa mesma linha para disparar campanhas de marketing, entrando em conflito de recurso. |

---

## 3. Aprofundamento e Prática

A compreensão dos cinco fatores é o primeiro passo. Para garantir que um banco de dados de BI seja sustentável a longo prazo, é necessário dominar as ferramentas técnicas de intervenção.

 **[Explorar Métodos e Técnicas de Otimização de Leitura (Índices, Partições, Cache e Consultas)](./optimization-techniques/README.md)**

 **[Estudo de Caso: Otimização no Serviço Meteorológico (Aplicação Prática)](./case-study.md)**

---

## 4. Conclusão

Saber lidar com esses fatores não é algo pontual, mas um monitoramento contínuo dentro do ciclo de vida dos dados. Um banco otimizado é aquele treinado para lidar bem com as sazonalidades da **Carga de Trabalho**, construído com **Recursos** bem dimensionados, estruturado para extrair a melhor **Taxa de Transferência** do SGDB e capaz de evitar a **Contenção** por meio de boas arquiteturas e indexações!
