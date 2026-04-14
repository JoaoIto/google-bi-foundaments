# Estudo de Caso: Avaliação de Esquema (Sales Fact)

Neste estudo de caso, analisamos um esquema de Data Warehouse com foco em uma tabela central de fatos e suas dimensões, identificando falhas de relacionamento e aplicando correções estruturais.

---

## O Esquema Original (Com Erros)

O esquema original continha oito tabelas: **Sales Fact**, **Shipments**, **Billing**, **Order Items**, **Product**, **Product Price**, **Order Details** e **Customer**. 

Entretanto, uma análise técnica revelou problemas críticos:
1. **Tabela Customer Isolada**: A tabela `Customer` não possuía nenhum vínculo com as outras tabelas. Isso impede análises por tipo de cliente ou nome.
2. **Shipments Desconectado**: A tabela `Shipments` não estava conectada à `Order Items` via `order_sid`, impossibilitando o rastreio de quais itens foram enviados.

---

## O Esquema Ideal (Corrigido)

Abaixo, apresentamos a versão ideal do esquema, onde as chaves e os relacionamentos foram devidamente preservados e validados.

![Esquema Corrigido de Vendas](./assets/useCaseListVerify.png)

### Principais Correções:
- **Vinculação da Tabela Customer**: Agora conectada às tabelas `Sales Fact` e `Order Details` através da dimensão `customer_sid`.
- **Conexão de Entregas**: A tabela `Shipment` agora vincula-se corretamente à `Order Items`.
- **Nomenclatura Consistente**: Padronização para `product_sid` em todas as tabelas relacionadas, facilitando a manutenção do pipeline.

---

## Mapeamento de Dimensões (SIDs)

As dimensões críticas que garantem a integridade deste esquema são:

| Dimensão (SID) | Tabelas Onde Está Presente | Função no Esquema |
| :--- | :--- | :--- |
| **order_sid** | Sales Fact, Order Items, Shipments, Billing, Order Details | Agrupador principal de transações. |
| **customer_sid** | Sales Fact, Order Details, Customer | Identificador único do cliente. |
| **product_sid** | Order Items, Product, Product Price | Identificador do produto e seu preço. |
| **shipment_sid**| Sales Fact, Shipment | Controle de logística de entrega. |
| **billing_sid** | Sales Fact, Billing | Controle financeiro de faturamento. |

---

## Conclusão

A avaliação proativa de esquemas evita falhas catastróficas em sistemas de BI. Ao garantir que as chaves sejam válidas e os relacionamentos preservados *antes* da carga de dados, economizamos tempo e recursos que seriam gastos em correções manuais posteriores.

---
_Estudo de caso baseado no Exemplar da Certificação de BI do Google._
