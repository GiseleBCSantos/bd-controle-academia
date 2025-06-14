INSERT INTO metodo_pagamento (nome, descricao, taxa_percentual, criado_por)
VALUES 
  ('Cartão de Crédito', 'Pagamento via cartão de crédito (Visa, Master, Elo, etc)', 2.50, 'admin'),
  ('Cartão de Débito', 'Pagamento imediato via cartão de débito', 1.25, 'admin'),
  ('Pix', 'Transferência imediata via chave Pix', 0.00, 'admin'),
  ('Boleto Bancário', 'Pagamento por boleto com vencimento em até 3 dias', 1.90, 'admin'),
  ('Dinheiro', 'Pagamento em espécie direto na academia', 0.00, 'admin');
