-- Criando o banco
create database exer21;
use exer21;

-- Criação das tabelas
create table responsavel(
    id int,
    nome varchar(50),
    telefone varchar(45),
    email varchar(100),
    primary key(id)
);

create table cachorro(
    id int,
    nome varchar(50),
    raca varchar(30),
    temperamento varchar(20),
    id_responsavel int,
    foreign key(id_responsavel) references responsavel(id),
    primary key(id)
);

create table agenda(
    id int,
    data date,
    horario time,
    id_cachorro int,
    foreign key(id_cachorro) references cachorro(id),
    primary key(id)
);

-- 1. Recupere as tabelas e os inserts do exercício 18
insert into responsavel(id, nome, telefone, email) values
(1, "Marcos", "(19) 99734-9093", "marcos@gmail.com"),
(2, "Jefferson", "(19) 98543-1012", "jefferson@gmail.com"),
(3, "Vinicius", "(19) 12345-1232", "vinicius@gmail.com");

-- 5 cachorros
insert into cachorro(id, nome, raca, temperamento, id_responsavel) values
(1, "Luquinhas", "Pincher", "Muito bravo", 1),
(2, "Bruninho", "Poodle", "dócil", 3),
(3, "Junior", "Pug", "dócil", 3),
(4, "Roberto", "Pastor alemão", "dócil", 2),
(5, "Godofredo", "Buldogue", "dócil", 2);

-- 10 agendamentos
insert into agenda(id, data, horario, id_cachorro) values
(1, "2026-05-01", "15:30:00", 1),
(2, "2025-03-12", "14:20:00", 2),
(3, "2025-03-12", "13:30:00", 3), 
(4, "2026-05-06", "16:30:00", 2),
(5, "2026-05-10", "14:40:00", 3),
(6, "2026-05-20", "12:30:00", 4),
(7, "2026-05-30", "11:30:00", 4),
(8, "2026-05-08", "10:00:00", 5),
(9, "2026-05-21", "17:30:00", 5),
(10, "2026-05-20", "09:30:00", 1);

-- 2. Adicionar na tabela agenda uma coluna com o valor da consulta
alter table agenda add column valor_consulta float;

-- 3. Inserir algum valor nesta coluna para todos os registros
update agenda set valor_consulta = 20.00 where id in (1, 2, 3, 8, 9);
update agenda set valor_consulta = 30.50 where id in (4, 7);
update agenda set valor_consulta = 40.00 where id in (5, 6, 10);

-- 4. Busque o nome do responsável e a quantidade de cachorros que ele tem. Ordenar
-- pelo nome do responsável em ordem descendente (Z -> A)
select r.nome, count(c.id) as quantidade_cachorros
from responsavel r
left join cachorro c on r.id = c.id_responsavel
group by r.id, r.nome
order by r.nome desc;

-- 5. Busque o nome do responsável, o nome do cachorro e a quantidade de vezes que o
-- cachorro foi atendido. Ordenar pelo nome do cachorro em ordem ascendente (A ->
-- .Z)
select r.nome as nome_responsavel, c.nome as nome_cachorro, count(a.id) as quantidade_atendimentos
from cachorro c
join responsavel r on c.id_responsavel = r.id
left join agenda a on c.id = a.id_cachorro
group by c.id, c.nome, r.nome
order by c.nome asc;

-- 6. Busque o nome do cachorro e o valor total pago em todas as suas consultas
select c.nome, sum(a.valor_consulta) as total_pago
from cachorro c
join agenda a on c.id = a.id_cachorro
group by c.id, c.nome;

-- 7. Busque o nome do responsável e o maior valor pago na consulta de seus cachorros.
--  Ordenar do maior para o menor valor
select r.nome, max(a.valor_consulta) as maior_valor
from responsavel r
join cachorro c on r.id = c.id_responsavel
join agenda a on c.id = a.id_cachorro
group by r.id, r.nome
order by maior_valor desc;