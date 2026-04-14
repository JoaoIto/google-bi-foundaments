# Atividade: Validação de Esquema de Dados (Estudo de Caso) - Corrigido

Esta documentação detalha a atividade de validação de esquema de banco de dados para o curso de Google BI Professional Certificate. O conteúdo foi revisado com base no feedback oficial da avaliação do Coursera.

## Análise do Esquema
O esquema analisado possui 8 tabelas centrais: `Sales Fact`, `Shipments`, `Billing`, `Order Items`, `Product`, `Product Price`, `Order Details` e `Customer`.

### Critérios de Verificação (Refinados)
1. **Validade das Chaves**: Verificação de PKs (Chaves Primárias) e FKs (Chaves Estrangeiras).
2. **Consistência Técnica**: Foco em correspondência de dados e tipos de dados (bloqueadores reais de validação).
3. **Preservação de Relacionamentos**: Garantia de conexões lógicas entre tabelas de processo e granularidade.

---

## Respostas da Atividade (Versão Final)

### Pergunta 1: Conclusão da Atividade
**Resposta:** Sim.

### Pergunta 2: Conexão da Tabela `Shipments`
**Pergunta:** A tabela Shipments não tem um relacionamento com outra tabela. Com qual tabela ela deve se conectar?
**Resposta:** **Itens de pedido (Order Items)**.
**Justificativa:** No modelo de dados de exemplo, está faltando um relacionamento entre `Shipments` e `Order Items`. Elas devem ser conectadas pelas dimensões `order_sid` e `order_item_sid` para garantir a granularidade correta dos itens enviados.

### Pergunta 3: Convenções de Nomenclatura
**Pergunta:** Qual das seguintes opções é uma convenção usada nesse esquema?
**Resposta:** **Abreviar o ID do sistema como "sid"**.
**Justificativa:** É a convenção técnica mais evidente, utilizando `_sid` (ex: `order_sid`, `customer_sid`, `billing_sid`) para identificadores.

### Pergunta 4: Erro de Validação (`Product` vs `Order Items`)
**Pergunta:** Quais problemas impediriam a validação do esquema ao conectar Product e Order Items?
**Respostas Corretas:**
- **Existem IDs de produtos na tabela Order Items que não existem na tabela Product.** (Falha de integridade referencial).
- **O tipo de dados dos IDs do produto na tabela Product é um número inteiro, mas é uma string na tabela Order Items.** (Incompatibilidade de tipo de dado).

> [!NOTE]
> **Atenção:** Ter nomes de campos diferentes (ex: `product_id` vs `product_sid`) **não** impede a validação técnica do esquema, embora seja uma má prática de governança.

### Pergunta 5: Vínculo da Tabela `Customer`
**Pergunta:** A tabela Customer deve ser vinculada a qual das tabelas a seguir?
**Resposta:** **Detalhes do pedido** e **Fato de vendas**.
**Justificativa:** A tabela `Customer` compartilha a dimensão `customer_sid` com ambas as tabelas, permitindo o enriquecimento dos dados de fatos e detalhes do pedido com metadados do cliente.

---

## Conclusão da Documentação
A validação de um esquema de BI depende primordialmente da **integridade referencial** e da **compatibilidade técnica** entre os campos. Embora padrões de nomenclatura ajudem na produtividade, eles não são impeditivos para que o sistema valide as relações entre as tabelas.
