# 1. Tipos de Dados (A Natureza da Informação)

A forma como os dados são organizados determina as ferramentas de processamento que utilizaremos.

| Tipo | Descrição | Exemplos |
| :--- | :--- | :--- |
| **Estruturados** | Dados altamente organizados em tabelas (linhas e colunas), com esquemas rígidos e tipos definidos. | Bancos SQL, planilhas de Excel. |
| **Semiestruturados** | Não seguem uma estrutura de tabela, mas contêm marcadores ou "tags" que separam os elementos. | Arquivos JSON, XML, HTML, NoSQL. |
| **Não Estruturados** | Dados que não possuem uma forma específica e são difíceis de pesquisar sem ferramentas de IA. | Vídeos, áudios, PDFs, imagens, e-mails. |



<img width="3999" height="2761" alt="image" src="https://github.com/user-attachments/assets/d327275b-132d-49fc-8756-ba674af4bd0a" />


---

## 2. Arquiteturas de Armazenamento

- A. **Banco de Dados Relacional (RDBMS)**: Representado como a "Fonte de Dados Operacionais", como o sistema de suporte da Google Fiber. Foca em transações rápidas (CRUD) e usa tabelas interligadas. Exemplos: PostgreSQL, MySQL.

- B. **Data Warehouse (DW)**: Mostra o processo de ETL (Extração, Transformação e Carga) limpando e estruturando os dados em um repositório centralizado, ideal para análise histórica e relatórios. Utiliza armazenamento colunar para consultas rápidas. Exemplos: BigQuery, Snowflake.

- C. **Data Lake**: Exibido como um grande reservatório ou "lago" que armazena dados brutos (estruturados, semiestruturados e não estruturados) em seu formato original. É mais barato e escalável, ideal para exploração de dados e inteligência artificial. Exemplos: GCS, AWS S3.

- D. **Data Lakehouse**: A arquitetura moderna no topo, demonstrando como ela une o melhor dos dois mundos: a flexibilidade e baixo custo do Data Lake com a governança, integridade e performance do Data Warehouse, tudo rodando sobre armazenamento de objetos em nuvem. É a fusão dos conceitos para simplificar pipelines de BI e IA.

---

## 3. Computação e Processamento

A forma como processamos esses dados também varia conforme o ambiente:

* **Cloud Computing (Nuvem):** O processamento é elástico (você paga pelo que usa). No BigQuery, por exemplo, a computação é separada do armazenamento, permitindo analisar petabytes de dados em segundos sem precisar de um servidor físico gigante.
* **On-premises (Local):** Os dados e o processamento ocorrem em servidores físicos próprios. É comum em setores com regras de privacidade extremamente rígidas, mas é mais difícil de escalar.
* **Edge Computing:** O processamento ocorre perto de onde o dado é gerado (ex: sensores de fibra óptica ou roteadores). Isso reduz a latência antes de enviar o insight para a nuvem.

---

## 4. Por que isso importa para Pipelines?

No curso 2, você verá que o pipeline de BI é o caminho que o dado percorre entre essas estruturas:

1. **Ingestão:** O dado sai do Banco Relacional ou de um arquivo JSON (Semiestruturado).
2. **Staging (Data Lake):** O dado bruto é armazenado para não sobrecarregar a fonte.
3. **Transformação (ETL/ELT):** O dado é limpo e modelado (ex: Star Schema).
4. **Serviço (Data Warehouse):** O dado limpo está pronto para o dashboard.

> **Dica de Estudo:** No Google Cloud (que é o foco do seu curso), o **BigQuery** atua muitas vezes como um Lakehouse, permitindo consultar dados diretamente do Cloud Storage (Lake) usando SQL.

---
