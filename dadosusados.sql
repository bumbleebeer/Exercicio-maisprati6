INSERT INTO cardapio (nome_cafe, descricao, preco_unitario) VALUES
('Espresso', 'Café espresso tradicional', 5.00),
('Cappuccino', 'Café com leite vaporizado e espuma', 8.00),
('Café com Leite', 'Café coado com leite quente', 6.00),
('Mocha', 'Café com chocolate e chantilly', 10.00),
('Americano', 'Espresso diluído em água quente', 6.50);

INSERT INTO comanda (data_comanda, numero_mesa, nome_cliente) VALUES
('2025-10-28', 5, 'João Silva'),
('2025-10-28', 3, 'Maria Santos'),
('2025-10-27', 8, 'Pedro Oliveira'),
('2025-10-27', 2, 'Ana Costa'),
('2025-10-26', 10, 'Carlos Souza');

INSERT INTO item_comanda (codigo_comanda, codigo_cardapio, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 1, 3),
(3, 4, 2),
(3, 2, 1),
(4, 5, 2),
(5, 1, 1);