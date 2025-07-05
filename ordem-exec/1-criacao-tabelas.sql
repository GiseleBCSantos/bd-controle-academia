-- Metodo de pagamento
DROP TABLE IF EXISTS metodo_pagamento CASCADE;
CREATE TABLE metodo_pagamento (
  id_met_pag SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  taxa_percentual NUMERIC(5,2) NOT NULL DEFAULT 0.00,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Plano
DROP TABLE IF EXISTS plano CASCADE;
CREATE TABLE plano (
  id_pla SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  duracao_meses INT NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Aluno
DROP TABLE IF EXISTS aluno CASCADE;
CREATE TABLE aluno (
  id_aluno SERIAL PRIMARY KEY,
  cpf varchar(11) not null,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(50),
  email VARCHAR(50),
  dt_nasc DATE NOT NULL,
  genero CHAR NOT NULL CHECK (genero IN ('M', 'F', 'O')),
  dt_cadastro DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  endereco VARCHAR(100),
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Funcionário
DROP TABLE IF EXISTS funcionario CASCADE;
CREATE TABLE funcionario (
  id_func SERIAL PRIMARY KEY,
  cpf varchar(11) not null,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(50),
  email VARCHAR(50),
  endereco VARCHAR(100),
  dt_nasc DATE NOT NULL,
  dt_admissao DATE NOT NULL,
  turno VARCHAR(20) NOT NULL,
  carga_horaria INT NOT NULL,
  salario NUMERIC(10,2) NOT NULL,
  tipo CHAR NOT NULL,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Instrutor
DROP TABLE IF EXISTS instrutor CASCADE;
CREATE TABLE instrutor (
  qntd_alunos INT,
  especialidade VARCHAR(20),
  deleted BOOLEAN NOT NULL DEFAULT FALSE
) INHERITS (funcionario);

-- Atendente
DROP TABLE IF EXISTS atendente CASCADE;
CREATE TABLE atendente (
  permissao_caixa CHAR,
  deleted BOOLEAN NOT NULL DEFAULT FALSE
) INHERITS (funcionario);

-- Equipamento
DROP TABLE IF EXISTS equipamento CASCADE;
CREATE TABLE equipamento (
  id_equip SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  data_aq DATE NOT NULL,
  idade_min INT NOT NULL,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Treino
DROP TABLE IF EXISTS treino CASCADE;
CREATE TABLE treino (
  id_trei SERIAL PRIMARY KEY,
  descricao VARCHAR(200) NOT NULL,
  objetivo VARCHAR(50),
  duracao_meses INT,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP
);

-- Item Treino
DROP TABLE IF EXISTS item_treino CASCADE;
CREATE TABLE item_treino (
  id_item_treino SERIAL PRIMARY KEY,
  series INT NOT NULL,
  repeticoes INT NOT NULL,
  carga INT,
  id_trei INT NOT NULL,
  id_equip INT NOT NULL,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP,
  FOREIGN KEY (id_trei) REFERENCES treino(id_trei),
  FOREIGN KEY (id_equip) REFERENCES equipamento(id_equip)
);

DROP TABLE IF EXISTS treino_aluno CASCADE;
CREATE TABLE treino_aluno (
    id_trei_alu SERIAL PRIMARY KEY,
    dt_inicio DATE NOT NULL,
    observacao VARCHAR(200),
    id_instrut INT NOT NULL,
    id_aluno INT NOT NULL,
    id_trei INT,
    deleted BOOLEAN NOT NULL DEFAULT FALSE,
    criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_por VARCHAR(50),
    atualizado_em TIMESTAMP,
    FOREIGN KEY (id_instrut) REFERENCES funcionario(id_func),  -- Referencia funcionario
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_trei) REFERENCES treino(id_trei)
);


-- Matrícula
DROP TABLE IF EXISTS matricula CASCADE;
CREATE TABLE matricula (
  id_matricula SERIAL PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_plano INT NOT NULL,
  id_met_pag INT NOT NULL,
  id_func INT NOT NULL,
  status VARCHAR(20) CHECK (status IN ('ativo', 'inativo', 'cancelado')),
  valor_pag NUMERIC(10,2),
  dt_matricula TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted BOOLEAN NOT NULL DEFAULT FALSE,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP,
  FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  FOREIGN KEY (id_plano) REFERENCES plano(id_pla),
  FOREIGN KEY (id_met_pag) REFERENCES metodo_pagamento(id_met_pag),
  FOREIGN KEY (id_func) REFERENCES funcionario(id_func)
);




