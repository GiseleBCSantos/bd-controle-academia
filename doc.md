# 📘 Documentação do Sistema de Academia

## 📑 Sumário
- [Visão Geral](#visão-geral)
- [Estrutura do Banco de Dados](#estrutura-do-banco-de-dados)
- [Views](#views)
- [Funções e Triggers](#funções-e-triggers)
- [Procedures](#procedures)
- [Dados Mockados](#dados-mockados)
- [Segurança](#segurança)
- [Fluxo Padrão de Uso](#fluxo-padrão-de-uso)

---

## 🎯 Visão Geral

Sistema de gerenciamento de academia desenvolvido em **PostgreSQL** com foco em:

- Gestão de **alunos e funcionários**
- Controle de **equipamentos**
- Gerenciamento de **treinos**
- **Matrículas** e **pagamentos**
- **Monitoramento** e **auditoria**

---

## 🗃️ Estrutura do Banco de Dados

### 🔑 Tabelas Principais

| Tabela             | Descrição                                  |
|--------------------|--------------------------------------------|
| `aluno`            | Cadastro de alunos                         |
| `funcionario`      | Funcionários (base para herança)           |
| `instrutor`        | Especialização de funcionário              |
| `atendente`        | Especialização de funcionário              |
| `equipamento`      | Cadastro de equipamentos                   |
| `treino`           | Planos de treino                           |
| `matricula`        | Vínculo entre aluno e plano                |
| `metodo_pagamento` | Formas de pagamento                        |
| `plano`            | Planos disponíveis                         |

### 🕵️ Campos de Auditoria

Todas as tabelas incluem:

- `deleted`: Flag para soft delete
- `criado_por` / `criado_em`: Registro de criação
- `atualizado_por` / `atualizado_em`: Registro de atualização

---

## 👓 Views

### 👤 Alunos

- `vw_alunos_ativos`: Alunos com matrícula ativa
- `vw_alunos_por_genero`: Contagem de alunos por gênero
- `vw_historico_matriculas`: Histórico completo de matrículas

### 🏋️‍♂️ Treinos

- `vw_treinos_por_aluno`: Treinos atribuídos a cada aluno
- `vw_equipamentos_por_treino`: Equipamentos usados em cada treino
- `vw_treinos_por_objetivo`: Contagem de treinos por objetivo

### 📊 Relatórios Gerenciais

- `vw_receita_mensal`: Receita total por mês
- `vw_top_planos_mais_vendidos`: Ranking de planos
- `vw_media_valor_pago`: Média de valor das matrículas

### 👥 Funcionários

- `vw_funcionarios_ativos_por_cargo`: Contagem por tipo
- `vw_carga_horaria_funcionarios`: Carga horária de cada funcionário
- `vw_aniversariantes_mes`: Aniversariantes do mês atual

---

## ⚙️ Funções e Triggers

### ✔️ Validações

- `func_valida_aluno()`
- `func_valida_funcionario()`
- `func_valida_equipamento()`
- `func_valida_treino()`
- `func_valida_plano()`
- `func_valida_metodo_pag()`

### 🔐 Proteção de Dados

- `impedir_delete_direto()`: Trigger que impede deletar diretamente os dados

---

## 🔁 Procedures

- `inserir_dinamico()`: Procedure genérica para inserções
- `delete_item_treino()`: Soft delete de item de treino
- `delete_treino_aluno()`: Soft delete de treino do aluno
- `delete_matricula()`: Soft delete de matrícula

---

## 🧪 Dados Mockados

Scripts disponíveis para simulação:

- Equipamentos padrão
- Funcionários de exemplo
- Métodos de pagamento
- Treinos básicos
- Planos disponíveis

---

## 🔒 Segurança

- **Soft delete** implementado em todas as tabelas
- **Triggers** impedem deleção direta
- **Campos de auditoria** rastreiam alterações
- **Validações automáticas** garantem integridade de dados

---

## 🔄 Fluxo Padrão de Uso

1. Cadastro de **funcionários**
2. Cadastro de **equipamentos**
3. Configuração de **planos** e **métodos de pagamento**
4. Cadastro de **alunos**
5. Criação de **matrículas**
6. Definição de **treinos** por aluno

---

