-- Criação de uma função para adicionar um funcionario utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_funcionario(
    p_nome TEXT,
    p_telefone TEXT,
    p_email TEXT,
    p_endereco TEXT,
    p_dt_nasc DATE,
    p_dt_admissao DATE,
    p_turno TEXT,
    p_carga_horaria INT,
    p_salario NUMERIC,
    p_tipo CHAR
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    colunas TEXT;
    valores TEXT;
BEGIN
    colunas := 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo';
    valores := quote_literal(p_nome) || ', ' ||
            quote_literal(p_telefone) || ', ' ||
            quote_literal(p_email) || ', ' ||
            quote_literal(p_endereco) || ', ' ||
            quote_literal(p_dt_nasc) || ', ' ||
            quote_literal(p_dt_admissao) || ', ' ||
            quote_literal(p_turno) || ', ' ||
            quote_literal(p_carga_horaria) || ', ' ||
            quote_literal(p_salario) || ', ' ||
            quote_literal(p_tipo);
    CALL inserir_dinamico('funcionario', colunas, valores);
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