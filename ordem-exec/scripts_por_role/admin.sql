-- inserts possiveis
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Cartão de Crédito'', ''Pagamento via cartão de crédito (Visa, Master, Elo, etc)'', 2.50');

CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Leg Press 45°'', ''Exercício para quadríceps, glúteos e posteriores'', ''2022-06-10'', 16');

CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Pulley (Puxada Alta)'', ''Fortalece costas e bíceps'', ''2022-07-15'', 16');

CALL inserir_dinamico('atendente', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''11111111111'', ''Ana Souza'', ''11999990001'', ''ana.souza@academia.com'', ''Rua Alfa, 123'', ''1990-05-10'', ''2024-01-01'', ''manhã'', 6, 1800.00, ''A'', ''S''');

CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''44444444444'', ''Diego Santos'', ''11999991001'', ''diego.santos@academia.com'', ''Av Central, 111'', ''1985-01-05'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Musculação''');

CALL inserir_dinamico('plano', 'nome, descricao, duracao_meses, valor', 
  '''Plano Básico'', ''Acesso à academia em horários comerciais'', 1, 99.90');

CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino Iniciante - Matrícula'', ''Avaliação inicial e adaptação muscular'', 0');

CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 40, 1, 1');

CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''11111111101'', ''Ana Silva'', ''11980010001'', ''ana.silva@email.com'', ''2001-02-15'', ''F'', ''Rua das Flores, 10''');

CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag, dt_matricula', '1, 3, 3, 2, ''ativo'', 299.90, ''2025-05-01''');



GRANT SELECT ON equipamento TO instrutor;
