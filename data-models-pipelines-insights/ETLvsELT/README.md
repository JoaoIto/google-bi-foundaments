# ETL vs ELT: Evolução do Processamento de Dados

Em Business Intelligence, mover dados de sistemas de origem para destinos analíticos é uma das tarefas mais críticas. Existem duas abordagens principais para construir esses pipelines: **ETL** e **ELT**. Compreender a diferença entre elas é fundamental para otimizar o desempenho e a eficiência da organização.

---

## Comparação Detalhada: ETL vs ELT

A principal diferença reside na **ordem** em que as transformações ocorrem e na **localização** onde o processamento é executado.

### Tabela Comparativa

| Característica | ETL (Extract, Transform, Load) | ELT (Extract, Load, Transform) |
| :--- | :--- | :--- |
| **Ordem dos Processos** | Dados são extraídos, transformados em área de staging e então carregados. | Dados são extraídos, carregados no destino e transformados conforme a necessidade. |
| **Localização da Transformação** | Área de preparação (Staging Area) separada. | Diretamente no sistema de destino (ex: BigQuery). |
| **Idade da Tecnologia** | Tradicional, em uso há mais de 20 anos. | Tecnologia mais recente (Cloud-native). |
| **Acesso aos Dados** | Apenas dados previamente definidos são carregados. | Carrega todos os dados brutos; o usuário escolhe o que analisar depois. |
| **Cálculos** | Substituem ou revisam colunas antes da carga. | Adicionados diretamente ao conjunto de dados existente. |
| **Segurança e Conformidade** | Dados sensíveis podem ser anonimizados **antes** da carga. | Dados são carregados brutos; anonimização ocorre no destino. |
| **Tamanho dos Dados** | Ideal para conjuntos menores com transformações complexas. | Excelente para volumes massivos (Big Data). |
| **Tempo de Análise** | Análise rápida (dados já transformados), mas carga lenta. | Carga ultra-rápida, mas análise pode exigir processamento. |

---

## Sistemas de Armazenamento: Warehouse vs Lake

A escolha entre ETL e ELT geralmente dita o sistema de armazenamento ideal.

### Data Warehouse
Um banco de dados que consolida dados de vários sistemas de origem para garantir consistência e acesso eficiente.
- **Processamento:** Dados já processados (Esquema Relacional).
- **Finalidade:** Já atribuída e em uso.
- **Alterações:** Podem ser complexas e exigir muito trabalho.
- **Subconjunto:** **Data Marts** (focados em um único assunto/departamento).

### Data Lake
Um sistema que armazena grandes quantidades de dados brutos em seu formato original até que sejam necessários.
- **Processamento:** Dados brutos e não processados.
- **Finalidade:** Ainda não determinada (uso futuro).
- **Acessibilidade:** Altamente acessíveis e fáceis de atualizar.
- **Flexibilidade:** Pode ingerir dados não estruturados.

---

## Principais Conclusões

- **ETL** é a escolha clássica para ambientes onde a privacidade dos dados é rígida e o volume é controlado.
- **ELT** é o padrão moderno para nuvem, aproveitando o poder de processamento massivo de ferramentas como o BigQuery para transformar dados em escala.
- Entender essas diferenças permite que o profissional de BI escolha a ferramenta certa para o problema de negócio certo.

---
<div align="center">
 <sub>Documentação desenvolvida com base no curso de Modelagem de Dados e Pipelines de BI.</sub>
</div>
