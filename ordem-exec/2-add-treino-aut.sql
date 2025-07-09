CREATE OR REPLACE FUNCTION aloca_treino_instrut_func()
RETURNS trigger AS $$
DECLARE
  instrutor_id INT;
  treino_id_alocar INT; -- Usaremos NULL se o treino não puder ser alocado
  observacao_texto TEXT;
  idade_aluno INT;
  idade_minima INT;
  pode_alocar_treino BOOLEAN := TRUE;
  colunas TEXT := 'dt_inicio, observacao, id_trei, id_func, id_aluno, criado_por, criado_em';
  valores TEXT;
BEGIN
  -- PASSO 1: Encontrar um instrutor disponível. Isso deve acontecer sempre.
  SELECT i.id_func INTO instrutor_id
  FROM instrutor i
  LEFT JOIN (
    SELECT id_func, COUNT(*) AS total_alunos
    FROM treino_aluno
    WHERE deleted = FALSE
    GROUP BY id_func
  ) ta ON i.id_func = ta.id_func
  WHERE i.deleted = FALSE
    AND i.tipo = 'I'
    AND COALESCE(ta.total_alunos, 0) < i.qntd_alunos
  ORDER BY COALESCE(ta.total_alunos, 0) ASC
  LIMIT 1;

  -- Se não houver instrutor, não podemos prosseguir.
  IF instrutor_id IS NULL THEN
    RAISE NOTICE 'Nenhum instrutor disponível no momento.';
    RETURN NEW; -- Interrompe a função.
  END IF;

  -- PASSO 2: Verificar a idade do aluno para o treino padrão (id_trei = 1).
  SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, dt_nasc))
  INTO idade_aluno
  FROM aluno
  WHERE id_aluno = NEW.id_aluno;

  FOR idade_minima IN
      SELECT e.idade_min
      FROM item_treino it
      JOIN equipamento e ON it.id_equip = e.id_equip
      WHERE it.id_trei = 1 -- Verificando especificamente o treino padrão
  LOOP
    IF idade_aluno < idade_minima THEN
      pode_alocar_treino := FALSE;
      EXIT; -- Encontrou um equipamento inadequado, pode parar de verificar.
    END IF;
  END LOOP;

  -- PASSO 3: Preparar os dados para a inserção com base na verificação de idade.
  IF pode_alocar_treino THEN
    -- Aluno tem idade, aloca o treino padrão.
    treino_id_alocar := 1;
    observacao_texto := 'Treino padrão atribuído automaticamente ao aluno na matrícula.';
  ELSE
    -- Aluno NÃO tem idade, não aloca treino.
    treino_id_alocar := NULL;
    observacao_texto := 'Aluno não possui idade para o treino padrão. Atribuir treino manualmente.';
    RAISE NOTICE '%', observacao_texto;
  END IF;

  -- PASSO 4: Inserir o registro em 'treino_aluno'.
  -- Note que 'instrutor_id' sempre terá um valor aqui.
  valores := quote_literal(CURRENT_DATE) || ', '
          || quote_literal(observacao_texto) || ', '
          || COALESCE(treino_id_alocar::text, 'NULL') || ', ' -- Converte o ID para texto ou usa 'NULL'
          || instrutor_id || ', '
          || NEW.id_aluno || ', '
          || quote_literal(CURRENT_USER) || ', '
          || quote_literal(CURRENT_TIMESTAMP);

  CALL inserir_dinamico('treino_aluno', colunas, valores);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;















-- Função genérica para impedir DELETE
CREATE OR REPLACE FUNCTION impedir_delete_direto()
RETURNS trigger AS $$
BEGIN
  RAISE EXCEPTION 'Deleção direta não permitida. Use soft delete (UPDATE deleted = true)';
END;
$$ LANGUAGE plpgsql;


-- Método de pagamento
CREATE or replace TRIGGER trg_impedir_delete_metodo_pagamento
BEFORE DELETE ON metodo_pagamento
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Plano
CREATE or replace TRIGGER trg_impedir_delete_plano
BEFORE DELETE ON plano
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Aluno
CREATE or replace TRIGGER trg_impedir_delete_aluno
BEFORE DELETE ON aluno
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Funcionário
CREATE or replace TRIGGER trg_impedir_delete_funcionario
BEFORE DELETE ON funcionario
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Instrutor
CREATE or replace TRIGGER trg_impedir_delete_instrutor
BEFORE DELETE ON instrutor
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Atendente
CREATE or replace TRIGGER trg_impedir_delete_atendente
BEFORE DELETE ON atendente
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Equipamento
CREATE or replace TRIGGER trg_impedir_delete_equipamento
BEFORE DELETE ON equipamento
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Treino
CREATE or replace TRIGGER trg_impedir_delete_treino
BEFORE DELETE ON treino
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Item Treino
CREATE or replace TRIGGER trg_impedir_delete_item_treino
BEFORE DELETE ON item_treino
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Treino Aluno
CREATE or replace TRIGGER trg_impedir_delete_treino_aluno
BEFORE DELETE ON treino_aluno
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();

-- Matrícula
CREATE or replace TRIGGER trg_impedir_delete_matricula
BEFORE DELETE ON matricula
FOR EACH ROW EXECUTE FUNCTION impedir_delete_direto();
























-- triggers para validação de dados

create or replace function func_valida_metodo_pag()
returns trigger as $$
begin 
    
if exists (
        select 1 from metodo_pagamento
        where nome = new.nome
    ) then
        raise exception 'Já existe um método de pagamento com este nome';
    end if;

if trim(new.nome) = '' THEN
    raise exception 'O campo "nome" não pode estar vazio';
end if;

if tg_op = 'update' and new.id_met_pa <> old.id_met_pa then
    raise exception 'Não é permitido alterar o campo "id" do método de pagamento';
end if;

if trim(new.descricao) = '' THEN
    raise EXCEPTION 'O campo "descrição" não pode estar vazio';
end if;
if (tg_op = 'update') THEN
    new.atualizado_em := CURRENT_TIMESTAMP;
    new.atualizado_por := CURRENT_USER;
end if;

return new;

end ;
$$ language plpgsql; 


create or replace trigger valida_metodo_pag
before insert or UPDATE on metodo_pagamento
for each ROW
execute procedure func_valida_metodo_pag();




-- trigger para validação de plano

create or replace function func_valida_plano()
returns trigger as $$
begin
if exists (
        select 1 from plano
        where nome = new.nome
    ) then
        raise exception 'Já existe um plano com este nome';
    end if;
if trim(new.nome) = '' THEN
    raise exception 'O campo "nome" não pode estar vazio';
end if;

if tg_op = 'update' and new.id_pla <> old.id_pla then
    raise exception 'Não é permitido alterar o campo "id" do método do plano';
end if;

if trim(new.descricao) = '' THEN
    raise EXCEPTION 'O campo "descrição" não pode estar vazio';
end if;
if new.duracao_meses is NULL THEN
    raise EXCEPTION 'O campo "duracao_meses" não pode estar vazio';
end if;
if new.valor is NULL THEN
    raise EXCEPTION 'O campo "valor" não pode estar vazio';
end if;
if (tg_op = 'update') THEN
    new.atualizado_em := CURRENT_TIMESTAMP;
    new.atualizado_por := CURRENT_USER;
end if;

return new;

end ;
$$ language plpgsql; 


create or replace trigger valida_plano
before insert or UPDATE on plano
for each ROW
execute procedure func_valida_plano();


-- trigger para validacao de aluno 
create or replace function func_valida_aluno()
returns trigger as $$
begin 

if tg_op = 'update' and new.id_aluno <> old.id_aluno then
    raise exception 'Não é permitido alterar o campo "id" do aluno';
end if;

if new.cpf is null or trim(new.cpf) = '' then
    raise exception 'O campo "CPF" não pode estar vazio';
end if;

if length(trim(new.cpf)) <> 11 then
    raise exception 'O CPF deve conter exatamente 11 dígitos';
end if;
        
if exists (
        select 1 from aluno 
        where cpf = new.cpf 
    ) then
        raise exception 'O CPF informado já está em uso por outro aluno';
    end if;
    
if new.nome is null or trim(new.nome) = '' then
    raise exception 'O campo "nome" não pode estar vazio';
end if;

if new.dt_nasc is null then
    raise exception 'O campo "data de nascimento" não pode estar vazio';
end if;

if new.genero is null or trim(new.genero) = '' then
    raise exception 'O campo "genero" não pode estar vazio';
end if;

if new.dt_nasc >= current_date then
    raise exception 'A data de nascimento deve ser anterior à data atual';
end if;

if extract(year from age(current_date, new.dt_nasc)) < 10 then
    raise exception 'O aluno deve ter pelo menos 10 anos de idade';
end if;

if extract(year from age(current_date, new.dt_nasc)) > 130 then
    raise exception 'O aluno deve ter no maximo 130 anos de idade';
end if;

if new.telefone is not null and trim(new.telefone) <> '' then
    if not (new.telefone ~ '^[0-9\-\(\) +]*$') then
        raise exception 'O campo "telefone" deve conter apenas números, parênteses (), hífen -, espaço e +';
    end if;
end if;

if not (new.genero in ('M', 'F', 'O')) then
    raise exception 'O campo "genero" deve ser M, F ou O';
end if;

if tg_op = 'insert' and new.dt_cadastro < new.dt_nasc then
    raise exception 'A data de cadastro não pode ser anterior à data de nascimento';
end if;

if tg_op = 'update' then
    new.atualizado_em := current_timestamp;
    new.atualizado_por := current_user;
end if;

if tg_op = 'insert' then
    new.dt_cadastro := current_timestamp;
end if;

return new;
end;
$$ language plpgsql;


create or replace trigger valida_aluno
before insert or UPDATE on aluno
for each ROW
execute procedure func_valida_aluno();



-- trigger para validacao de funcionario

create or replace function func_valida_funcionario()
returns trigger as $$
begin 

if new.cpf is null or trim(new.cpf) = '' then
    raise exception 'O campo "CPF" não pode estar vazio';
end if;

if tg_op = 'update' and new.id_func <> old.id_func then
    raise exception 'Não é permitido alterar o campo "id" do funcionário';
end if;

if length(trim(new.cpf)) <> 11 then
    raise exception 'O CPF deve conter exatamente 11 dígitos';
end if;
        
if exists (
        select 1 from funcionario 
        where cpf = new.cpf 
    ) then
        raise exception 'O CPF informado já está em uso por outro aluno';
    end if;

if trim(new.nome) = '' THEN
    raise exception 'O campo "nome" não pode estar vazio';
end if;
if new.dt_nasc is NULL THEN
    raise EXCEPTION 'O campo "data de nascimento" não pode estar vazio';
end if;
if new.dt_admissao is NULL THEN
    raise EXCEPTION 'O campo "data de admissao" não pode estar vazio';
end if;
if trim(new.turno) = '' THEN
    raise exception 'O campo "turno" não pode estar vazio';
end if;
if (new.carga_horaria) is NULL THEN
    raise exception 'O campo "carga horaria" não pode estar vazio';
end if;
if (new.salario) is NULL THEN
    raise exception 'O campo "salario" não pode estar vazio';
end if;

if (tg_op = 'update') THEN
    new.atualizado_em := CURRENT_TIMESTAMP;
    new.atualizado_por := CURRENT_USER;
end if;
return new;

end ;
$$ language plpgsql;

create or replace trigger valida_funcionario
before insert or UPDATE on funcionario
for each ROW
execute procedure func_valida_funcionario();


-- trigger para validacao de equipamento

create or replace function func_valida_equipamento()
returns trigger as $$
begin 
if exists (
        select 1 from equipamento
        where nome = new.nome
    ) then
        raise exception 'Já existe um equipamento com este nome';
    end if;
if trim(new.nome) = '' THEN
    raise exception 'O campo "nome" não pode estar vazio';
end if;

if tg_op = 'update' and new.id_equip <> old.id_equip then
    raise exception 'Não é permitido alterar o campo "id" do equipamento';
end if;

if trim(new.descricao) = '' THEN
    raise EXCEPTION 'O campo "descricao" não pode estar vazio';
end if;
if new.data_aq is NULL THEN
    raise EXCEPTION 'O campo "data de aquisicao" não pode estar vazio';
end if;
if new.idade_min is NULL THEN
    raise exception 'O campo "idade minima" não pode estar vazio';
end if;
if (tg_op = 'update') THEN
    new.atualizado_em := CURRENT_TIMESTAMP;
    new.atualizado_por := CURRENT_USER;
end if;
return new;

end ;
$$ language plpgsql; 

create or replace trigger valida_equipamento
before insert or UPDATE on equipamento
for each ROW
execute procedure func_valida_equipamento();


-- trigger para validacao de treino

create or replace function func_valida_treino()
returns trigger as $$
begin 
if exists (
        select 1 from treino
        where descricao = new.descricao
    ) then
        raise exception 'Já existe um treino com este nome';
    end if;
if trim(new.descricao) = '' THEN
    raise exception 'O campo "descricao" não pode estar vazio';
end if;

if tg_op = 'update' and new.id_treino <> old.id_treino then
    raise exception 'Não é permitido alterar o campo "id" do treino';
end if;

if trim(new.objetivo) = '' THEN
    raise EXCEPTION 'O campo "objetivo" não pode estar vazio';
end if;
if new.duracao_meses is NULL THEN
    raise EXCEPTION 'O campo "duracao em meses" não pode estar vazio';
end if;
if (tg_op = 'update') THEN
    new.atualizado_em := CURRENT_TIMESTAMP;
    new.atualizado_por := CURRENT_USER;
end if;
return new;

end ;
$$ language plpgsql; 

create or replace trigger valida_treino
before insert or UPDATE on treino
for each ROW
execute procedure func_valida_treino();




































CREATE OR REPLACE FUNCTION verificar_idade_treino_aluno() RETURNS TRIGGER AS $$
DECLARE
    idade_aluno INT;
    idade_minima INT;
    equipamento_inadequado BOOLEAN := FALSE;
BEGIN
    SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, dt_nasc))
    INTO idade_aluno
    FROM aluno
    WHERE id_aluno = NEW.id_aluno;
    
    FOR idade_minima IN
        SELECT idade_min
        FROM item_treino
        JOIN equipamento ON item_treino.id_equip = equipamento.id_equip
        WHERE item_treino.id_trei = NEW.id_trei
    LOOP
        IF idade_aluno < idade_minima THEN
            equipamento_inadequado := TRUE;
            EXIT;
        END IF;
    END LOOP;
    
    IF equipamento_inadequado THEN
        RAISE NOTICE 'Aluno não possui idade suficiente para algum equipamento do treino. Treino deve ser criado manualmente após a matrícula.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


create or replace TRIGGER verificar_idade_antes_insert
BEFORE INSERT ON treino_aluno
FOR EACH ROW EXECUTE FUNCTION verificar_idade_treino_aluno();



CREATE or replace TRIGGER aloca_treino_instrut
BEFORE INSERT ON matricula
FOR EACH ROW EXECUTE FUNCTION aloca_treino_instrut_func();




























CREATE OR REPLACE FUNCTION func_propagar_para_funcionario()
RETURNS TRIGGER AS $$
DECLARE
  novo_id_func INT;
BEGIN
  INSERT INTO funcionario (
    cpf, nome, telefone, email, endereco, dt_nasc,
    dt_admissao, turno, carga_horaria, salario, tipo, deleted,
    criado_por, criado_em
  )
  VALUES (
    NEW.cpf, NEW.nome, NEW.telefone, NEW.email, NEW.endereco, NEW.dt_nasc,
    NEW.dt_admissao, NEW.turno, NEW.carga_horaria, NEW.salario, NEW.tipo, NEW.deleted,
    NEW.criado_por, NEW.criado_em
  )
  RETURNING id_func INTO novo_id_func;

  NEW.id_func := novo_id_func;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- Trigger para a tabela INSTRUTOR
CREATE or replace TRIGGER trg_insere_funcionario_para_instrutor
BEFORE INSERT ON instrutor
FOR EACH ROW
EXECUTE FUNCTION func_propagar_para_funcionario();

-- Trigger para a tabela ATENDENTE
CREATE or replace TRIGGER trg_insere_funcionario_para_atendente
BEFORE INSERT ON atendente
FOR EACH ROW
EXECUTE FUNCTION func_propagar_para_funcionario();


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






CREATE OR REPLACE PROCEDURE atualizar_dinamico(
    p_tabela TEXT,
    p_set TEXT,       -- ex: 'nome = ''João'', email = ''joao@email.com'''
    p_where TEXT       -- ex: 'id = 5'
)
LANGUAGE plpgsql
AS $$
DECLARE
    sql_comando TEXT;
BEGIN
    sql_comando := format(
        'UPDATE %I SET %s WHERE %s',
        p_tabela, p_set, p_where
    );

    EXECUTE sql_comando;
END;
$$;