
-- Criação de uma função para adicionar um método de pagamento utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_metodo_pagamento(
        p_nome TEXT,
        p_descricao TEXT,
        p_taxa NUMERIC
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS $$
    DECLARE
        colunas TEXT;
        valores TEXT;
    BEGIN
        colunas := 'nome, descricao, taxa_percentual';
        valores := quote_literal(p_nome) || ', ' ||
                quote_literal(p_descricao) || ', ' ||
                quote_literal(p_taxa);
        CALL inserir_dinamico('metodo_pagamento', colunas, valores);
    END;
    $$;



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