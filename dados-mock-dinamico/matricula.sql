-- Aluno 1 a 5: plano 1 mês, pagamento Pix
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '1, 2, 3, 1, ''ativo'', 120.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '2, 2, 3, 1, ''ativo'', 120.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '3, 2, 3, 1, ''ativo'', 120.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '4, 2, 3, 1, ''ativo'', 120.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '5, 2, 3, 1, ''ativo'', 120.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');

-- Aluno 6 a 10: plano 3 meses, pagamento Cartão de Crédito
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '6, 3, 1, 1, ''ativo'', 330.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '7, 3, 1, 1, ''ativo'', 330.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '8, 3, 1, 1, ''ativo'', 330.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '9, 3, 1, 1, ''ativo'', 330.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '10, 3, 1, 1, ''ativo'', 330.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');

-- Aluno 11 a 15: plano 6 meses, pagamento Boleto Bancário
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '11, 4, 4, 1, ''ativo'', 600.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '12, 4, 4, 1, ''ativo'', 600.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '13, 4, 4, 1, ''ativo'', 600.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '14, 4, 4, 1, ''ativo'', 600.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '15, 4, 4, 1, ''ativo'', 600.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');

-- Aluno 16 a 20: plano matrícula (inicial), pagamento em Dinheiro
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '16, 1, 5, 1, ''ativo'', 90.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '17, 1, 5, 1, ''ativo'', 90.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '18, 1, 5, 1, ''ativo'', 90.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '19, 1, 5, 1, ''ativo'', 90.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_atendente, status, valor_pag, dt_matricula, criado_por, criado_em', '20, 1, 5, 1, ''ativo'', 90.00, CURRENT_DATE, current_user, CURRENT_TIMESTAMP');


-- Alunos 1 a 5 → mudar para treino "Iniciante - 1 Mês" (id_treino = 2)
CALL atualizar_dinamico(
  'treino_aluno',
  'id_treino = 2',
  'id_aluno IN (1, 2, 3, 4, 5)'
);

-- Alunos 6 a 10 → mudar para treino "Iniciante - 3 Meses" (id_treino = 3)
CALL atualizar_dinamico(
  'treino_aluno',
  'id_treino = 3',
  'id_aluno IN (6, 7, 8, 9, 10)'
);

-- Alunos 11 a 15 → mudar para treino "6 Meses" (id_treino = 4)
CALL atualizar_dinamico(
  'treino_aluno',
  'id_treino = 4',
  'id_aluno IN (11, 12, 13, 14, 15)'
);