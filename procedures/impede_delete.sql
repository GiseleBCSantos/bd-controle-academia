-- Função genérica para impedir DELETE
CREATE OR REPLACE FUNCTION impedir_delete_direto()
RETURNS trigger AS $$
BEGIN
  RAISE EXCEPTION 'Deleção direta não permitida. Use soft delete (UPDATE deleted = true)';
END;
$$ LANGUAGE plpgsql;


-- Método de pagamento
CREATE TRIGGER trg_impedir_delete_metodo_pagamento
BEFORE DELETE ON metodo_pagamento
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Plano
CREATE TRIGGER trg_impedir_delete_plano
BEFORE DELETE ON plano
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Aluno
CREATE TRIGGER trg_impedir_delete_aluno
BEFORE DELETE ON aluno
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Funcionário
CREATE TRIGGER trg_impedir_delete_funcionario
BEFORE DELETE ON funcionario
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Instrutor
CREATE TRIGGER trg_impedir_delete_instrutor
BEFORE DELETE ON instrutor
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Atendente
CREATE TRIGGER trg_impedir_delete_atendente
BEFORE DELETE ON atendente
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Equipamento
CREATE TRIGGER trg_impedir_delete_equipamento
BEFORE DELETE ON equipamento
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Treino
CREATE TRIGGER trg_impedir_delete_treino
BEFORE DELETE ON treino
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Item Treino
CREATE TRIGGER trg_impedir_delete_item_treino
BEFORE DELETE ON item_treino
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Treino Aluno
CREATE TRIGGER trg_impedir_delete_treino_aluno
BEFORE DELETE ON treino_aluno
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Matrícula
CREATE TRIGGER trg_impedir_delete_matricula
BEFORE DELETE ON matricula
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();
