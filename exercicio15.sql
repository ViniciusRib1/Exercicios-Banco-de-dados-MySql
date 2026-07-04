-- Nome: Vinicius Ribeiro 
-- RA: 12529938

-- Criando o banco de dados do exerício 15 e usando ele
CREATE DATABASE exer15;
USE exer15;

-- Criando a tabela das pessoas
CREATE TABLE pessoa(
    id INT,
    nome VARCHAR(250),
    data_nascimento DATE,
    quantidade_irmaos INT,
    rua VARCHAR(250),
    numero VARCHAR(10),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    cep VARCHAR(9),
    PRIMARY KEY(id)
);

-- Colocando os 5 registros
INSERT INTO pessoa(id, nome, data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade, cep) 
VALUES(1, 'João', '2000-01-02', 5, 'Rua 1', '25', 'bairro luis', 'Campinas', '10201-102');

INSERT INTO pessoa(id, nome, data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade, cep) 
VALUES(2, 'Felipe', '2002-02-03', 1, 'Rua 2', '100', 'bairro Antonio', 'Jaguariúna', '10231-103');

INSERT INTO pessoa(id, nome, data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade, cep) 
VALUES(3, 'Afonso', '2003-03-02', 2, 'Rua 3', '26', 'bairro luis', 'Amparo', '12345-678');

INSERT INTO pessoa(id, nome, data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade, cep) 
VALUES(4, 'Alex', '2000-01-02', 0, 'Rua 1', '25', 'bairro luis', 'Amparo', '10201-110');

INSERT INTO pessoa(id, nome, data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade, cep) 
VALUES(5, 'Maria', '1999-12-31', 3, 'Rua das Flores', '10', 'Centro', 'Jaguariúna', '13820-000');

-- Exerícios da lista:

-- 1) Buscar todas as informações de todas as pessoas
SELECT * FROM pessoa;

-- 2) Buscar o nome das pessoas que a quantidade de irmãos é maior do que 2
SELECT nome FROM pessoa WHERE quantidade_irmaos > 2;

-- 3) Buscar todas as informações das pessoas que o número é par e a cidade é Jaguariúna
SELECT * FROM pessoa WHERE (numero % 2 = 0) AND cidade = 'Jaguariúna';

-- 4) Buscar rua, número, bairro, cidade e cep da pessoa chamada Afonso
SELECT rua, numero, bairro, cidade, cep FROM pessoas WHERE nome = 'Afonso';

-- 5) Atualizar a pessoa com o id 4 para o bairro ser “Bairro das flores”
UPDATE pessoa SET bairro = 'Bairro das flores' WHERE id = 4;

-- 6) Atualizar a pessoa com o nome Alex para ter 20 irmãos
UPDATE pessoa SET quantidade_irmaos = 20 WHERE nome = 'Alex';

-- 7) Buscar nome e quantidade de irmãos das pessoas que tem mais de 4 irmãos ou moram em Campinas
SELECT nome, quantidade_irmaos FROM pessoa WHERE quantidade_irmaos > 4 OR cidade = 'Campinas';

-- 8) Buscar todas as informações das pessoas que o cep é 12345-678 ou nasceu em 31/12/1999
SELECT * FROM pessoa WHERE cep = '12345-678' OR data_nascimento = '1999-12-31';

-- 9) Apagar a pessoa com o id 3
DELETE FROM pessoa WHERE id = 3;