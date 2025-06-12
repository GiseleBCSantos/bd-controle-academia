-- Metodo de pagamento
create table  metodo_pagamento
(
  id_met_pag serial primary KEY,
  nome varchar(50) not null,
  descricao varchar(200) not null,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por varchar(50) null,
  atualizado_em TIMESTAMP NULL
 );
 
 -- Plano
 create table plano
 (
  id_pla serial primary key,
  nome varchar(50) not null,
  descricao varchar(200) not null,
  duracao_meses int not null,
  valor NUMERIC(10,2) not null,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
  atualizado_em TIMESTAMP NULL
 );
 
 -- Aluno
 create table aluno
 (
   id_aluno serial primary key,
   nome varchar(100) not null,
   telefone varchar(50),
   email varchar(50),
   dt_nasc date not null,
   genero CHAR NOT NULL CHECK (genero IN ('M', 'F', 'O'))
   dt_cadastro date not null,
   endereco varchar(100),
   criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
   criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
   atualizado_em TIMESTAMP NULL
 );
 
 -- funcionarios
 create table funcionario
 (
   id_func serial primary key,
   nome varchar(100) not null,
   telefone varchar(50),
   email varchar(50),
   endereco varchar(100), 
   dt_nasc date not null,
   dt_admissao date not null,
   turno varchar(20) not null,
   carga_horaria int not null,
   salario NUMERIC(10,2) not null,
   tipo char not null,
   criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
   criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
   atualizado_em TIMESTAMP NULL
 );
 
 create table instrutor
 (
   qntd_alunos int,
   especialidade varchar(20)
 ) INHERITS  (funcionario);
 
 create table atendente
 (
  permissao_caixa char
 )
 INHERITS  (funcionario);
 
 -- equipamento
 create table equipamento
 (
   id_equip serial primary key,
   nome varchar(50) not null,
   descricao varchar(200) not null,
   data_aq date not null,
   idade_min int not null,
   criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
   criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
   atualizado_em TIMESTAMP NULL
 );
 
 -- treino
 create table treino
 (
   id_trei serial primary key,
   descricao varchar(200) not null,
   objetivo varchar(50),
   duracao_meses int,
   criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
   criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
   atualizado_em TIMESTAMP NULL
 ); 
 
 -- item treino
 create table item_treino 
 (
  id_item_treino serial primary key,
  series int not null,
  repeticoes int not null,
  carga int,
  id_trei int not null,
  id_equip int not null,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   atualizado_por varchar(50) null,
  atualizado_em TIMESTAMP NULL,
  foreign key (id_trei) references treino(id_trei),
  foreign key (id_equip) references equipamento(id_equip)
 );
 
-- treino aluno
create table treino_aluno
(
  id_trei_alu serial primary key,
  dt_inicio date not null,
  observacao varchar(200),
  id_func int not null,
  id_aluno int not null,
  id_treino int not null,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por varchar(50) null,
  atualizado_em TIMESTAMP NULL,
  foreign key (id_func) references funcionario (id_func),
  foreign key (id_aluno) references aluno (id_aluno),
  foreign key (id_treino) references treino (id_treino)
);





– matricula
CREATE TABLE matricula (
  id_matricula SERIAL PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_plano INT NOT NULL,
  id_met_pag INT NOT NULL,
  id_atendente INT NOT NULL,
  status VARCHAR(20) CHECK (status IN ('ativo', 'inativo', 'cancelado')),
  valor_pag NUMERIC(10,2),
  dt_matricula DATE NOT NULL,
  criado_por VARCHAR(50) NOT NULL DEFAULT current_user,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_por VARCHAR(50),
  atualizado_em TIMESTAMP,

  FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  FOREIGN KEY (id_plano) REFERENCES plano(id_pla),
  FOREIGN KEY (id_met_pag) REFERENCES metodo_pagamento(id_met_pag),
  FOREIGN KEY (id_atendente) REFERENCES funcionario(id_func)
);



