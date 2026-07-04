-- Nome: Vinicius Ribeiro
-- RA: 12529938

CREATE DATABASE exer16;
USE exer16;

CREATE TABLE animal(
    id INT,
    nome VARCHAR(250),
    especie VARCHAR(45),
    raca VARCHAR(45),
    data_nascimento DATE,
    PRIMARY KEY(id)
);

-- Inserindo registros (ajustados para as buscas da lista)
INSERT INTO animal(id, nome, especie, raca, data_nascimento)
VALUES(1, 'Tobby', 'cachorro', 'pincher', '2025-01-02');

INSERT INTO animal(id, nome, especie, raca, data_nascimento)
VALUES(2, 'Pedrinho bacana', 'gato', 'siamês', '2025-09-01');

INSERT INTO animal(id, nome, especie, raca, data_nascimento)
VALUES(3, 'Rex', 'cachorro', 'Pastor Alemão', '2020-01-01');

INSERT INTO animal(id, nome, especie, raca, data_nascimento)
VALUES(4, 'Lola', 'ave', 'calopsita', '2026-04-02');

INSERT INTO animal(id, nome, especie, raca, data_nascimento)
VALUES(5, 'Stuart', 'rato', 'Twister', '2024-05-10');

--- RESOLUÇÃO DOS EXERCÍCIOS ---

-- 1. Buscar todas as informações de todos os animais
SELECT * FROM animal;

-- 2. Buscar o nome e raça de todos os animais da espécie cachorro
SELECT nome, raca FROM animal WHERE especie = 'cachorro';

-- 3. Buscar a data de nascimento dos animais em que a espécie é ave e a raça calopsita
SELECT data_nascimento FROM animal WHERE especie = 'ave' AND raca = 'calopsita';

-- 4. Buscar todas as informações dos animais que se chamam Rex
SELECT * FROM animal WHERE nome = 'Rex';

-- 5. Atualizar o animal chamado Tobby da espécie cachorro para a raça ser SRD
UPDATE animal SET raca = 'SRD' WHERE nome = 'Tobby' AND especie = 'cachorro';

-- 6. Atualizar a data de nascimento do animal com o id 1 para ser 01/01/2020
UPDATE animal SET data_nascimento = '2020-01-01' WHERE id = 1;

-- 7. Buscar nome, espécie e raça de todos os animais da espécie foca ou gato
SELECT nome, especie, raca FROM animal WHERE especie = 'foca' OR especie = 'gato';

-- 8. Buscar todas as informações dos animais nascidos em 01/01/2020 e espécie cachorro 
SELECT * FROM animal 
WHERE (data_nascimento = '2020-01-01' AND especie = 'cachorro') 
OR (nome = 'Stuart' AND especie = 'rato');

-- 9. Apagar o animal com o id 2
DELETE FROM animal WHERE id = 2;