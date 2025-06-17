-- Criação de uma procedure para inserir dados dinamicamente em uma tabela
CREATE OR REPLACE PROCEDURE inserir_dinamico(
    p_tabela TEXT,
    p_colunas TEXT,
    p_valores TEXT
    )
    LANGUAGE plpgsql
    AS $$
    DECLARE
        sql_comando TEXT;
    BEGIN
        sql_comando := format('INSERT INTO %I (%s) VALUES (%s)', p_tabela, p_colunas, p_valores);
        EXECUTE sql_comando;
    END;
    $$;



