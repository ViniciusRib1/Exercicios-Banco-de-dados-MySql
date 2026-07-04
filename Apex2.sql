-- Nome: Vinicius Ribeiro RA: 12529938
-- Nome: Nycolas Campos RA: 12530103

-- Criando o banco de dados e usando
CREATE DATABASE apex2;
USE apex2;


-- Criando as tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    `e-mail` VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    situacao_pedido VARCHAR(30) NOT NULL
);

CREATE TABLE Transportadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    site VARCHAR(100)
);

CREATE TABLE Venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_da_venda VARCHAR(100) NOT NULL,
    codigo_de_rastreamento VARCHAR(50) NOT NULL,
    data_de_entrega DATE NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    quantidade_de_vendas INT NOT NULL,
    id_Transportadores INT NOT NULL,
    FOREIGN KEY (id_Transportadores) REFERENCES Transportadores(id)
);

CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    nome_do_fornecedor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    codigo_de_barras VARCHAR(50) NOT NULL UNIQUE,
    tem_fornecedor VARCHAR(5) NOT NULL
);

CREATE TABLE Estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movimentacoes_de_stock VARCHAR(255),
    entradas_de_produtos INT NOT NULL,
    devolucoes INT NOT NULL,
    quantidade_disponivel INT NOT NULL,
    saidas INT NOT NULL,
    ajustes_manuais INT NOT NULL,
    nome_produto VARCHAR(100) NOT NULL
);

CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    endereco_completo VARCHAR(255) NOT NULL,
    `e-mails_contato` VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL,
    tempo_parceria_fornecedor VARCHAR(50) NOT NULL
);

CREATE TABLE `Transportadores / Fornecedor` (
    id_Transportadora INT NOT NULL,
    id_Fornecedor INT NOT NULL,
    PRIMARY KEY (id_Transportadora, id_Fornecedor),
    FOREIGN KEY (id_Transportadora) REFERENCES Transportadores(id),
    FOREIGN KEY (id_Fornecedor) REFERENCES Fornecedor(id)
);


-- 1) INSERIR PELO MENOS 3 REGISTROS EM CADA TABELA

INSERT INTO Clientes (nome, cpf, `e-mail`, telefone, endereco, valor_total, situacao_pedido) VALUES
('Vinicius Ribeiro', '123.456.789-00', 'vinicius@email.com', '(19) 99999-1111', 'Rua das Flores, 123', 1559.90, 'entregue'),
('Lucas Daolio', '987.654.321-11', 'lucas@email.com', '(11) 98888-2222', 'Alameda Santos, 450', 120.00, 'processando'),
('Ana Silva', '444.555.666-77', 'ana@email.com', '(21) 97777-3333', 'Rua Copacabana, 10', 59.90, 'novo');

INSERT INTO Transportadores (nome, cnpj, telefone, site) VALUES
('Sedex Log', '44.444.444/0001-44', '0800-725-0100', 'www.sedex.com.br'),
('Flash Entregas', '55.555.555/0001-55', '(11) 5555-5555', 'www.flashentregas.com'),
('Rápido Sul', '66.666.666/0001-66', '(51) 6666-6666', 'www.rapidosul.com.br');

INSERT INTO Venda (nome_da_venda, codigo_de_rastreamento, data_de_entrega, preco_unitario, quantidade_de_vendas, id_Transportadores) VALUES
('Venda Smartphone', 'BR111AA', '2026-06-04', 1500.00, 1, 1),
('Venda Panela Pressão', 'BR222BB', '2026-06-10', 120.00, 1, 2),
('Venda Camiseta', 'BR333CC', '2026-06-15', 59.90, 1, 1);

INSERT INTO Produto (nome, descricao, nome_do_fornecedor, categoria, preco_unitario, codigo_de_barras, tem_fornecedor) VALUES
('Smartphone X1', 'Celular 128GB', 'Tech Distribuidora', 'Eletrônicos', 1500.00, '7890001', 'Sim'),
('Camiseta Algodão', 'Camiseta preta lisa', 'Estilo Modas', 'Roupas', 59.90, '7890002', 'Sim'),
('Panela de Pressão Própria', 'Fabricação interna', 'Loja 123', 'Utensílios Domésticos', 120.00, '7890003', 'Não');

INSERT INTO Estoque (movimentacoes_de_stock, entradas_de_produtos, devolucoes, quantidade_disponivel, saidas, ajustes_manuais, nome_produto) VALUES
('Entrada inicial de lote', 20, 0, 15, 5, 0, 'Smartphone X1'),
('Venda de balcão regular', 100, 2, 50, 52, 0, 'Camiseta Algodão'),
('Ajuste de inventário anual', 10, 0, 8, 2, 1, 'Panela de Pressão Própria');

INSERT INTO Fornecedor (nome_fornecedor, cnpj, endereco_completo, `e-mails_contato`, data_cadastro, tempo_parceria_fornecedor) VALUES
('Tech Distribuidora', '11.111.111/0001-11', 'Av. Paulista, 1000 - SP', 'contato@tech.com', '2025-01-10', '1 ano'),
('Estilo Modas', '22.222.222/0001-22', 'Rua Augusta, 500 - SP', 'vendas@estilo.com', '2024-05-15', '2 anos'),
('Lar & Utensílios', '33.333.333/0001-33', 'Av. Central, 120 - Campinas', 'comercial@lar.com', '2026-02-20', '4 meses');

INSERT INTO `Transportadores / Fornecedor` (id_Transportadora, id_Fornecedor) VALUES
(1, 1),
(2, 2),
(1, 3);


-- 2) ATUALIZAR PELO MENOS 1 REGISTRO EM 3 TABELAS

UPDATE Clientes 
SET endereco = 'Rua das Flores, 456 - Bloco B' 
WHERE id = 1;

UPDATE Venda 
SET data_de_entrega = '2026-06-05' 
WHERE id = 1;

UPDATE Estoque 
SET quantidade_disponivel = 48 
WHERE id = 2;

-- 3) Busca todas as informações da tabela Produto onde o preço unitário é maior ou igual a 100.00 e menor do que 2000.00
SELECT * FROM Produto 
WHERE preco_unitario >= 100.00 AND preco_unitario < 2000.00;

-- 4) Busca as colunas id, nome_da_venda e preco_unitario da tabela Venda onde o preço unitário está entre 50.00 e 500.00
SELECT id, nome_da_venda, preco_unitario FROM Venda 
WHERE preco_unitario BETWEEN 50.00 AND 500.00;

-- 5) Busca as colunas id, nome, cpf, telefone e situacao_pedido da tabela Clientes onde a situação do pedido está contida no conjunto ('novo', 'processando')
SELECT id, nome, cpf, telefone, situacao_pedido FROM Clientes 
WHERE situacao_pedido IN ('novo', 'processando');

-- 6) Busca todas as informações da tabela Fornecedor cujo nome do fornecedor comece com o termo 'Tech'
SELECT * FROM Fornecedor 
WHERE nome_fornecedor LIKE 'Tech%';

-- 7) Busca todas as informações da tabela Clientes onde a situação do pedido é 'novo' ou 'processando'
SELECT * FROM Clientes 
WHERE situacao_pedido = 'novo' OR situacao_pedido = 'processando';

-- 8) Busca todas as informações da tabela Produto onde a categoria é 'Eletrônicos' e o preço é maior que 1000.00, ou a categoria seja 'Roupas'
SELECT * FROM Produto 
WHERE (categoria = 'Eletrônicos' AND preco_unitario > 1000.00) OR categoria = 'Roupas';

-- 9) Busca o maior valor total de compra registrado na tabela Clientes
SELECT MAX(valor_total) AS maior_valor_total FROM Clientes;

-- 10) Busca a soma total de quantidades de produtos disponíveis somando todo o estoque da empresa
SELECT SUM(quantidade_disponivel) AS total_produtos_estoque FROM Estoque;

-- 11) Busca o nome da venda e o nome do transportador realizando a junção interna entre as tabelas Venda e Transportadores
SELECT V.nome_da_venda, T.nome AS nome_transportadora 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id;

-- 12) Busca o nome de todos os transportadores e seus respectivos vínculos com fornecedores, incluindo transportadores que não possuem vínculo
SELECT T.nome AS nome_transportador, TF.id_Fornecedor 
FROM Transportadores T 
LEFT JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora;

-- 13) Busca o id do fornecedor e o nome do transportador, incluindo fornecedores que não possuem vínculo na tabela intermediária
SELECT TF.id_Fornecedor, T.nome AS nome_transportador 
FROM Transportadores T 
RIGHT JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora;

-- 14) Busca o nome da venda, código de rastreamento e nome do transportador cruzando Venda e Transportadores, filtrando nomes de venda com 'Smartphone' e preço entre 1000 e 2000
SELECT V.nome_da_venda, V.codigo_de_rastreamento, T.nome AS nome_transportador 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id 
WHERE V.nome_da_venda LIKE '%Smartphone%' AND V.preco_unitario BETWEEN 1000.00 AND 2000.00;

-- 15) Busca o nome do transportador e a quantidade de vendas vinculadas a cada um deles no sistema
SELECT T.nome, COUNT(V.id) AS quantidade_vendas 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id 
GROUP BY T.nome;

-- 16) Busca o id da venda, o nome do transportador e o nome do fornecedor vinculados através de 3 tabelas (Venda, Transportadores e Transportadores / Fornecedor)
SELECT V.id AS id_venda, T.nome AS nome_transportador, TF.id_Fornecedor 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id 
INNER JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora;

-- 17) Busca informações cruzadas de 3 tabelas onde o id do fornecedor é igual a 1 ou o preço unitário da venda é menor ou igual a 60.00
SELECT V.id, T.nome, TF.id_Fornecedor 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id 
INNER JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora 
WHERE TF.id_Fornecedor = 1 OR V.preco_unitario <= 60.00;

-- 18) Busca transportadores, seus vínculos e dados dos fornecedores utilizando 1 LEFT JOIN e 2 INNER JOINs filtrando IDs de fornecedores em (1, 2)
SELECT T.nome AS transportador, F.nome_fornecedor 
FROM Transportadores T 
LEFT JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora 
INNER JOIN Fornecedor F ON TF.id_Fornecedor = F.id 
INNER JOIN Venda V ON V.id_Transportadores = T.id 
WHERE F.id IN (1, 2);

-- 19) Busca combinada envolvendo 4 tabelas relacionando a Venda, o Transportador, o Fornecedor e o seu cadastro completo
SELECT V.nome_da_venda, T.nome AS transportadora, F.nome_fornecedor, F.cnpj 
FROM Venda V 
INNER JOIN Transportadores T ON V.id_Transportadores = T.id 
INNER JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora 
INNER JOIN Fornecedor F ON TF.id_Fornecedor = F.id;

-- 20) Combina os nomes de todos os Clientes e de todos os Fornecedores em uma única lista unificada eliminando duplicados através do UNION
SELECT nome AS nome_entidade FROM Clientes 
UNION 
SELECT nome_fornecedor AS nome_entidade FROM Fornecedor;

-- 21) Une o nome de produtos cadastrados com produtos registrados no estoque trazendo registros com preço ou quantidade diferente de 59.90 através do UNION ALL
SELECT nome, preco_unitario FROM Produto 
WHERE preco_unitario <> 59.90 
UNION ALL 
SELECT nome_produto, quantidade_disponivel FROM Estoque 
WHERE quantidade_disponivel <> 59.90;

-- 22) Simula um FULL OUTER JOIN unindo o resultado de um LEFT JOIN com um RIGHT JOIN para listar transportadores e seus fornecedores vinculados
SELECT T.nome AS transportador, TF.id_Fornecedor 
FROM Transportadores T 
LEFT JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora 
UNION 
SELECT T.nome AS transportador, TF.id_Fornecedor 
FROM Transportadores T 
RIGHT JOIN `Transportadores / Fornecedor` TF ON T.id = TF.id_Transportadora;


-- 23) Cria um usuário de aplicação e concede privilégios de CRUD total em 5 tabelas e apenas SELECT (leitura) nas tabelas Venda e Estoque
CREATE USER 'usuario_loja'@'localhost' IDENTIFIED BY 'SenhaSegura123!';

GRANT SELECT, INSERT, UPDATE, DELETE ON apex2.Clientes TO 'usuario_loja'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON apex2.Produto TO 'usuario_loja'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON apex2.Fornecedor TO 'usuario_loja'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON apex2.Transportadores TO 'usuario_loja'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON apex2.`Transportadores / Fornecedor` TO 'usuario_loja'@'localhost';

GRANT SELECT ON apex2.Venda TO 'usuario_loja'@'localhost';
GRANT SELECT ON apex2.Estoque TO 'usuario_loja'@'localhost';

FLUSH PRIVILEGES;

-- 24) Altera a estrutura da tabela Clientes adicionando uma coluna nova para armazenar a data de nascimento do cliente
ALTER TABLE Clientes 
ADD data_nascimento DATE NULL;

-- 25) Exibe a nova estrutura da tabela Clientes refletindo a coluna que foi adicionada no comando anterior
DESCRIBE Clientes;