SELECT 
    c.codigo_comanda,
    c.data_comanda,
    c.numero_mesa,
    c.nome_cliente,
    SUM(ic.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM comanda c
INNER JOIN item_comanda ic ON c.codigo_comanda = ic.codigo_comanda
INNER JOIN cardapio ca ON ic.codigo_cardapio = ca.codigo_cardapio
GROUP BY c.codigo_comanda, c.data_comanda, c.numero_mesa, c.nome_cliente
ORDER BY c.data_comanda;