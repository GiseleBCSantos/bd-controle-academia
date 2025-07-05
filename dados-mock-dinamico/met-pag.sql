-- Tabela de metodos de pagamento
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual, criado_por', '''Cartão de Crédito'', ''Pagamento via cartão de crédito (Visa, Master, Elo, etc)'', 2.50, ''admin''');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual, criado_por', '''Cartão de Débito'', ''Pagamento imediato via cartão de débito'', 1.25, ''admin''');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual, criado_por', '''Pix'', ''Transferência imediata via chave Pix'', 0.00, ''admin''');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual, criado_por', '''Boleto Bancário'', ''Pagamento por boleto com vencimento em até 3 dias'', 1.90, ''admin''');
CALL inserir_dinamico('metodo_pagamento', 'nome, descricao, taxa_percentual, criado_por', '''Dinheiro'', ''Pagamento em espécie direto na academia'', 0.00, ''admin''');
