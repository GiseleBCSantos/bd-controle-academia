CALL atualizar_dinamico('metodo_pagamento', 'taxa_percentual = 2.75', 'id_met_pag = 1');

CALL atualizar_dinamico('equipamento', 'descricao = ''Equipamento para membros inferiores''', 'id_equip = 1');

CALL atualizar_dinamico('atendente', 'salario = 2000.00', 'cpf = ''11111111111''');

CALL atualizar_dinamico('instrutor', 'especialidade = ''Treinamento Funcional''', 'cpf = ''44444444444''');

CALL atualizar_dinamico('plano', 'valor = 109.90', 'id_pla = 1');

CALL atualizar_dinamico('treino', 'objetivo = ''Nova descrição do treino''', 'id_trei = 3');

CALL atualizar_dinamico('item_treino', 'carga = 50', 'id_item_treino = 1');

CALL atualizar_dinamico('aluno', 'telefone = ''11988880000''', 'cpf = ''11111111101''');

CALL atualizar_dinamico('matricula', 'status = ''inativo''', 'id_matricula = 1');

CALL atualizar_dinamico('treino_aluno', 'observacao = ''Atualizado manualmente''', 'id_trei_alu = 5');
