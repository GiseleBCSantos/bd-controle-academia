-- Criação de uma função para adicionar um equipamento utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_equipamento(
        p_nome TEXT,
        p_descricao TEXT,
        p_data_aq DATE,
        p_idade_min INT
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS $$
    DECLARE
        colunas TEXT;
        valores TEXT;
    BEGIN
        colunas := 'nome, descricao, data_aq, idade_min';
        valores := quote_literal(p_nome) || ', ' ||
                quote_literal(p_descricao) || ', ' ||
                quote_literal(p_data_aq) || ', ' ||
                quote_literal(p_idade_min);
        CALL inserir_dinamico('equipamento', colunas, valores);
    END;
    $$;



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