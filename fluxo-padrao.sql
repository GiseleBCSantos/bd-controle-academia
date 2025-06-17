SELECT * FROM aluno;

SELECT public.add_aluno(
  'João TYESTE',   -- p_nome
  '123456789',    -- p_telefone
  'joao@email.com', -- p_email
  '2010-05-20',   -- p_dt_nasc
  'M',            -- p_genero
  '2025-06-17',   -- p_dt_cadastro (vazio usa timestamp atual)
  'Rua ABC, 123'  -- p_endereco
);


SELECT * FROM funcionario order by id_func;

SELECT add_funcionario(
    'Ana Beatriz',         -- p_nome
    '11988887777',         -- p_telefone
    'ana.b@email.com',     -- p_email
    'Rua Central, 456',    -- p_endereco
    '1990-08-15',          -- p_dt_nasc
    '2022-01-10',          -- p_dt_admissao
    'Manhã',               -- p_turno
    40,                    -- p_carga_horaria
    3500.75,               -- p_salario
    'A'                    -- p_tipo (ex: 'A' de administrativo, ou outro código usado)
);


SELECT * from equipamento e 

SELECT add_equipamento(
    'Bicicleta Ergométrica',
    'Equipamento de cardio para academia',
    '2023-10-05',
    16
);


select * from plano p 

SELECT add_plano(
    'Plano Mensal',
    'Acesso ilimitado à academia por 30 dias',
    1,
    99.90
);


select * from metodo_pagamento mp 

SELECT add_metodo_pagamento(
    'amante do dono',
    'Pagamento com cartão de crédito Visa/Master',
    2.99
);


select * from treino t 

SELECT add_treino(
    'Treino de Força e Hipertrofia',
    'Aumentar massa muscular e resistência',
    3
);


