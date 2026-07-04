-- Criando o db
create database exer20;
use exer20;

-- 1 Criando tabela personagem
create table personagem(
	id int auto_increment,
    nome varchar(45),
    desenho varchar(45),
    especie varchar(45),
    primary key(id)
);

-- 2 Criar 5 personagens (CORRIGIDO)
insert into personagem(id, nome, desenho, especie)
values
	(1, 'Rick', 'Rick and Morty', 'Humano'),
    (2, 'Morty', 'Rick and Morty', 'Humano'),
    (3, 'Satoro Gojo', 'Jujutsu kaisen', 'Humano'),
    (4, 'Sukuna', 'Jujutsu kaisen', 'Maldição'),
    (5, 'Sakura', 'Naruto', 'Humano');

-- 3 Buscar todas informações de todos os personagens
select * from personagem;

-- 4 Alterar a tabela personagem e incluir a coluna ano_desenho 
alter table personagem add column ano_desenho int not null;

-- 5 Alterar a tabela personagem e incluir a coluna sexo 
alter table personagem add column sexo varchar(10) not null;

-- 6 Atualizar os registros para colocar informações nas novas colunas

update personagem set ano_desenho = 2013, sexo = 'M' where id = 1;
update personagem set ano_desenho = 2013, sexo = 'M' where id = 2;
update personagem set ano_desenho = 2018, sexo = 'M' where id = 3;
update personagem set ano_desenho = 2018, sexo = 'M' where id = 4;
update personagem set ano_desenho = 1999, sexo = 'F' where id = 5;

-- 7 Buscar personagens com ano do desenho entre 2000 e 2009 e com a letra "R" no nome
select * from personagem 
where ano_desenho between 2000 and 2009 
and nome like '%R%';

-- 8 Buscar o nome, espécie e desenho de todos os personagens que o sexo é feminino
select nome, especie, desenho from personagem where sexo = 'F';

-- 9 Alterar a tabela personagem e modificar a coluna sexo para ser do tipo varchar(1)
alter table personagem modify column sexo varchar(1);

-- 10 Alterar a tabela personagem e renomear a coluna ano_desenho
alter table personagem rename column ano_desenho to ano_lancamento_desenho;

-- 11 Buscar todas as informações do personagem que o sexo é “m” e o ano é antes de 2000
select * from personagem 
where sexo = 'M' 
and ano_lancamento_desenho < 2000;

-- 12 Alterar a tabela e remover a coluna ano_lancamento_desenho
alter table personagem drop column ano_lancamento_desenho;

-- 13 Criar um novo usuário chamado exercicio20
create user 'exercicio20'@'localhost' identified by 'senha123';

-- 14 Atribuir as permissões de busca e inserção
grant select, insert on exer20.personagem to 'exercicio20'@'localhost';
flush privileges;

-- 15 Comandos a serem rodados logado com o usuário 'exercicio20'

-- Criar um novo personagem
insert into personagem(nome, desenho, especie, sexo) 
values('Superman', 'Liga da Justiça', 'Alienígena', 'M');

-- Buscar o id e nome de todos os personagens que a espécie é alienígena
select id, nome from personagem where especie = 'Alienígena';

-- Atualizar o último personagem criado para o nome ser “Usuário novo”
update personagem set nome = 'Usuário novo' where especie = 'Alienígena';

-- Apagar o último personagem criado
delete from personagem where especie = 'Alienígena';
