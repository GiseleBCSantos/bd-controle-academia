create or replace function func_valida_funcionario()
returns trigger as $$
begin 

if new.cpf is null or trim(new.cpf) = '' then
    raise exception 'O campo "CPF" não pode estar vazio';
end if;

if length(trim(new.cpf)) <> 11 then
    raise exception 'O CPF deve conter exatamente 11 dígitos';
end if;
        
if exists (
        select 1 from funcionario 
        where cpf = new.cpf 
    ) then
        raise exception 'O CPF informado já está em uso por outro funcionario';
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
$$ language plpgsql
