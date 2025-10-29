CREATE TABLE cardapio (
    codigo_cardapio INT PRIMARY KEY AUTO_INCREMENT,
    nome_cafe VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL
);


CREATE TABLE comanda (
    codigo_comanda INT PRIMARY KEY AUTO_INCREMENT,
    data_comanda DATE NOT NULL,
    numero_mesa INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL
);


CREATE TABLE item_comanda (
    codigo_comanda INT NOT NULL,
    codigo_cardapio INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (codigo_comanda, codigo_cardapio),
    FOREIGN KEY (codigo_comanda) REFERENCES comanda(codigo_comanda),
    FOREIGN KEY (codigo_cardapio) REFERENCES cardapio(codigo_cardapio)
);

