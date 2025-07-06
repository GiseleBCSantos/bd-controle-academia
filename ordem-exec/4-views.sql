-- Para alunos
CREATE OR REPLACE VIEW vw_meu_perfil_aluno AS
SELECT
    a.id_aluno,
    a.nome AS nome_aluno,
    a.email,
    a.dt_nasc,
    m.status AS status_matricula,
    p.nome AS nome_plano,
    p.descricao AS descricao_plano,
    m.dt_matricula,
    (m.dt_matricula + (p.duracao_meses || ' months')::interval) AS data_proxima_renovacao
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN plano p ON m.id_plano = p.id_pla
WHERE a.deleted = FALSE AND m.status = 'ativo';


SELECT * FROM vw_meu_perfil_aluno WHERE id_aluno = 19




CREATE OR REPLACE VIEW vw_meu_treino_atual AS
SELECT
    ta.id_aluno,
    t.descricao AS nome_do_treino,
    f.nome AS nome_instrutor,
    e.nome AS nome_exercicio_equipamento,
    it.series,
    it.repeticoes,
    it.carga
FROM treino_aluno ta
JOIN item_treino it ON ta.id_trei = it.id_trei
JOIN equipamento e ON it.id_equip = e.id_equip
JOIN treino t ON ta.id_trei = t.id_trei
JOIN funcionario f ON ta.id_func = f.id_func
WHERE ta.deleted = FALSE AND it.deleted = FALSE;


SELECT * FROM vw_meu_treino_atual WHERE id_aluno = 16





-- Para instrutores
CREATE OR REPLACE VIEW vw_meus_alunos_instrutor AS
SELECT
    ta.id_func AS id_instrutor,
    a.id_aluno,
    a.nome AS nome_aluno,
    a.telefone AS contato_aluno,
    t.descricao AS treino_atual,
    ta.observacao AS observacoes_treino
FROM treino_aluno ta
JOIN aluno a ON ta.id_aluno = a.id_aluno
LEFT JOIN treino t ON ta.id_trei = t.id_trei
WHERE a.deleted = FALSE AND ta.deleted = FALSE;

SELECT * FROM vw_meus_alunos_instrutor WHERE id_instrutor = 9


CREATE OR REPLACE VIEW vw_disponibilidade_instrutores AS
SELECT
    f.nome,
    i.especialidade,
    i.qntd_alunos AS capacidade_maxima,
    COUNT(ta.id_trei_alu) AS alunos_atuais,
    i.qntd_alunos - COUNT(ta.id_trei_alu) AS vagas_disponiveis
FROM instrutor i
JOIN funcionario f ON i.id_func = f.id_func
LEFT JOIN treino_aluno ta ON i.id_func = ta.id_func AND ta.deleted = FALSE
WHERE f.deleted = FALSE
GROUP BY f.nome, i.especialidade, i.qntd_alunos;

SELECT * FROM vw_disponibilidade_instrutores ORDER BY vagas_disponiveis DESC




-- Para atendente
CREATE OR REPLACE VIEW vw_perfil_aluno_atendimento AS
SELECT
    a.id_aluno,
    a.cpf,
    a.nome AS nome_aluno,
    a.telefone,
    m.status AS status_matricula,
    p.nome AS nome_plano,
    atd.nome as atendente_matricula,
    m.dt_matricula,
    (m.dt_matricula + (p.duracao_meses || ' months')::interval) AS data_proxima_renovacao
FROM aluno a
LEFT JOIN matricula m ON a.id_aluno = m.id_aluno
LEFT JOIN plano p ON m.id_plano = p.id_pla
LEFT JOIN funcionario atd on m.id_func = atd.id_func
WHERE a.deleted = FALSE;

SELECT * FROM vw_perfil_aluno_atendimento WHERE nome_aluno ILIKE '%souza%'



-- Para contador
CREATE OR REPLACE VIEW vw_faturamento_mensal AS
SELECT
    TO_CHAR(dt_matricula, 'YYYY-MM') AS ano_mes,
    SUM(valor_pag) AS faturamento_total,
    COUNT(*) AS total_de_pagamentos
FROM matricula
WHERE status = 'ativo' AND deleted = FALSE
GROUP BY TO_CHAR(dt_matricula, 'YYYY-MM')
ORDER BY ano_mes DESC;

SELECT * FROM vw_faturamento_mensal

CREATE OR REPLACE VIEW vw_folha_pagamento AS
SELECT
    f.id_func,
    f.nome,
    f.cpf,
    CASE
        WHEN f.tipo = 'I' THEN 'Instrutor'
        WHEN f.tipo = 'A' THEN 'Atendente'
        ELSE 'Não Definido'
    END AS cargo,
    i.especialidade,
    f.dt_admissao,
    f.salario AS salario_bruto
FROM
    funcionario f
LEFT JOIN
    instrutor i ON f.id_func = i.id_func
WHERE
    f.deleted = FALSE
ORDER BY
    f.id_func;

SELECT * FROM vw_folha_pagamento;





-- Para Data Engineer

CREATE OR REPLACE VIEW vw_snapshot_completo_aluno AS
SELECT
    a.id_aluno,
    a.nome AS nome_aluno,
    a.genero,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, a.dt_nasc)) AS idade_atual,
    m.id_matricula,
    m.status AS status_matricula,
    p.nome AS nome_plano,
    p.valor AS valor_plano,
    mp.nome AS metodo_pagamento,
    t.descricao AS treino_designado,
    f.nome AS instrutor_responsavel
FROM aluno a
LEFT JOIN matricula m ON a.id_aluno = m.id_aluno
LEFT JOIN plano p ON m.id_plano = p.id_pla
LEFT JOIN metodo_pagamento mp ON m.id_met_pag = mp.id_met_pag
LEFT JOIN treino_aluno ta ON a.id_aluno = ta.id_aluno
LEFT JOIN treino t ON ta.id_trei = t.id_trei
LEFT JOIN funcionario f ON ta.id_func = f.id_func
WHERE a.deleted = FALSE;

SELECT * FROM vw_snapshot_completo_aluno;
SELECT nome_plano, COUNT(*) FROM vw_snapshot_completo_aluno GROUP BY nome_plano;