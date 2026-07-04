-- Criando o banco
create database exer18;
use exer18;

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

-- Colocando os responsáveis
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

-- Buscar todos os responsáveis e seus cachorros
select r.nome as Responsavel, c.nome as Cachorro
from responsavel r
inner join cachorro c on r.id = c.id_responsavel;

-- Buscar o nome dos responsáveis que o cachorro tem o temperamento que não é ‘dócil’
select distinct r.nome
from responsavel r
inner join cachorro c on r.id = c.id_responsavel
where c.temperamento <> 'dócil';

-- Buscar todas as datas e horários de agendamento e o nome do cachorro
select a.data, a.horario, c.nome
from agenda a
inner join cachorro c on a.id_cachorro = c.id;

-- Buscar o nome e a raça de todos os cachorros que tem agendamento na data 12/03/2025
select distinct c.nome, c.raca
from cachorro c
inner join agenda a on c.id = a.id_cachorro
where a.data = '2025-03-12';

-- Buscar o nome e o email de todos os responsáveis que o cachorro tem agendamento na data 12/03/2025
select distinct r.nome, r.email
from responsavel r
inner join cachorro c on r.id = c.id_responsavel
inner join agenda a on c.id = a.id_cachorro
where a.data = '2025-03-12';