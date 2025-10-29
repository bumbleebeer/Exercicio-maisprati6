SELECT 
    c.codigo_comanda,
    c.data_comanda,
    c.numero_mesa,
    c.nome_cliente,
    ic.codigo_comanda AS cod_comanda_item,
    ca.nome_cafe,
    ca.descricao,
    ic.quantidade,
    ca.preco_unitario,
    (ic.quantidade * ca.preco_unitario) AS preco_total_cafe
FROM comanda c
INNER JOIN item_comanda ic ON c.codigo_comanda = ic.codigo_comanda
INNER JOIN cardapio ca ON ic.codigo_cardapio = ca.codigo_cardapio
ORDER BY c.data_comanda, c.codigo_comanda, ca.nome_cafe;