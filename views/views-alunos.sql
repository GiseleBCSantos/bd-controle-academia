CREATE OR REPLACE VIEW vw_alunos_ativos AS
SELECT 
    a.id_aluno,
    a.nome,
    a.email,
    a.telefone,
    m.dt_matricula,
    p.nome AS nome_plano,
    m.status
FROM 
    aluno a
JOIN 
    matricula m ON m.id_aluno = a.id_aluno
JOIN 
    plano p ON m.id_plano = p.id_pla
WHERE 
    a.deleted = FALSE
    AND m.status = 'ativo'
    AND m.deleted = FALSE;


CREATE OR REPLACE VIEW vw_alunos_por_genero AS
SELECT 
    genero,
    COUNT(*) AS total_alunos
FROM 
    aluno
WHERE 
    deleted = FALSE
GROUP BY 
    genero;


CREATE OR REPLACE VIEW vw_historico_matriculas AS
SELECT 
    a.id_aluno,
    a.nome AS nome_aluno,
    m.id_matricula,
    p.nome AS nome_plano,
    m.dt_matricula,
    m.status,
    mp.nome AS metodo_pagamento,
    m.valor_pag,
    m.deleted
FROM 
    aluno a
JOIN 
    matricula m ON m.id_aluno = a.id_aluno
JOIN 
    plano p ON m.id_plano = p.id_pla
JOIN 
    metodo_pagamento mp ON m.id_met_pag = mp.id_met_pag
ORDER BY 
    a.id_aluno, m.dt_matricula DESC;



select * from aluno


SELECT * FROM vw_alunos_ativos;
SELECT * FROM vw_alunos_por_genero;
SELECT * FROM vw_historico_matriculas;







