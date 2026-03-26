# Processos ETL (Extract, Transform, Load)

## 1. O que é ETL?
O **ETL** (Extrair, Transformar e Carregar) é um tipo específico de pipeline de dados que se tornou o padrão para mover informações de sistemas de origem para um destino unificado, como um *Data Warehouse*.

O objetivo central do ETL é tornar os dados brutos úteis para análise, garantindo que a estrutura do sistema de destino seja ideal para consultas e geração de *insights*.

---

## 2. As Três Fases do ETL

### 1ª Fase: Extração (Extract)
Nesta etapa, o pipeline acessa os sistemas de origem para ler e coletar os dados necessários.
*   **Fontes comuns**: Bancos de dados transacionais (sistemas OLTP), arquivos simples (HTML, arquivos de log, CSV).
*   **Ação**: Os dados extraídos são movidos para uma **tabela temporária de preparação** (*staging table*).

### 2ª Fase: Transformação (Transform)
As atividades de transformação preparam os dados para análise com base nos requisitos do negócio.
*   **Validação e Limpeza**: Remoção de erros e inconsistências.
*   **Mapeamento**: O pipeline garante que os tipos de dados da fonte se ajustem às convenções e esquemas do destino.
*   **Destaque**: É aqui que o profissional de BI garante a integridade dos dados antes que cheguem ao sistema final.

### 3ª Fase: Carregamento (Load)
É o estágio final, onde os dados são entregues ao destino desejado.
*   **Destinos comuns**: *Data Warehouse*, *Data Lake* ou plataformas de análise com feeds diretos.
*   **Persistência**: Uma vez carregados, os dados podem existir em vários formatos (como tabelas de instantâneos semanais ou arquivos históricos maiores).

---

## 3. Por que o ETL é essencial?
Na maioria das vezes, a estrutura do sistema onde os dados são criados (origem) não é ideal para análise. Por isso, transformar os dados antes que cheguem ao destino é crucial. Ter esquemas de banco de dados (como o *Star Schema*) já projetados e prontos para receber esses dados via ETL é o que torna o processo de BI eficiente.

---
> [!NOTE]
> Se a empresa precisa comparar médias de vendas mensais, o processo ETL move os dados para um sistema **OLAP** (Online Analytical Processing), que é otimizado especificamente para consultas de análise complexas.
