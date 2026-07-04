-- Criando o banco de dados do exer17
create database exer17;
use exer17;

-- Criando a tabela adulto
create table adulto(
    id int,
    nome varchar(50),
    data_nascimento DATE,
    sexo varchar(1),
    estado_civil varchar(20),
    primary key(id)
);

-- Criando a tabela bebe
create table bebe(
    id int,
    nome varchar(50),
    id_responsavel int,
    foreign key(id_responsavel) references adulto(id),
    primary key(id)
);

-- 10 adultos
insert into adulto(id, nome, data_nascimento, sexo, estado_civil) 
values
(1, "Roberto", '2000-02-01', "M", "solteiro"),
(2, "Jeferson", "1990-02-01", "M", "casado"),
(3, "Vinicius", "2005-09-07", "M", "solteiro"),
(4, "Maria", "2003-06-01", "F", "casado"),
(5, "Julia", "2001-04-05", "F", "solteiro"),
(6, "Claudia", "1999-02-04", "F", "viuva"),
(7, "Sofia", "2008-07-04", "F", "solteiro"),
(8, "Claudio", "2000-05-04", "M", "casado"),
(9, "Nicolas", "1995-10-02", "M", "casado"),
(10, "Gabriel", "2000-09-20", "M", "casado");

-- 8 Bebês 
insert into bebe(id, nome, id_responsavel) 
values
(1, "Marcos", 4),
(2, "Felipe", 10),
(3, "Bruno", 8),
(4, "Lucas", 9),
(5, "Mateus", 9), 
(6, "Ana", 1),
(7, "Bia", 8),
(8, "Leo", 5);

-- Buscar todos os adultos com o estado civil solteiro
select * from adulto where estado_civil = "solteiro";

-- Buscar todos os adultosusuarios com o sexo F
select * from adulto where sexo = "F";

-- Buscar o nome dos bebês que id e id_adulto são impares
select nome 
from bebe 
where (id % 2 != 0) and (id_responsavel % 2 != 0);

-- Buscar todas as informações dos adultos, que tem bebê, e de seus bebês
select a.*, b.nome as nome_bebe, b.id as id_bebe
from adulto a
inner join bebe b on a.id = b.id_responsavel;

-- Buscar o nome de todos os bebês e o nome do seu adulto
select b.nome as nome_bebe, a.nome as nome_adulto
from bebe b
inner join adulto a on b.id_responsavel = a.id;

-- Buscar o nome e o estado civil de todos os adultos e o nome do bebê se existir
select a.nome as nome_adulto, a.estado_civil, b.nome as nome_bebe
from adulto a
left join bebe b on a.id = b.id_responsavel;
