create database biblioteca_db;
use biblioteca_db;  

create table livro_tb(
id_livro int primary key auto_increment,
titulo_livro varchar(255) not null,
autor_livro varchar(255) not null,
ano_publicacao_livro date
) character SET utf8mb4;

create table cliente_tb(
id_cliente int primary key auto_increment ,
nome_cliente varchar(255) not null,
cpf_cliente char(11) unique not null,
data_nasc_cliente date not null,
endereco_cliente varchar(400) not null,
telefone_cliente char(13),
celular_cliente char(14) unique not null,
email_cliente varchar(255) unique not null
) character SET utf8mb4;

create table aluguel_tb(
id_aluguel int primary key auto_increment,
livroAlugadoID int,
clienteID int,
data_retirada_aluguel DATE not null,
data_devolucao_aluguel date not null
) character SET utf8mb4;

alter table aluguel_tb add foreign key (livroAlugadoID) references livros_tb (id_livro);
alter table aluguel_tb add foreign key (clienteID) references cliente_tb (id_cliente);

insert into cliente_tb (nome_cliente, cpf_cliente, data_nasc_cliente, endereco_cliente, telefone_cliente, celular_cliente, email_cliente) values ("Yago Lorenzo das Neves", "27725819428", "2000-03-08", "69918368 Rua Altamira 2 292","6827718457", "68986521507", "yago.lorenzo.dasneves@tanet.com.br" );

select * from cliente_tb;

insert into livros_tb(titulo_livro, autor_livro, ano_publicacao_livro) values ("O programador pragmático", "Andrew Hunt e David Thomas", "2010-01-01" );

select * from livros_tb;