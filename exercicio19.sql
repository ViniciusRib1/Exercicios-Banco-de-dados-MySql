-- Criando o db
create database exercicio19;
use exercicio19;

-- Criando todas as tabelas
create table feira(
    id int auto_increment,
    bairro varchar(45),
    dia_semana varchar(45),
    horario_inicio time,
    horario_termino time,
    primary key(id)
);

create table categoria(
    id int auto_increment,
    tipo_produto varchar(45),
    tamanho_barraca int,
    primary key(id)
);

create table barraca(
    id int auto_increment,
    nome varchar(45),
    dono varchar(45),
    id_categoria int,
    primary key(id),
    foreign key(id_categoria) references categoria(id)
);

create table feira_barraca(
    id_feira int,
    id_barraca int, 
    posicao_barraca int,
    primary key(id_feira, id_barraca),
    foreign key(id_feira) references feira(id),
    foreign key(id_barraca) references barraca(id)
);

create table funcionario(
    id int auto_increment,
    nome varchar(100),
    sexo varchar(1),
    funcao varchar(45),
    salario decimal(9,2),
    id_barraca int,
    primary key(id),
    foreign key(id_barraca) references barraca(id)
);

-- Colocando os inserts nas tabelas
insert into feira(id, bairro, dia_semana, horario_inicio, horario_termino) values
(1, 'Centro', 'Sábado', '07:00:00', '13:00:00'),
(2, 'Vila Nova', 'Quarta-feira', '06:00:00', '12:00:00');

insert into categoria(id, tipo_produto, tamanho_barraca) values
(1, 'Alimentação', 10),
(2, 'Bebidas', 5),
(3, 'Sem Barraca Cadastrada', 8);

insert into barraca(id, nome, dono, id_categoria) values
(1, 'Barraca da Tapioca', 'João Gabriel', 1),
(2, 'Barraca da Carne', 'Fernando Costa', 1),
(3, 'Barraca do Doce', 'Felipe Almeida', 1),
(4, 'Barraca das Bebidas', 'Silva Alberto', 2);

insert into feira_barraca(id_feira, id_barraca, posicao_barraca) values
(1, 1, 2),
(1, 2, 4),
(1, 3, 6),
(1, 4, 1),
(2, 1, 3),
(2, 2, 5);

insert into funcionario(id, nome, sexo, funcao, salario, id_barraca) values
(1, 'Lucas Silva', 'M', 'Caixa', 1500.00, 1),
(2, 'Mariana Souza', 'F', 'Vendedor', 1600.00, 1),
(3, 'Carlos Eduardo', 'M', 'Ajudante', 1400.00, 2),
(4, 'Ana Beatriz', 'F', 'Vendedor', 1600.00, 2),
(5, 'Mateus Oliveira', 'M', 'Caixa', 1550.00, 3),
(6, 'Julia Silva', 'F', 'Ajudante', 1400.00, 3),
(7, 'Ricardo Santos', 'M', 'Vendedor', 1650.00, 4),
(8, 'Beatriz Costa', 'F', 'Caixa', 1500.00, 4),
(9, 'Pedro Henrique', 'M', 'Ajudante', 1350.00, 1),
(10, 'Fernanda Lima', 'F', 'Gerente', 2500.00, 2);


-- Buscar todas as informações das feiras que acontecem no sábado
select * from feira where dia_semana = 'Sábado';

-- Buscar todas as informações das feiras que acontecem em algum dia que termina com “-feira”
select * from feira where dia_semana like '%-feira';

-- Buscar o bairro da feira, a posição da barraca e o nome da barraca de todas as barracas que a posição da barraca na feira é entre a posição 1 e 5
select f.bairro, fb.posicao_barraca, b.nome 
from feira_barraca fb
join feira f on fb.id_feira = f.id
join barraca b on fb.id_barraca = b.id
where fb.posicao_barraca between 1 and 5;

-- Trazer em uma única coluna o dono das barracas e o nome dos funcionários
select dono as nome_pessoa from barraca
union
select nome from funcionario;


-- Buscar todas as informações do funcionário e o tipo do produto da categoria da barraca que o funcionário trabalha
select func.*, cat.tipo_produto 
from funcionario func
join barraca bar on func.id_barraca = bar.id
join categoria cat on bar.id_categoria = cat.id;

-- Buscar todas as informações de barracas e todas as informações de categoria, inclusive as categorias que não tem barraca associada
select bar.*, cat.* from categoria cat
left join barraca bar on cat.id = bar.id_categoria;

-- Buscar todas as informações dos funcionários que tem no nome o texto “Silva”
select * from funcionario where funcao = 'Caixa' or funcao = 'Vendedor';

select * from funcionario where nome like '%Silva%';