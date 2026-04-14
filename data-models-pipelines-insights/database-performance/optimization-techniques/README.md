# Métodos e Técnicas de Otimização de Leitura

A **leitura de dados** é o processo de interpretar e processar informações para torná-las úteis aos usuários. Otimizar esse processo é fundamental para garantir que o sistema de BI responda com a velocidade necessária para a tomada de decisão.

---

## 1. Índices (Indexes)

Imagine ler um livro técnico de 500 páginas sem um sumário ou índice remissivo. Para encontrar um tópico, você teria que folhear página por página. No banco de dados, isso se chama *Full Table Scan*.

**Como funciona:**
- Os índices usam chaves de tabela para mapear locais específicos no banco de dados.
- Em vez de pesquisar a tabela inteira, o banco vai direto ao endereço físico do dado.
- **Exemplo:** Uma tabela com `ID`, `Nome` e `Departamento`. Um índice na coluna `ID` permite encontrar o funcionário 5002 instantaneamente.

---

## 2. Particionamento (Partitioning)

Em vez de apenas colocar etiquetas (índices), o particionamento divide fisicamente tabelas gigantes em pedaços menores e mais gerenciáveis.

- **Particionamento Horizontal (Sharding):** Divide as **linhas**. Ex: Guardar vendas de 2023 em uma partição e 2024 em outra. O banco não precisa ler dados de anos irrelevantes para uma consulta mensal.
- **Particionamento Vertical:** Divide as **colunas**. Colunas acessadas com menos frequência ou muito pesadas (ex: blobs, textos longos) são movidas para tabelas separadas.

> [!NOTE]
> Em sistemas de nuvem (*Big Data*), o particionamento é muitas vezes preferido em relação à indexação tradicional por permitir o processamento paralelo em larga escala.

---

## 3. Otimização de Consultas (Query Tuning)

Consultas mal escritas ("ineficientes") esgotam a CPU e a Memória do banco. Algumas boas práticas incluem:

- **Entender Requisitos de Negócio:** Não peça dados que não serão usados.
- **Evitar `SELECT *` e `SELECT DISTINCT`:** Forçam o banco a analisar e comparar colunas desnecessárias. Selecione apenas os campos específicos.
- **`INNER JOIN` vs Subconsultas:** Subconsultas podem gerar resultados intermediários massivos que precisam ser filtrados depois. O `JOIN` geralmente permite que o otimizador do banco trabalhe de forma mais eficaz.
- **Pré-Agregação:** Se você calcula a "Média de Vendas por Mês" todo dia, salve esse resultado em uma tabela específica (Materialized View ou Tabela Agregada) para não recalcular do zero sempre.

---

## 4. Plano de Consulta (Query Plan)

O SQL diz ao sistema **o que** fazer, mas o Plano de Consulta é o **como**.
- É uma descrição das etapas que o SGDB executará.
- Profissionais de BI analisam o plano para identificar gargalos (ex: um JOIN que está causando lentidão inesperada).
- **Processo Iterativo:** Analisar Plano -> Ajustar SQL ou Índices -> Analisar Plano novamente.

---

## 5. Armazenamento em Cache (Caching)

O cache é uma camada de memória de curto prazo (RAM) ultra rápida.
- **Uso Comum:** Se você extrai relatórios anuais com frequência e os dados não mudam a cada segundo, o resultado pode ser salvo no cache.
- **Benefício:** Você "pega o que precisa" da memória instantaneamente, sem sequer tocar no disco rígido ou processar a lógica do banco novamente.

---

## 6. Diagnóstico de Problemas Comuns

| Problema | Sintoma | Causa Viral |
| :--- | :--- | :--- |
| **Consultas Ineficientes** | Lentidão geral | Falta de filtros adequados ou uso excessivo de funções em colunas indexadas. |
| **Fragmentação de Dados** | Acesso lento a arquivos específicos | Edição/exclusão frequente que "espalha" o arquivo em partes não contíguas no disco. |
| **Falta de Memória/CPU** | "Timeout" ou engasgos com muitos usuários | O banco atingiu o limite de sua capacidade física (Recursos insuficientes). |
| **Falta de Indexação** | Consultas em tabelas grandes demoram minutos | O banco está fazendo varreduras manuais (*scans*) em cada linha. |

---

> [!TIP]
> A otimização não é um evento único, mas um **processo contínuo**. À medida que os dados crescem e as necessidades de negócio mudam, a estrutura do banco deve evoluir junto.
