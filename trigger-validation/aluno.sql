-- trigger para validacao de aluno 
create or replace function func_valida_aluno()
returns trigger as $$
begin 

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
