CREATE OR REPLACE VIEW vw_matriculas_por_plano AS
SELECT 
    p.nome AS plano,
    COUNT(m.id_matricula) AS total_matriculas
FROM 
    matricula m
JOIN 
    plano p ON m.id_plano = p.id_pla
WHERE 
    m.deleted = FALSE
GROUP BY 
    p.nome
ORDER BY 
    total_matriculas DESC;


CREATE OR REPLACE VIEW vw_recebimentos_por_metodo_pagamento AS
SELECT 
    mp.nome AS metodo_pagamento,
    SUM(m.valor_pag) AS total_recebido,
    COUNT(m.id_matricula) AS qtd_matriculas
FROM 
    matricula m
JOIN 
    metodo_pagamento mp ON m.id_met_pag = mp.id_met_pag
WHERE 
    m.deleted = FALSE AND m.status = 'ativo'
GROUP BY 
    mp.nome
ORDER BY 
    total_recebido DESC;



CREATE OR REPLACE VIEW vw_matriculas_por_atendente AS
SELECT 
    f.nome AS atendente,
    COUNT(m.id_matricula) AS total_matriculas
FROM 
    matricula m
JOIN 
    funcionario f ON m.id_atendente = f.id_func
WHERE 
    m.deleted = FALSE
GROUP BY 
    f.nome
ORDER BY 
    total_matriculas DESC;



CREATE OR REPLACE VIEW vw_matriculas_inativas_canceladas AS
SELECT 
    m.id_matricula,
    a.nome AS aluno,
    p.nome AS plano,
    m.status,
    m.dt_matricula
FROM 
    matricula m
JOIN 
    aluno a ON m.id_aluno = a.id_aluno
JOIN 
    plano p ON m.id_plano = p.id_pla
WHERE 
    m.status IN ('inativo', 'cancelado')
    AND m.deleted = FALSE;





-- 1. Matrículas por plano
SELECT * FROM vw_matriculas_por_plano;

-- 2. Recebimentos por método de pagamento
SELECT * FROM vw_recebimentos_por_metodo_pagamento;

-- 3. Matrículas por atendente
SELECT * FROM vw_matriculas_por_atendente;

-- 4. Matrículas canceladas ou inativas
SELECT * FROM vw_matriculas_inativas_canceladas;









