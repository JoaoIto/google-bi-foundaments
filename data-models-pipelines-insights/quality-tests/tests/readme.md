# Monitoramento de Qualidade com SQL (Casos Reais)

Este guia prático detalha o monitoramento de qualidade dos dados utilizando consultas SQL reais, baseado nas atividades de **Sage**, Engenheira de BI na *Francisco's Electronics*.

Ao monitorar seus dados, você identifica problemas no pipeline ETL e no design do Data Warehouse precocemente, evitando falhas em cascata para as partes interessadas.

---

## O Cenário: Francisco's Electronics

Sage projetou um **Data Warehouse de Vendas** (`sales_warehouse`) baseado no esquema original do banco de dados transacional (**Store - OLTP**). Após o desenvolvimento do ETL, ela precisa garantir que os dados no warehouse correspondam perfeitamente à origem.

### Visualização dos Esquemas

Para realizar os testes, Sage utiliza as seguintes estruturas:

#### **1. Esquema do Data Warehouse (sales_warehouse)**
![Esquema Data Warehouse](../assets/databaseModelTables.png)
_Estrutura OLAP: Sales se conecta a Products, Users, Locations e Orders._

#### **2. Esquema do Banco de Dados Original (Store - OLTP)**
![Esquema Store OLTP](../assets/databaseModelTables2.png)
_Estrutura transacional original usada para validar a integridade da migração._

---

## Testes de Qualidade com SQL

Sage compara os dois bancos de dados para verificar a integridade, completude, consistência, conformidade, precisão, redundância e atualidade utilizando comandos SQL.

### Tabela de Observações da Sage

| Qualidade Testada | Estratégia de Qualidade | Consulta SQL | Observação Técnica |
| :--- | :--- | :--- | :--- |
| **Integridade** | Dados confiáveis e precisos? | `SELECT * FROM Orders` | Pedido ID 7 tem o valor total incorreto no Warehouse. |
| **Completude** | Todos os registros migraram? | `SELECT COUNT(*) FROM Locations` | Warehouse tem 61 registros, mas a Loja tem apenas 60. |
| **Consistência** | Estão no formato padrão? | `SELECT Phone FROM Users` | Telefones no Warehouse sem o prefixo "+". |
| **Conformidade** | Segue o formato de destino? | `SELECT id, postcode FROM Locations` | Registro ID 6 com CEP inválido (9 dígitos sem traço). |

---

## Validação de Metadados (DESCRIBE)

Além de consultar os dados, Sage utiliza o comando `DESCRIBE` para analisar se a estrutura das tabelas suportará o fluxo contínuo de dados.

| Recurso Analisado | Problema Identificado | Código SQL |
| :--- | :--- | :--- |
| **Status vs Is_Active** | Como `Status` (Store) vira `is_active` (booleano)? Risco de falha se um novo status surgir. | `DESCRIBE Users` |
| **Tipos de Inventário** | `varchar` na Loja vs `int(10)` no Warehouse. Conversão falhará se houver caracteres. | `DESCRIBE Products` |
| **Precisão de Data** | `datetime` na Loja vs `date` no Warehouse. Possível perda de granularidade horária. | `DESCRIBE Sales` |
| **Redundância** | Necessidade de restrição UNIQUE em `OrderId`, `ProductId` e `UserId` para evitar duplicatas. | `DESCRIBE Sales` |

---

## Scripts Práticos
Você pode acessar o arquivo SQL com todos os comandos comentados para replicação destes testes:

 **[quality_checks.sql](./quality_checks.sql)**

---
> [!TIP]
> **Automação de BI**: Utilize estes comandos SQL para criar alertas automáticos. Se um teste de completude falhar, seu pipeline deve sinalizar o erro imediatamente!

---
_Documentação baseada no cenário didático de BI da Certificação do Google._
