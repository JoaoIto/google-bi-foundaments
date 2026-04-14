# Validação de Esquema: Lista de Verificação

A **Validação de Esquema** é o processo de garantir que o esquema de dados do sistema de origem corresponda exatamente ao esquema do banco de dados de destino. Falhas nesse alinhamento podem causar erros críticos no carregamento de dados e inconsistências nos relatórios.

---

## Lista de Verificação (Checklist)

Ao realizar uma migração ou carga de dados, utilize esta lista para garantir a conformidade:

- [ ] **Validade das Chaves:** As chaves primárias e estrangeiras continuam funcionando após a transferência? Os relacionamentos foram preservados?
- [ ] **Preservação de Relacionamentos:** As conexões entre tabelas (Joins) ainda refletem a realidade do negócio ou precisam ser transformadas para o esquema de destino?
- [ ] **Consistência de Convenções:** Os nomes das colunas e tabelas seguem o padrão do banco de destino? (Ex: `customer_id` vs `cust_sid`).
- [ ] **Tipagem e Nulidade:** Os tipos de dados e as restrições de "NOT NULL" são idênticos ou compatíveis entre origem e destino?

---

## O Trio de Conformidade em BI

A validação de esquema é uma das três ferramentas essenciais que você aprendeu. Juntas, elas formam a base da governança:

1. **Validação de Esquema**: Alinhamento estrutural entre sistemas.
2. **[Dicionário de Dados](../readme.md#-2-dicionários-de-dados-repositório-de-metadados)**: Definição e significado dos campos.
3. **[Linhagem de Dados](../readme.md#-3-linhagem-de-dados-data-lineage)**: Rastreamento do caminho percorrido pelo dado.

---

## Prática: Avaliação de Esquema
Para ver um exemplo real de como aplicar esta lista em um esquema de vendas complexo, acesse o estudo de caso:

 **[Estudo de Caso: Esquema Sales Fact](./case-study.md)**

---
_Documentação baseada nos processos de BI do Google._
