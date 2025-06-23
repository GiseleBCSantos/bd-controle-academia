CREATE ROLE admin;
CREATE ROLE contabilidade;
CREATE ROLE instrutor;
CREATE ROLE atendente;
CREATE ROLE aluno;


CREATE USER user_admin WITH PASSWORD 'senha_admin';
GRANT admin TO user_admin;

CREATE USER user_contabilidade WITH PASSWORD 'senha_contabilidade';
GRANT contabilidade TO user_contabilidade;

CREATE USER user_instrutor WITH PASSWORD 'senha_instrutor';
GRANT instrutor TO user_instrutor;

CREATE USER user_atendente WITH PASSWORD 'senha_atendente';
GRANT atendente TO user_atendente;

CREATE USER user_aluno WITH PASSWORD 'senha_aluno';
GRANT aluno TO user_aluno;


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO admin;

GRANT select on  vw_alunos_ativos to contabilidade;
GRANT select on  vw_historico_matriculas to contabilidade;
GRANT select on  vw_receita_mensal to contabilidade;
GRANT select on  vw_recebimentos_por_metodo_pagamento to contabilidade;
GRANT select on  vw_media_valor_pago to contabilidade;
GRANT select on  vw_funcionarios_ativos_por_cargo to contabilidade;


GRANT SELECT, UPDATE ON TABLE treino, treino_aluno, item_treino TO instrutor;

GRANT SELECT, INSERT, UPDATE ON TABLE aluno, matricula TO atendente;

GRANT SELECT ON TABLE treino, treino_aluno, item_treino TO aluno;