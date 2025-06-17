create or replace function func_valida_funcionario()
returns trigger as $$
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
$$ language plpgsql