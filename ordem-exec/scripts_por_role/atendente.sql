select * from vw_perfil_aluno_atendimento ;


-- inserts possiveis


CALL inserir_dinamico(  'aluno',  'cpf, nome, telefone, email, dt_nasc, genero, endereco',  '''11111111101'', ''Ana Silva'', ''11980010001'', ''ana.silva@email.com'', ''2001-02-15'', ''F'', ''Rua das Flores, 10''');

CALL inserir_dinamico('matricula', 'id_aluno, id_plano, id_met_pag, id_func, status, valor_pag, dt_matricula', '1, 3, 3, 2, ''ativo'', 299.90, ''2025-05-01''');