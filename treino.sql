create database treino;
use treino;

create table clientes(
	id_clientes int auto_increment, 
	nome varchar(100) not null,
	email varchar(100) not null,
	data_cadastro date not null,
    primary key(id_clientes)
);

create table produtos(
	id_produtos int auto_increment,
	nome varchar(100) not null,
	preco decimal,
	estoque int,
    primary key(id_produtos)
);

create table pedidos(
	id int auto_increment,
	foreign key(id_clientes) references clientes(id_clientes), 
	foreign key(id_produtos) references produtos(id_produtos),
	quantidade int,
	data_pedido date,
    primary key(id)
);

insert into clientes(id, nome, email, data_cadastro) values
(1, "João Silva", "joao@email.com", '2026-02-01'),
(2, "Maria Souza", "maria@email.com", '2026-04-10'),
(3, "Pedro Santos", "pedro@email.com", '2024-12-01');

insert into produtos(id, nome, preco, estoque) values
(1, "Notebook", 3500.00, 10),
(2, "Smartphone", 1500.00, 20),
(3, "Fone de Ouvido", 150.00, 50);

insert into pedidos(id, id_clientes, id_produtos, quantidade, data_pedido) values
(1, 1, 1, 1, '2026-10-20'),
(2, 2, 3, 2, '2026-01-03'),
(3, 1, 2, 1, '2025-10-03');

select * from produtos where preco > 500.00;

select * 
from produtos 
inner join clientes on clientes.nome; 

