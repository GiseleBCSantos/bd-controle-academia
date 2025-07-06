-- Tabela de metodos de pagamento
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Cartão de Crédito'', ''Pagamento via cartão de crédito (Visa, Master, Elo, etc)'', 2.50');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Cartão de Débito'', ''Pagamento imediato via cartão de débito'', 1.25');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Pix'', ''Transferência imediata via chave Pix'', 0.00');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Boleto Bancário'', ''Pagamento por boleto com vencimento em até 3 dias'', 1.90');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual', '''Dinheiro'', ''Pagamento em espécie direto na academia'', 0.00');




-- Equipamentos para TREINO DE MEMBROS INFERIORES
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Leg Press 45°'', ''Exercício para quadríceps, glúteos e posteriores'', ''2022-06-10'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Cadeira Extensora'', ''Fortalece os quadríceps isoladamente'', ''2022-06-15'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Mesa Flexora'', ''Trabalha os músculos posteriores da coxa'', ''2022-06-20'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Cadeira Abdutora'', ''Fortalece músculos da parte externa da coxa e glúteos'', ''2022-06-25'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Cadeira Adutora'', ''Foca nos músculos internos da coxa'', ''2022-06-30'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Hack Machine'', ''Variação do leg press com inclinação'', ''2022-07-01'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Smith Machine'', ''Máquina guiada para agachamento e avanço'', ''2022-07-05'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Plataforma para Elevação de Gêmeos'', ''Trabalha os músculos da panturrilha'', ''2022-07-10'', 16');

-- Equipamentos para TREINO DE MEMBROS SUPERIORES
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Pulley (Puxada Alta)'', ''Fortalece costas e bíceps'', ''2022-07-15'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Remada Baixa'', ''Desenvolvimento do latíssimo do dorso'', ''2022-07-16'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Supino Reto'', ''Exercício composto para peitoral maior'', ''2022-07-17'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Supino Inclinado'', ''Foco na parte superior do peito'', ''2022-07-18'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Crossover'', ''Isolamento do peitoral com cabos'', ''2022-07-19'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Desenvolvimento com Halteres'', ''Trabalho de ombros e trapézio'', ''2022-07-20'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Rosca Direta'', ''Fortalecimento de bíceps'', ''2022-07-21'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Tríceps Pulley'', ''Trabalho isolado do tríceps braquial'', ''2022-07-22'', 16');

-- Equipamentos para TREINO FUNCIONAL
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Kettlebell 8kg'', ''Treinos de força e resistência'', ''2022-07-25'', 14');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Kettlebell 16kg'', ''Avançado para treino funcional'', ''2022-07-25'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Corda Naval'', ''Trabalho de explosão muscular e cardio'', ''2022-07-26'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Caixa de Pliometria'', ''Saltos e agilidade para membros inferiores'', ''2022-07-27'', 14');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Bola Medicinal'', ''Exercícios de força, arremesso e rotação de tronco'', ''2022-07-28'', 12');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Roda Abdominal'', ''Treino intenso para abdômen e core'', ''2022-07-29'', 16');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''Elásticos de Resistência'', ''Versátil para diversos grupos musculares'', ''2022-07-30'', 12');
CALL inserir_dinamico('equipamento', 'nome, descricao, data_aq, idade_min', '''TRX'', ''Sistema de treino suspenso para corpo inteiro'', ''2022-07-31'', 16');





-- Tabela funcionarios
-- Atendentes
CALL inserir_dinamico('atendente', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''11111111111'', ''Ana Souza'', ''11999990001'', ''ana.souza@academia.com'', ''Rua Alfa, 123'', ''1990-05-10'', ''2024-01-01'', ''manhã'', 6, 1800.00, ''A'', ''S''');
  
CALL inserir_dinamico('atendente', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''22222222222'', ''Bruno Lima'', ''11999990002'', ''bruno.lima@academia.com'', ''Rua Beta, 456'', ''1992-07-15'', ''2024-01-01'', ''tarde'', 6, 1800.00, ''A'', ''S''');
  
CALL inserir_dinamico('atendente', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''33333333333'', ''Carla Mendes'', ''11999990003'', ''carla.mendes@academia.com'', ''Rua Gama, 789'', ''1989-03-20'', ''2024-01-01'', ''noite'', 6, 1800.00, ''A'', ''S''');

-- intrutores
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''44444444444'', ''Diego Santos'', ''11999991001'', ''diego.santos@academia.com'', ''Av Central, 111'', ''1985-01-05'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Musculação''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''55555555555'', ''Elaine Rocha'', ''11999991002'', ''elaine.rocha@academia.com'', ''Av Sul, 222'', ''1991-04-18'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Funcional''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''66666666666'', ''Fábio Nunes'', ''11999991003'', ''fabio.nunes@academia.com'', ''Av Norte, 333'', ''1987-08-30'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Alongamento''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''77777777777'', ''Gabriela Alves'', ''11999991004'', ''gabriela.alves@academia.com'', ''Rua Um, 444'', ''1993-02-22'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Cardio''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''88888888888'', ''Henrique Silva'', ''11999991005'', ''henrique.silva@academia.com'', ''Rua Dois, 555'', ''1986-06-11'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Musculação''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''99999999999'', ''Isabela Teixeira'', ''11999991006'', ''isabela.teixeira@academia.com'', ''Rua Três, 666'', ''1990-10-09'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Pilates''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''10101010101'', ''João Paulo'', ''11999991007'', ''joao.paulo@academia.com'', ''Av Oeste, 777'', ''1988-09-01'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Funcional''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''12121212121'', ''Karen Costa'', ''11999991008'', ''karen.costa@academia.com'', ''Av Leste, 888'', ''1994-12-12'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Crossfit''');
  
CALL inserir_dinamico('instrutor', 'cpf, nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''13131313131'', ''Lucas Fernandes'', ''11999991009'', ''lucas.fernandes@academia.com'', ''Av Delta, 999'', ''1995-11-25'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Musculação''');



CALL inserir_dinamico('plano', 'nome, descricao, duracao_meses, valor', 
  '''Plano Básico'', ''Acesso à academia em horários comerciais'', 1, 99.90');

CALL inserir_dinamico('plano', 'nome, descricao, duracao_meses, valor', 
  '''Plano Intermediário'', ''Acesso ilimitado + aulas em grupo'', 3, 149.90');

CALL inserir_dinamico('plano', 'nome, descricao, duracao_meses, valor', 
  '''Plano Premium'', ''Acesso 24h + personal trainer incluso'', 6, 299.90');



-- Tabela treino
CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino Iniciante - Matrícula'', ''Avaliação inicial e adaptação muscular'', 0');
CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino Iniciante - 1 Mês'', ''Fortalecimento básico e resistência muscular'', 1');
CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino Iniciante - 3 Meses'', ''Progressão de força e melhora da postura'', 3');
CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino - 6 Meses'', ''Hipertrofia e condicionamento avançado'', 6');







-- Tabela item treino
-- Inferiores treino 1
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 40, 1, 1');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 20, 1, 2');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 20, 1, 3');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 0, 1, 4');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 10, 1, 5');

-- Superiores treino 1
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 10, 1, 9');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 10, 1, 10');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 10, 1, 11');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 5, 1, 14');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 5, 1, 15');

-- Funcional treino 1
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 20, 5, 1, 17');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 20, 0, 1, 18');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 20, 5, 1, 20');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 20, 0, 1, 22');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 20, 5, 1, 24');

-- Inferiores treino 2
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 60, 2, 1');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 30, 2, 2');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 30, 2, 3');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 10, 2, 4');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 2, 5');

-- Superiores treino 2
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 2, 9');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 2, 10');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 30, 2, 11');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 10, 2, 14');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 10, 2, 15');

-- Funcional treino 2
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 10, 2, 17');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 15, 0, 2, 18');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 10, 2, 20');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 0, 2, 22');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 10, 2, 24');

-- Inferiores treino 3
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 80, 3, 1');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 40, 3, 2');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 40, 3, 3');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 3, 4');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 30, 3, 5');

-- Superiores treino 3
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 40, 3, 9');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 40, 3, 10');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 40, 3, 11');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 3, 14');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 12, 20, 3, 15');

-- Funcional treino 3
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 15, 3, 17');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 0, 3, 18');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 10, 3, 20');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 0, 3, 22');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '3, 20, 10, 3, 24');

-- Inferiores treino 4
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 100, 4, 1');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 50, 4, 2');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 50, 4, 3');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 30, 4, 4');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 40, 4, 5');

-- Superiores treino 4
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 60, 4, 9');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 60, 4, 10');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 60, 4, 11');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 40, 4, 14');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 10, 40, 4, 15');

-- Funcional treino 4
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 30, 20, 4, 17');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 20, 0, 4, 18');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 30, 20, 4, 20');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 30, 0, 4, 22');
CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '4, 30, 15, 4, 24');




CALL inserir_dinamico(
  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''11111111101'', ''Ana Silva'', ''11980010001'', ''ana.silva@email.com'', ''2001-02-15'', ''F'', ''Rua das Flores, 10''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''22222222202'', ''Carlos Souza'', ''11980020002'', ''carlos.souza@email.com'', ''1999-06-20'', ''M'', ''Av Brasil, 150''');

CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''33333333303'', ''Beatriz Costa'', ''11980030003'', ''beatriz.costa@email.com'', ''2000-09-10'', ''F'', ''Rua das Palmeiras, 75''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''44444444404'', ''Diego Pereira'', ''11980040004'', ''diego.pereira@email.com'', ''2002-01-30'', ''M'', ''Rua do Sol, 45''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''55555555505'', ''Fernanda Lima'', ''11980050005'', ''fernanda.lima@email.com'', ''1998-12-25'', ''F'', ''Av Central, 100''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''66666666606'', ''Gustavo Martins'', ''11980060006'', ''gustavo.martins@email.com'', ''2001-07-14'', ''M'', ''Rua Nova, 20''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''77777777707'', ''Helena Rocha'', ''11980070007'', ''helena.rocha@email.com'', ''1997-11-03'', ''F'', ''Rua Bela Vista, 35''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''88888888808'', ''Igor Alves'', ''11980080008'', ''igor.alves@email.com'', ''2003-05-22'', ''M'', ''Av Liberdade, 55''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''99999999909'', ''Julia Fernandes'', ''11980090009'', ''julia.fernandes@email.com'', ''2000-03-18'', ''F'', ''Rua Primavera, 80''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''10101010101'', ''Lucas Barbosa'', ''11980100010'', ''lucas.barbosa@email.com'', ''1999-10-05'', ''M'', ''Rua das Acácias, 99''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''11111111111'', ''Marina Dias'', ''11980110011'', ''marina.dias@email.com'', ''2002-08-17'', ''F'', ''Av Jardim, 22''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''12121212121'', ''Nicolas Santos'', ''11980120012'', ''nicolas.santos@email.com'', ''2001-01-12'', ''M'', ''Rua das Oliveiras, 14''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''13131313131'', ''Olivia Castro'', ''11980130013'', ''olivia.castro@email.com'', ''1998-04-08'', ''F'', ''Rua dos Jacarandás, 60''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''14141414141'', ''Paulo Henrique'', ''11980140014'', ''paulo.henrique@email.com'', ''2000-06-27'', ''M'', ''Av Vitória, 33''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''15151515151'', ''Quenia Martins'', ''11980150015'', ''quenia.martins@email.com'', ''1999-09-09'', ''F'', ''Rua das Margaridas, 78''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''16161616161'', ''Rafael Gomes'', ''11980160016'', ''rafael.gomes@email.com'', ''2002-11-11'', ''M'', ''Av Sol Nascente, 21''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''17171717171'', ''Sara Lima'', ''11980170017'', ''sara.lima@email.com'', ''2001-03-29'', ''F'', ''Rua Azul, 18''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''18181818181'', ''Thiago Vieira'', ''11980180018'', ''thiago.vieira@email.com'', ''1998-07-04'', ''M'', ''Av Mar, 44''');
CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',
  '''19191919192'', ''Vanessa Souza'', ''11980190019'', ''vanessa.souza@email.com'', ''2013-10-13'', ''F'', ''Rua Jardim, 27''');


-- Aluno 1: Plano Premium (id 3), pagamento com Pix (id 3), atendente Bruno (id 2)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '1, 3, 3, 2, ''ativo'', 299.90');

-- Aluno 2: Plano Básico (id 1), pagamento com Dinheiro (id 5), atendente Ana (id 1)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '2, 1, 5, 1, ''ativo'', 99.90');

-- Aluno 4: Plano Intermediário (id 2), pagamento com Cartão de Crédito (id 1), atendente Carla (id 3)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '4, 2, 1, 3, ''ativo'', 149.90');

-- Aluno 6: Plano Básico (id 1), pagamento com Cartão de Débito (id 2), atendente Bruno (id 2)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '6, 1, 2, 2, ''ativo'', 99.90');

-- Aluno 7: Plano Premium (id 3), pagamento com Boleto (id 4), atendente Ana (id 1)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '7, 3, 4, 1, ''ativo'', 299.90');

-- Aluno 8: Plano Intermediário (id 2), pagamento com Pix (id 3), atendente Carla (id 3)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '8, 2, 3, 3, ''ativo'', 149.90');

-- Aluno 9: Plano Básico (id 1), pagamento com Dinheiro (id 5), atendente Ana (id 1)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '9, 1, 5, 1, ''ativo'', 99.90');

-- Aluno 10: Plano Premium (id 3), pagamento com Cartão de Crédito (id 1), atendente Bruno (id 2)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '10, 3, 1, 2, ''ativo'', 299.90');

-- Aluno 11: Plano Intermediário (id 2), pagamento com Cartão de Débito (id 2), atendente Carla (id 3)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '11, 2, 2, 3, ''ativo'', 149.90');

-- Aluno 12: Plano Básico (id 1), pagamento com Boleto (id 4), atendente Ana (id 1)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '12, 1, 4, 1, ''ativo'', 99.90');

-- Aluno 13: Plano Premium (id 3), pagamento com Pix (id 3), atendente Bruno (id 2)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '13, 3, 3, 2, ''ativo'', 299.90');

-- Aluno 14: Plano Intermediário (id 2), pagamento com Dinheiro (id 5), atendente Carla (id 3)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '14, 2, 5, 3, ''ativo'', 149.90');

-- Aluno 15: Plano Básico (id 1), pagamento com Cartão de Crédito (id 1), atendente Ana (id 1)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '15, 1, 1, 1, ''ativo'', 99.90');

-- Aluno 16: Plano Premium (id 3), pagamento com Cartão de Débito (id 2), atendente Bruno (id 2)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '16, 3, 2, 2, ''ativo'', 299.90');

-- Aluno 17: Plano Intermediário (id 2), pagamento com Boleto (id 4), atendente Carla (id 3)
CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '17, 2, 4, 3, ''ativo'', 149.90');


CALL inserir_dinamico('aluno', 'cpf, nome, telefone, email, dt_nasc, genero, endereco', '''20202020202'', ''Letícia Ribeiro'', ''11980200020'', ''leticia.ribeiro@email.com'', ''2012-04-10'', ''F'', ''Rua da Juventude, 50''');

CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag', '19, 1, 3, 1, ''ativo'', 99.90');




-- Cenário 1: Carlos Souza (id_aluno = 2) completou o período inicial.
-- Atualizamos seu treino do padrão (id 1) para o 'Treino Iniciante - 1 Mês' (id 2).
CALL atualizar_dinamico(
    'treino_aluno',                                                              -- Tabela
    'id_trei = 2, observacao = ''Progressão para o treino de 1 Mês.''',          -- Colunas a serem atualizadas
    'id_aluno = 2'                                                               -- Condição
);


-- Cenário 2: A aluna de 12 anos, Letícia Ribeiro (id_aluno = 21), recebe seu primeiro treino.
-- Seu 'id_trei' estava NULO. Agora, um instrutor avaliou e atribuiu o treino de 1 Mês (id 2).
CALL atualizar_dinamico(
    'treino_aluno',
    'id_trei = 2, observacao = ''Primeiro treino (Iniciante - 1 Mês) atribuído manualmente.''',
    'id_aluno = 19'
);


-- Cenário 3: Fernanda Lima (id_aluno = 5) já está mais avançada.
-- Atualizamos o treino dela para o 'Treino Iniciante - 3 Meses' (id 3).
CALL atualizar_dinamico(
    'treino_aluno',
    'id_trei = 3, observacao = ''Atualizado para o treino de 3 Meses.''',
    'id_aluno = 5'
);


-- Cenário 4: Rafael Gomes (id_aluno = 16) mostrou grande evolução.
-- Ele pula para o treino mais avançado, 'Treino - 6 Meses' (id 4).
CALL atualizar_dinamico(
    'treino_aluno',
    'id_trei = 4, observacao = ''Progressão para treino avançado de 6 Meses.''',
    'id_aluno = 16'
);


-- Cenário 5: O outro aluno de 12 anos, Ricardo Nogueira (id_aluno = 22), também recebe seu primeiro treino.
-- Atribuímos o mesmo treino inicial que Letícia, o de 1 Mês (id 2).
CALL atualizar_dinamico(
    'treino_aluno',
    'id_trei = 2, observacao = ''Primeiro treino (Iniciante - 1 Mês) atribuído manualmente.''',
    'id_aluno = 18'
);