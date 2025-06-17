-- Criação de uma função para adicionar um plano utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_plano(
    p_nome TEXT,
    p_descricao TEXT,
    p_duracao_meses INT,
    p_valor NUMERIC
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    colunas TEXT;
    valores TEXT;
BEGIN
    colunas := 'nome, descricao, duracao_meses, valor';
    valores := quote_literal(p_nome) || ', ' ||
            quote_literal(p_descricao) || ', ' ||
            quote_literal(p_duracao_meses) || ', ' ||
            quote_literal(p_valor);
    CALL inserir_dinamico('plano', colunas, valores);
END;
$$;


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
