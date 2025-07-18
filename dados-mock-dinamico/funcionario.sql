
-- Tabela funcionarios
-- Atendentes
CALL inserir_dinamico('atendente', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''Ana Souza'', ''11999990001'', ''ana.souza@academia.com'', ''Rua Alfa, 123'', ''1990-05-10'', ''2024-01-01'', ''manhã'', 6, 1800.00, ''A'', ''S''');
CALL inserir_dinamico('atendente', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''Bruno Lima'', ''11999990002'', ''bruno.lima@academia.com'', ''Rua Beta, 456'', ''1992-07-15'', ''2024-01-01'', ''tarde'', 6, 1800.00, ''A'', ''S''');
CALL inserir_dinamico('atendente', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, permissao_caixa', 
  '''Carla Mendes'', ''11999990003'', ''carla.mendes@academia.com'', ''Rua Gama, 789'', ''1989-03-20'', ''2024-01-01'', ''noite'', 6, 1800.00, ''A'', ''S''');

-- intrutores
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Diego Santos'', ''11999991001'', ''diego.santos@academia.com'', ''Av Central, 111'', ''1985-01-05'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Musculação''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Elaine Rocha'', ''11999991002'', ''elaine.rocha@academia.com'', ''Av Sul, 222'', ''1991-04-18'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Funcional''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Fábio Nunes'', ''11999991003'', ''fabio.nunes@academia.com'', ''Av Norte, 333'', ''1987-08-30'', ''2023-12-01'', ''manhã'', 6, 2500.00, ''I'', 20, ''Alongamento''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Gabriela Alves'', ''11999991004'', ''gabriela.alves@academia.com'', ''Rua Um, 444'', ''1993-02-22'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Cardio''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Henrique Silva'', ''11999991005'', ''henrique.silva@academia.com'', ''Rua Dois, 555'', ''1986-06-11'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Musculação''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Isabela Teixeira'', ''11999991006'', ''isabela.teixeira@academia.com'', ''Rua Três, 666'', ''1990-10-09'', ''2023-12-01'', ''tarde'', 6, 2500.00, ''I'', 20, ''Pilates''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''João Paulo'', ''11999991007'', ''joao.paulo@academia.com'', ''Av Oeste, 777'', ''1988-09-01'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Funcional''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Karen Costa'', ''11999991008'', ''karen.costa@academia.com'', ''Av Leste, 888'', ''1994-12-12'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Crossfit''');
CALL inserir_dinamico('instrutor', 'nome, telefone, email, endereco, dt_nasc, dt_admissao, turno, carga_horaria, salario, tipo, qntd_alunos, especialidade', 
  '''Lucas Fernandes'', ''11999991009'', ''lucas.fernandes@academia.com'', ''Av Delta, 999'', ''1995-11-25'', ''2023-12-01'', ''noite'', 6, 2500.00, ''I'', 20, ''Musculação''');

