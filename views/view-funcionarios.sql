-- View: Funcionários ativos por cargo
CREATE OR REPLACE VIEW vw_funcionarios_ativos_por_cargo AS
SELECT
    tipo,
    COUNT(*) AS total
FROM
    funcionario
WHERE
    deleted = FALSE
GROUP BY
    tipo;

-- View: Carga horária dos funcionários
CREATE OR REPLACE VIEW vw_carga_horaria_funcionarios AS
SELECT
    nome,
    tipo,
    turno,
    carga_horaria
FROM
    funcionario
WHERE
    deleted = FALSE
ORDER BY
    tipo, nome;

-- View: Funcionários aniversariantes do mês atual
CREATE OR REPLACE VIEW vw_aniversariantes_mes AS
SELECT
    nome,
    dt_nasc,
    tipo
FROM
    funcionario
WHERE
    deleted = FALSE
    AND EXTRACT(MONTH FROM dt_nasc) = EXTRACT(MONTH FROM CURRENT_DATE)
ORDER BY
    dt_nasc;




-- Funcionários ativos por cargo
SELECT * FROM vw_funcionarios_ativos_por_cargo;

-- Carga horária dos funcionários
SELECT * FROM vw_carga_horaria_funcionarios;

-- Funcionários aniversariantes do mês
SELECT * FROM vw_aniversariantes_mes;
