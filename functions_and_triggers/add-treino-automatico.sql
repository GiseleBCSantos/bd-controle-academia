CREATE OR REPLACE FUNCTION aloca_treino_instrut_func()
RETURNS trigger AS $$
DECLARE
  treino_id INT;
  instrutor_id INT;
  idade_aluno INT;
  idade_minima INT;
  bloqueado BOOLEAN := FALSE;
  colunas TEXT := 'dt_inicio, observacao, id_trei, id_func, id_aluno, criado_por, criado_em';
  valores TEXT;
BEGIN
  SELECT id_trei INTO treino_id
  FROM treino
  WHERE id_trei = 1
  LIMIT 1;

  IF treino_id IS NULL THEN
    RAISE NOTICE 'Treino inicial não encontrado!';
    RETURN NEW;
  END IF;

  SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, dt_nasc))
  INTO idade_aluno
  FROM aluno
  WHERE id_aluno = NEW.id_aluno;

  FOR idade_minima IN
      SELECT e.idade_min
      FROM item_treino it
      JOIN equipamento e ON it.id_equip = e.id_equip
      WHERE it.id_trei = treino_id
  LOOP
    IF idade_aluno < idade_minima THEN
      bloqueado := TRUE;
      EXIT;
    END IF;
  END LOOP;

  IF bloqueado THEN
    RAISE NOTICE 'Aluno não tem idade suficiente para os equipamentos do treino padrão. Nenhum treino foi alocado.';
    RETURN NEW;
  END IF;

  SELECT f.id_func INTO instrutor_id
  FROM funcionario f
  JOIN instrutor i ON f.id_func = i.id_func
  LEFT JOIN (
    SELECT id_func, COUNT(*) AS total_alunos
    FROM treino_aluno
    GROUP BY id_func
  ) ta ON f.id_func = ta.id_func
  WHERE f.deleted = FALSE
    AND COALESCE(ta.total_alunos, 0) < i.qntd_alunos
  ORDER BY COALESCE(ta.total_alunos, 0) ASC
  LIMIT 1;

  IF instrutor_id IS NULL THEN
    RAISE NOTICE 'Nenhum instrutor disponível no momento.';
    RETURN NEW;
  END IF;

  valores := quote_literal(CURRENT_DATE) || ', '
          || quote_literal('Treino atribuído automaticamente ao aluno na matrícula.') || ', '
          || treino_id || ', '
          || instrutor_id || ', '
          || NEW.id_aluno || ', '
          || quote_literal(CURRENT_USER) || ', '
          || quote_literal(CURRENT_TIMESTAMP);

  CALL inserir_dinamico('treino_aluno', colunas, valores);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
