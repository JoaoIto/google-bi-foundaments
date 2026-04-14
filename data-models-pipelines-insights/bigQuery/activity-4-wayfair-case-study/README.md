# Estudo de Caso: Wayfair - Colaboração com Stakeholders no Design de Pipelines

Este estudo de caso explora como a **Wayfair**, varejista global de artigos para casa, utiliza a colaboração estreita com stakeholders para projetar sistemas de BI que resolvem desafios complexos de dados em larga escala.

---

## Histórico da Empresa
Fundada em 2002 por Niraj Shah e Steve Conine, a Wayfair evoluiu de centenas de sites de e-commerce nichados para uma plataforma unificada (Wayfair.com) em 2011. Hoje, é uma das maiores do mundo no setor, focada em ajudar os clientes a criar espaços que reflitam seus valores.

---

## O Desafio: Dados de Preços Fragmentados
O ecossistema de preços da Wayfair é extremamente dinâmico:
- **Milhares de entradas e saídas** mudando várias vezes ao dia.
- **Fontes Heterogêneas:** Dados gerados por diferentes sistemas e em diferentes formatos.
- **O Problema:** Profissionais de BI tinham dificuldade para localizar, consultar e interpretar o conjunto completo de dados, gerando insights incompletos ou imprecisos.

### Desafios Adicionais:
- Necessidade de monitoramento para rastrear falhas.
- Necessidade de limpeza de dados (Data Cleaning) antes do uso.
- Relações complexas entre diferentes tipos de dados.
- Necessidade de treinamento para os usuários finais.

---

## A Abordagem Colaborativa
A equipe de BI deu um passo atrás para entender a jornada do usuário e colaborou com quatro grupos fundamentais:

| Stakeholder | Papel no Projeto |
| :--- | :--- |
| **Engenheiros de Software** | Proprietários dos dados; ajudaram a tornar os dados acessíveis. |
| **Arquitetos de Dados** | Garantiram que o design fosse abrangente, eficiente e escalável. |
| **Profissionais de Dados** | Forneceram os casos de uso e requisitos técnicos específicos (Pipeline End-Users). |
| **Stakeholders de Negócio** | Garantiram que o pipeline resolvesse problemas reais de negócio e gerasse valor imediato. |

---

## Resultados e Benefícios
A implementação do novo sistema de pipeline atingiu objetivos revolucionários:
- **Dados em Tempo Real:** Engenheiros agora publicam dados que podem ser consumidos instantaneamente.
- **Unificação:** Consolidação de componentes de dados em um conjunto unificado, eliminando a necessidade de JOINS manuais e ad-hoc.
- **Camadas de Preparação (Staging):** Armazenamento organizado para facilitar o processamento downstream.
- **Monitoramento Robusto:** Visibilidade clara sobre onde ocorrem falhas, permitindo correções rápidas.

### O Impacto:
A resposta foi extremamente positiva. O diretor de análise da Wayfair descreveu a solução como **"revolucionária"**, pois permitiu visualizar pela primeira vez o retail price, insumos de custo e status do produto em um único lugar.

---

## Conclusão do Estudo
O sucesso do Business Intelligence não depende apenas da tecnologia, mas da **parceria e alinhamento** entre as equipes. Sem entender as necessidades reais das partes interessadas, os problemas técnicos até podem ser resolvidos, mas os problemas de negócio persistirão.
