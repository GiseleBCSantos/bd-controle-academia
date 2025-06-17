-- Criação de uma função para adicionar um aluno utilizando a procedure genérica
CREATE OR REPLACE FUNCTION add_aluno(
    p_nome TEXT,
    p_telefone TEXT,
    p_email TEXT,
    p_dt_nasc DATE,
    p_genero CHAR,
    p_dt_cadastro DATE,
    p_endereco TEXT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    colunas TEXT;
    valores TEXT;
BEGIN
    -- Define as colunas que serão preenchidas
    colunas := 'nome, telefone, email, dt_nasc, genero, dt_cadastro, endereco';

    -- Monta os valores já com aspas usando quote_literal
    valores := quote_literal(p_nome) || ', ' ||
            quote_literal(p_telefone) || ', ' ||
            quote_literal(p_email) || ', ' ||
            quote_literal(p_dt_nasc) || ', ' ||
            quote_literal(p_genero) || ', ' ||
            quote_literal(p_dt_cadastro) || ', ' ||
            quote_literal(p_endereco);

    -- Chama a procedure genérica
    CALL inserir_dinamico('aluno', colunas, valores);
END;
$$;

-- Function to SOFT DELETE a student (aluno) from the database
CREATE OR REPLACE FUNCTION public.delete_aluno(p_id_aluno integer)
    RETURNS void
    LANGUAGE plpgsql
AS $function$
BEGIN
    UPDATE aluno
    SET
        deleted = TRUE,
        atualizado_em = CURRENT_TIMESTAMP,
        atualizado_por = CURRENT_USER
    WHERE id_aluno = p_id_aluno AND deleted = FALSE;
END;
$function$
;
