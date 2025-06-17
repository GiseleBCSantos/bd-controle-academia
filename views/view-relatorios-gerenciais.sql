-- View: Receita mensal da academia
CREATE OR REPLACE VIEW vw_receita_mensal AS
SELECT
    TO_CHAR(dt_matricula, 'YYYY-MM') AS mes,
    SUM(valor_pag) AS receita_total
FROM
    matricula
WHERE
    deleted = FALSE
    AND status = 'ativo'
GROUP BY
    TO_CHAR(dt_matricula, 'YYYY-MM')
ORDER BY
    mes;

-- View: Top planos mais vendidos
CREATE OR REPLACE VIEW vw_top_planos_mais_vendidos AS
SELECT
    p.nome AS plano,
    COUNT(m.id_matricula) AS total_vendas
FROM
    matricula m
JOIN
    plano p ON m.id_plano = p.id_pla
WHERE
    m.deleted = FALSE
GROUP BY
    p.nome
ORDER BY
    total_vendas DESC;

-- View: Média de valor pago por matrícula
CREATE OR REPLACE VIEW vw_media_valor_pago AS
SELECT
    ROUND(AVG(valor_pag), 2) AS media_valor_pago
FROM
    matricula
WHERE
    deleted = FALSE
    AND valor_pag IS NOT NULL;




-- Receita mensal da academia
SELECT * FROM vw_receita_mensal;

-- Top planos mais vendidos
SELECT * FROM vw_top_planos_mais_vendidos;

-- Média de valor pago por matrícula
SELECT * FROM vw_media_valor_pago;
