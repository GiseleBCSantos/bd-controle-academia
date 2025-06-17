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
