# Checklist: Verificação de Regras de Negócio

Utilize esta lista para garantir que os dados de entrada respeitem a lógica operacional da organização antes de serem carregados no Data Warehouse.

---

## Lista de Verificação

### 1. Integridade de Datas e Prazos
- [ ] **Coerência Cronológica**: As datas de entrega/envio são posteriores às datas de pedido?
- [ ] **Janelas de Operação**: Os registros ocorrem dentro de horários ou períodos permitidos (ex: vendas fora do horário comercial)?

### 2. Validação de Limites e Valores
- [ ] **Limites Operacionais**: Os valores respeitam os limites da empresa (ex: quantidade máxima de itens por pedido)?
- [ ] **Alçadas de Aprovação**: Registros que exigem aprovação (ex: pedidos > $1.000) estão devidamente marcados ou encaminhados?

### 3. Obrigatoriedade e Nulidade Lógica
- [ ] **Campos Essenciais**: Além de não serem nulos tecnicamente, os campos fazem sentido? (Ex: um pedido "Concluído" deve ter obrigatoriamente um `ID_Pagamento`).
- [ ] **Motivação**: Campos de justificativa estão preenchidos para exceções ou cancelamentos?

### 4. Consistência de Relacionamentos
- [ ] **Existência de Entidades**: Um dado de transação possui uma entidade correspondente ativa? (Ex: venda vinculada a um vendedor que ainda está na empresa).
- [ ] **Redundância Lógica**: O sistema impede a duplicidade de ações impossíveis? (Ex: um mesmo livro emprestado para dois usuários simultaneamente).

---

## Como aplicar esta verificação?

1. **Entenda o Negócio**: Reúna-se com as partes interessadas para documentar o que *pode* e o que *não pode* acontecer nos dados.
2. **Mapeie as Regras**: Transforme as políticas da empresa em restrições lógicas.
3. **Teste na Ingestão**: Configure o pipeline (ETL/ELT) para sinalizar ou rejeitar dados que violem estas condições.
4. **Monitore Mudanças**: Regras de negócio mudam. Revise este checklist trimestralmente ou conforme novas políticas forem implementadas.

---
> [!TIP]
> **Dica de BI**: Dados que falham na regra de negócio devem ser enviados para uma **Tabela de Erros/Exceções** para auditoria manual, em vez de serem simplesmente descartados.
