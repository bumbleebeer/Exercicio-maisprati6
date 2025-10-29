# ☕ Sistema de Controle de Vendas - Cafeteria BomGosto

Sistema de banco de dados para gerenciamento de vendas de uma cafeteria, permitindo o controle de comandas, cardápio e itens vendidos.

## 📊 Modelagem do Banco de Dados

### Diagrama de Relacionamento

```
┌─────────────────┐
│    CARDAPIO     │
├─────────────────┤gi
│ codigo_cardapio │ PK
│ nome_cafe       │ UNIQUE
│ descricao       │
│ preco_unitario  │
└─────────────────┘
         │
         │ 1
         │
         │ N
┌─────────────────┐
│  ITEM_COMANDA   │
├─────────────────┤
│ codigo_comanda  │ PK, FK
│ codigo_cardapio │ PK, FK
│ quantidade      │
└─────────────────┘
         │
         │ N
         │
         │ 1
┌─────────────────┐
│     COMANDA     │
├─────────────────┤
│ codigo_comanda  │ PK
│ data_comanda    │
│ numero_mesa     │
│ nome_cliente    │
└─────────────────┘
```

## 🗂️ Estrutura das Tabelas

### Tabela: `cardapio`
Armazena os produtos (cafés) disponíveis para venda.

| Campo            | Tipo           | Descrição                          |
|------------------|----------------|------------------------------------|
| codigo_cardapio  | INT (PK)       | Identificador único do café        |
| nome_cafe        | VARCHAR(100)   | Nome do café (único)               |
| descricao        | TEXT           | Descrição da composição            |
| preco_unitario   | DECIMAL(10,2)  | Preço por unidade                  |

**Restrições:**
- `nome_cafe` deve ser único
- `preco_unitario` não pode ser nulo

---

### Tabela: `comanda`
Registra as comandas dos clientes.

| Campo           | Tipo         | Descrição                          |
|-----------------|--------------|-------------------------------------|
| codigo_comanda  | INT (PK)     | Identificador único da comanda      |
| data_comanda    | DATE         | Data do pedido                      |
| numero_mesa     | INT          | Número da mesa do cliente           |
| nome_cliente    | VARCHAR(100) | Nome do cliente                     |

**Restrições:**
- Todos os campos são obrigatórios

---

### Tabela: `item_comanda`
Relaciona os cafés vendidos em cada comanda.

| Campo           | Tipo     | Descrição                          |
|-----------------|----------|-------------------------------------|
| codigo_comanda  | INT (PK, FK) | Referência à comanda            |
| codigo_cardapio | INT (PK, FK) | Referência ao café do cardápio  |
| quantidade      | INT      | Quantidade do café solicitado       |

**Restrições:**
- Chave primária composta: `(codigo_comanda, codigo_cardapio)`
- Não permite inserir o mesmo café mais de uma vez na mesma comanda
- Todos os campos são obrigatórios

## 🚀 Como Usar

### 1. Criação do Banco de Dados

Execute o script SQL fornecido em seu SGBD (MySQL/MariaDB):

```sql
-- Execute as seções de CREATE TABLE primeiro
-- Em seguida, insira os dados de exemplo (opcional)
```

### 2. Consultas Disponíveis

O sistema oferece 5 consultas principais:

#### 📋 **Consulta 1: Cardápio Completo**
Lista todos os cafés ordenados alfabeticamente.
```sql
SELECT * FROM cardapio ORDER BY nome_cafe;
```

#### 🧾 **Consulta 2: Comandas Detalhadas**
Exibe todas as comandas com seus itens, incluindo:
- Dados da comanda
- Nome e descrição do café
- Quantidade e preços (unitário e total)

#### 💰 **Consulta 3: Valor Total por Comanda**
Lista comandas com o valor total calculado, ordenadas por data.

#### 🔢 **Consulta 4: Comandas com Múltiplos Cafés**
Filtra apenas comandas que possuem mais de um tipo de café diferente.

#### 📈 **Consulta 5: Faturamento Diário**
Calcula o faturamento total agrupado por data.

## 💡 Regras de Negócio

1. ✅ Cada comanda possui um código único
2. ✅ Cada café no cardápio tem nome único
3. ✅ Não é permitido adicionar o mesmo café duas vezes na mesma comanda
4. ✅ A quantidade de cada item deve ser registrada
5. ✅ O preço total é calculado automaticamente (quantidade × preço unitário)

## 📝 Dados de Exemplo

O script inclui dados de exemplo para teste:

- **5 cafés** no cardápio (Café Extraforte, Cappuccino, Café Cortado, Mocha, Americano)
- **5 comandas** de exemplo
- **8 itens** distribuídos nas comandas

## 🔧 Requisitos Técnicos

- **SGBD:** MySQL 5.7+ ou MariaDB 10.2+
- **Encoding:** UTF-8
- **Engine:** InnoDB (recomendado para suporte a transações)



