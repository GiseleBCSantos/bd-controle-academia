# 🧾 SQL Gym Management — Scripts de Banco de Dados

Este repositório contém os **scripts SQL de criação de tabelas, funções e triggers** para um sistema de gerenciamento de academia (Gym Management System). O foco principal é garantir a **validação automática de dados** durante as operações de inserção e atualização no banco de dados PostgreSQL.

---

## ✅ Funcionalidades

### Banco de Dados

- [x] Criação de tabelas com constraints
- [x] Criação de funções de validação (`PL/pgSQL`)
- [x] Criação de triggers para validação automática (`INSERT`, `UPDATE`)
- [x] Inclusão de campos de auditoria (`criado_por`, `criado_em`, etc.)
- [x] Criar funções para inserção manual de dados (procedures)

### A Fazer

- [ ] Criar funções de atualização e exclusão (UPDATE/DELETE seguras)
- [ ] Criar usuários e roles com permissões restritas
- [ ] Criar views para relatórios e simplificação de consultas
- [ ] Adicionar constraints de integridade referencial entre tabelas
- [ ] Inserir dados de exemplo para testes
- [ ] Script de criação completo e automatizado (`init.sql`)
- [ ] Adicionar documentação SQL inline nos arquivos
- [ ] Implementar logs de auditoria (opcional)

---

## 🛠️ Tecnologias

- **PostgreSQL** 13+
- Linguagem: **PL/pgSQL**

---

## 🧪 Tabelas incluídas

- `aluno`
- `funcionario`
- `equipamento`
- `plano`
- `metodo_pagamento`
- `treino`
- `matricula`

---

## 👩‍💻 Autor(a)

**Gisele Santos**  
Desenvolvedora Full-Stack • Estudante de Análise e Desenvolvimento de Sistemas  
[LinkedIn](https://www.linkedin.com/in/gisele-santos-dev/) <!-- substitua pelo seu link real -->

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.
