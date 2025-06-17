-- Criação de uma função para adicionar um treino utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_treino(
        p_descricao TEXT,
        p_objetivo TEXT,
        p_duracao_meses INT
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS $$
    DECLARE
        colunas TEXT;
        valores TEXT;
    BEGIN
        colunas := 'descricao, objetivo, duracao_meses';
        valores := quote_literal(p_descricao) || ', ' ||
                quote_literal(p_objetivo) || ', ' ||
                quote_literal(p_duracao_meses);
        CALL inserir_dinamico('treino', colunas, valores);
    END;
    $$;



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

