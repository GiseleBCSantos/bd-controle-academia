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

