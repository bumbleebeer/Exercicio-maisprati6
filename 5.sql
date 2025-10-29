SELECT 
    c.data_comanda,
    SUM(ic.quantidade * ca.preco_unitario) AS faturamento_total
FROM comanda c
INNER JOIN item_comanda ic ON c.codigo_comanda = ic.codigo_comanda
INNER JOIN cardapio ca ON ic.codigo_cardapio = ca.codigo_cardapio
GROUP BY c.data_comanda
ORDER BY c.data_comanda;