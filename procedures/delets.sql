
-- delete logic aluno
CREATE OR REPLACE FUNCTION delete_aluno(p_id_aluno INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE aluno
    SET
        deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_aluno = p_id_aluno AND deleted = FALSE;
END;
$$;

-- delete logico para funcionario (vale para instrutor e atendente via herança)
CREATE OR REPLACE FUNCTION delete_funcionario(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE funcionario
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_func = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;


-- delete logico para metodo_pagamento
CREATE OR REPLACE FUNCTION delete_metodo_pagamento(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE metodo_pagamento
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_met_pag = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;



-- delete logico para plano
CREATE OR REPLACE FUNCTION delete_plano(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE plano
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_pla = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;



-- delete logico para equipamento
CREATE OR REPLACE FUNCTION delete_equipamento(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE equipamento
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_equip = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;


-- delete logico para treino
CREATE OR REPLACE FUNCTION delete_treino(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE treino
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_trei = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;


-- delete logico para item treino
CREATE OR REPLACE FUNCTION delete_item_treino(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE item_treino
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_item_treino = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;


-- delete logico para treino_aluno
CREATE OR REPLACE FUNCTION delete_treino_aluno(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE treino_aluno
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_trei_alu = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;


-- delete logico para matricula
CREATE OR REPLACE FUNCTION delete_matricula(p_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE matricula
    SET deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_matricula = p_id AND deleted = FALSE;
END;
$$ LANGUAGE plpgsql;
