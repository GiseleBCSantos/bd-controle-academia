CREATE OR REPLACE VIEW vw_ultimas_atualizacoes AS
SELECT 'aluno' AS tabela, id_aluno AS id, COALESCE(atualizado_em, criado_em) AS ultima_modificacao FROM aluno
UNION
SELECT 'funcionario', id_func, COALESCE(atualizado_em, criado_em) FROM funcionario
UNION
SELECT 'equipamento', id_equip, COALESCE(atualizado_em, criado_em) FROM equipamento
UNION
SELECT 'plano', id_pla, COALESCE(atualizado_em, criado_em) FROM plano
UNION
SELECT 'metodo_pagamento', id_met_pag, COALESCE(atualizado_em, criado_em) FROM metodo_pagamento
UNION
SELECT 'treino', id_trei, COALESCE(atualizado_em, criado_em) FROM treino
UNION
SELECT 'item_treino', id_item_treino, COALESCE(atualizado_em, criado_em) FROM item_treino
UNION
SELECT 'treino_aluno', id_trei_alu, COALESCE(atualizado_em, criado_em) FROM treino_aluno
UNION
SELECT 'matricula', id_matricula, COALESCE(atualizado_em, criado_em) FROM matricula;




CREATE OR REPLACE VIEW vw_usuarios_mais_ativos AS
SELECT usuario, SUM(total) AS total_acoes FROM (
    SELECT criado_por AS usuario, COUNT(*) AS total FROM aluno GROUP BY criado_por
    UNION ALL
    SELECT atualizado_por, COUNT(*) FROM aluno WHERE atualizado_por IS NOT NULL GROUP BY atualizado_por

    UNION ALL
    SELECT criado_por, COUNT(*) FROM funcionario GROUP BY criado_por
    UNION ALL
    SELECT atualizado_por, COUNT(*) FROM funcionario WHERE atualizado_por IS NOT NULL GROUP BY atualizado_por

    UNION ALL
    SELECT criado_por, COUNT(*) FROM matricula GROUP BY criado_por
    UNION ALL
    SELECT atualizado_por, COUNT(*) FROM matricula WHERE atualizado_por IS NOT NULL GROUP BY atualizado_por

    -- Repita para outras tabelas conforme necessário
) AS acao_usuario
GROUP BY usuario
ORDER BY total_acoes DESC;





CREATE OR REPLACE VIEW vw_registros_soft_deleted AS
SELECT 'aluno' AS tabela, id_aluno::TEXT AS id, atualizado_em, criado_em FROM aluno WHERE deleted = TRUE
UNION ALL
SELECT 'funcionario', id_func::TEXT, atualizado_em, criado_em FROM funcionario WHERE deleted = TRUE
UNION ALL
SELECT 'matricula', id_matricula::TEXT, atualizado_em, criado_em FROM matricula WHERE deleted = TRUE
UNION ALL
SELECT 'treino', id_trei::TEXT, atualizado_em, criado_em FROM treino WHERE deleted = TRUE
-- Continue com as demais tabelas que possuem soft delete
;





SELECT * FROM vw_ultimas_atualizacoes ORDER BY ultima_modificacao DESC LIMIT 20;
SELECT * FROM vw_usuarios_mais_ativos LIMIT 10;
SELECT * FROM vw_registros_soft_deleted ORDER BY COALESCE(atualizado_em, criado_em) DESC LIMIT 30;





