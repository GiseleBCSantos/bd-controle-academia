-- View: Treinos atribuídos por aluno
CREATE OR REPLACE VIEW vw_treinos_por_aluno AS
SELECT
    a.nome AS aluno,
    t.id_trei AS treino_id,
    t.descricao AS treino_descricao,
    ta.dt_inicio,
    f.nome AS instrutor
FROM 
    treino_aluno ta
JOIN aluno a ON ta.id_aluno = a.id_aluno
JOIN treino t ON t.id_trei = ta.id_trei_alu  -- ajuste conforme sua modelagem
JOIN funcionario f ON ta.id_func = f.id_func
WHERE 
    ta.deleted = FALSE
    AND a.deleted = FALSE
    AND f.deleted = FALSE;

-- View: Equipamentos utilizados por treino
CREATE OR REPLACE VIEW vw_equipamentos_por_treino AS
SELECT
    t.id_trei,
    t.descricao AS treino,
    e.nome AS equipamento,
    it.series,
    it.repeticoes,
    it.carga
FROM 
    item_treino it
JOIN treino t ON it.id_trei = t.id_trei
JOIN equipamento e ON it.id_equip = e.id_equip
WHERE 
    it.deleted = FALSE
    AND t.deleted = FALSE
    AND e.deleted = FALSE;

-- View: Treinos por objetivo
CREATE OR REPLACE VIEW vw_treinos_por_objetivo AS
SELECT 
    objetivo,
    COUNT(id_trei) AS total_treinos
FROM 
    treino
WHERE 
    deleted = FALSE
GROUP BY 
    objetivo
ORDER BY 
    total_treinos DESC;





-- Treinos atribuídos por aluno
SELECT * FROM vw_treinos_por_aluno;

-- Equipamentos utilizados por treino
SELECT * FROM vw_equipamentos_por_treino;

-- Treinos por objetivo
SELECT * FROM vw_treinos_por_objetivo;
