create or replace function aloca_treino_instrut_func()
returns trigger as $$
declare
  treino_id int;
  instrutor_id int;
  colunas text := 'dt_inicio, observacao, id_func, id_aluno, criado_por, criado_em';
  valores text;
begin
  select id_treino into treino_id 
  from treino
  where id_treino = 1
  limit 1;

  if treino_id is NULL then
    raise exception 'Treino inicial não encontrado!';
  end if;

  SELECT i.id_func INTO instrutor_id
  FROM instrutor i
  LEFT JOIN (
    SELECT id_func, COUNT(*) AS total_alunos
    FROM treino_aluno
    GROUP BY id_func
  ) ta ON i.id_func = ta.id_func
  WHERE i.deleted = FALSE
    AND COALESCE(ta.total_alunos, 0) < i.qntd_alunos
  ORDER BY COALESCE(ta.total_alunos, 0) ASC
  LIMIT 1;

  IF instrutor_id IS NULL THEN
    RAISE EXCEPTION 'Nenhum instrutor disponível com capacidade para novos alunos.';
  END IF;

   valores := quote_literal(CURRENT_DATE) || ', '
          || quote_literal('Treino atribuído automaticamente ao aluno na matrícula.') || ', '
          || instrutor_id || ', '
          || NEW.id_aluno || ', '
          || quote_literal(CURRENT_USER) || ', '
          || quote_literal(CURRENT_TIMESTAMP);

  CALL inserir_dinamico('treino_aluno', colunas, valores);

  return new;

end;
$$ language plpgsql;

create or replace trigger aloca_treino_instrut
after insert on matricula
for each row
execute procedure aloca_treino_instrut_func()
