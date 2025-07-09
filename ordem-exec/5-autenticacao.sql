CREATE ROLE admin;
CREATE ROLE contabilidade;
CREATE ROLE instrutor;
CREATE ROLE atendente;
CREATE ROLE aluno;
CREATE ROLE db_eng;

GRANT SELECT ON vw_meu_perfil_aluno TO aluno;
GRANT SELECT ON vw_meu_treino_atual TO aluno;

GRANT SELECT, INSERT, UPDATE, DELETE ON treino TO instrutor;
GRANT SELECT, INSERT, UPDATE, DELETE ON item_treino TO instrutor;
GRANT SELECT, INSERT, UPDATE, DELETE ON treino_aluno TO instrutor;
GRANT SELECT ON aluno TO instrutor;
GRANT SELECT ON equipamento TO instrutor;
GRANT USAGE, SELECT ON SEQUENCE treino_id_trei_seq TO instrutor;
GRANT USAGE, SELECT ON SEQUENCE item_treino_id_item_treino_seq TO instrutor;
GRANT USAGE, SELECT ON SEQUENCE treino_aluno_id_trei_alu_seq TO instrutor;
GRANT SELECT ON vw_meus_alunos_instrutor TO instrutor;
GRANT SELECT ON vw_disponibilidade_instrutores TO instrutor;

GRANT SELECT, INSERT, UPDATE, DELETE ON aluno TO atendente;
GRANT SELECT, INSERT, UPDATE, DELETE ON matricula TO atendente
GRANT USAGE, SELECT ON SEQUENCE aluno_id_aluno_seq TO atendente;
GRANT USAGE, SELECT ON SEQUENCE matricula_id_matricula_seq TO atendente;
GRANT SELECT ON vw_perfil_aluno_atendimento TO atendente;

GRANT SELECT ON vw_faturamento_mensal TO contabilidade;
GRANT SELECT ON vw_folha_pagamento TO contabilidade;

GRANT SELECT ON vw_snapshot_completo_aluno TO db_eng;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;

GRANT ALL PRIVILEGES ON metodo_pagamento TO admin;
GRANT ALL PRIVILEGES ON plano TO admin;
GRANT ALL PRIVILEGES ON aluno TO admin;
GRANT ALL PRIVILEGES ON funcionario TO admin;
GRANT ALL PRIVILEGES ON instrutor TO admin;
GRANT ALL PRIVILEGES ON atendente TO admin;
GRANT ALL PRIVILEGES ON equipamento TO admin;
GRANT ALL PRIVILEGES ON treino TO admin;
GRANT ALL PRIVILEGES ON item_treino TO admin;
GRANT ALL PRIVILEGES ON treino_aluno TO admin;
GRANT ALL PRIVILEGES ON matricula TO admin;

GRANT ALL PRIVILEGES ON vw_meu_perfil_aluno TO admin;
GRANT ALL PRIVILEGES ON vw_meu_treino_atual TO admin;
GRANT ALL PRIVILEGES ON vw_meus_alunos_instrutor TO admin;
GRANT ALL PRIVILEGES ON vw_disponibilidade_instrutores TO admin;
GRANT ALL PRIVILEGES ON vw_perfil_aluno_atendimento TO admin;
GRANT ALL PRIVILEGES ON vw_faturamento_mensal TO admin;
GRANT ALL PRIVILEGES ON vw_folha_pagamento TO admin;
GRANT ALL PRIVILEGES ON vw_snapshot_completo_aluno TO admin;



CREATE USER pedro_financas WITH PASSWORD 'leao';
GRANT contabilidade TO pedro_financas;

CREATE USER pedro_instrutor WITH PASSWORD 'creatina';
GRANT instrutor TO pedro_instrutor;

CREATE USER pedro_atendente WITH PASSWORD 'como_posso_ajudar?';
GRANT atendente TO pedro_atendente;

CREATE USER pedro_aluno WITH PASSWORD 'trembolona';
GRANT aluno TO pedro_aluno;

CREATE USER pedro_db WITH PASSWORD 'dados'
GRANT db_eng TO pedro_db;
