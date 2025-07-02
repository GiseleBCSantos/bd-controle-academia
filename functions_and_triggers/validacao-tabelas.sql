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

if age(current_date, new.dt_nasc).years < 10 then
    raise exception 'O aluno deve ter pelo menos 10 anos de idade';
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

if exists (
        select 1 from funcionario 
        where cpf = new.cpf 
    ) then
        raise exception 'O CPF informado já está em uso por outro funcionario';
    end if;

begin 
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
        where nome = new.nome
    ) then
        raise exception 'Já existe um treino com este nome';
    end if;
if trim(new.descricao) = '' THEN
    raise exception 'O campo "descricao" não pode estar vazio';
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
