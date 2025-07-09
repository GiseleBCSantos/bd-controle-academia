select * from vw_meus_alunos_instrutor where nome_instrutor ilike 'Diego%'
select * from vw_meus_alunos_instrutor where id_instrutor = 4

select * from vw_disponibilidade_instrutores


-- inserts possiveis

CALL inserir_dinamico('treino', 'descricao, objetivo, duracao_meses', '''Treino Personalizado'', ''Treino personalizado para testes'', 0');

CALL inserir_dinamico('item_treino', 'series, repeticoes, carga, id_trei, id_equip', '2, 15, 40, 7, 3');

call inserir_dinamico('treino_aluno', 'observacao, id_func, id_aluno, id_trei', '''Treino personalizado pra aluno fulano'', 4, 5, 7')

