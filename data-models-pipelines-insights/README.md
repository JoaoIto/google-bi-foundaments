# Documentação sobre Modelagem de Dados e Pipelines

## 1. Introdução
A modelagem de dados é um processo fundamental na construção de sistemas de banco de dados. Ela envolve a criação de representações estruturais dos dados, permitindo que os profissionais de BI organizem e analisem informações de maneira eficaz.

## 2. Design Patterns e Schemas
### 2.1 Design Patterns
- **Definição**: Um design pattern é uma solução reutilizável para um problema comum em um contexto específico. Na modelagem de dados, ele serve como um guia para criar modelos que atendam às necessidades de negócios e otimizem a performance analítica.

### 2.2 Schemas
- **Definição**: Um schema é a representação lógica da estrutura de um banco de dados. Ele descreve como os dados estão organizados no Data Warehouse e como as tabelas se relacionam entre si (Chaves Primárias e Estrangeiras).

## 3. Dimensões e Esquemas Relacionais
### 3.1 Dimensões
- **Definição**: Uma dimensão fornece o contexto ("O quê", "Onde", "Quando", "Quem") para as métricas quantitativas. Por exemplo, em um banco de dados de vendas, as dimensões podem incluir informações detalhadas de tempo, produto e cliente.

### 3.2 Esquemas de Estrela (Star Schema)
- **Definição**: Um esquema de estrela é a forma mais simples de modelagem dimensional. É composto por uma única **tabela de fatos** central (que guarda os números e chaves estrangeiras) conectada diretamente a várias **tabelas de dimensões** (desnormalizadas). Simplifica muito as consultas SQL.
- **Exemplo Prático**:

| Tabela de Fatos: Vendas |
|--------------------------|
| ID_Venda | ID_Produto | ID_Cliente | Data | Quantidade | Valor |

| Tabela de Dimensões: Produto |
|-------------------------------|
| ID_Produto | Nome_Produto | Categoria | Preço |

| Tabela de Dimensões: Cliente |
|-------------------------------|
| ID_Cliente | Nome_Cliente | Cidade | Estado |

### 3.3 Esquemas de Floco de Neve (Snowflake Schema)
- **Definição**: Um esquema de floco de neve é uma versão mais complexa e estruturada do esquema de estrela, onde as tabelas de dimensões são **normalizadas** em múltiplas subdimensões (removendo a redundância de dados, mas adicionando mais "JOINs" necessários nas consultas).
- **Exemplo Prático**:

| Tabela de Fatos: Vendas |
|--------------------------|
| ID_Venda | ID_Produto | ID_Cliente | Data | Quantidade | Valor |

| Tabela de Dimensões: Produto |
|-------------------------------|
| ID_Produto | Nome_Produto | ID_Categoria |

| Tabela de Dimensões: Categoria |
|--------------------------------|
| ID_Categoria | Nome_Categoria |

| Tabela de Dimensões: Cliente |
|-------------------------------|
| ID_Cliente | Nome_Cliente | ID_Endereço |

| Tabela de Dimensões: Endereço |
|-------------------------------|
| ID_Endereço | Cidade | Estado |

## 4. Conclusão
A compreensão de design patterns e schemas é essencial para a modelagem de dados eficaz em projetos de Business Intelligence corporativos. O domínio sobre quando aplicar **Esquemas de Estrela** (prioridade na velocidade de leitura) e esquemas de **Floco de Neve** (prioridade na integridade e economia de espaço) garante a construção de Data Warehouses sustentáveis e análises exatas.
