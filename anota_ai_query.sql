create database anota_ai_db;
use anota_ai_db;

create table Usuario_tb(
id_user int primary key auto_increment,
nome_user varchar(255) not null,
email_user varchar(50) unique not null,
data_nasc_user date not null,
senha_user text not null
) character SET utf8mb4;

create table Anotacao_tb(
id_anotacao int primary key auto_increment, -- tipo de criptografia UUID()
titulo_anotacao varchar(50) not null,
data_create datetime,
data_target datetime,
descricao_anotacao text not null,
user_ID int,
foreign key (user_ID) references Usuario_tb(id_user)
) character set utf8mb4;

show tables;
INSERT INTO Usuario_tb (nome_user, email_user, data_nasc_user, senha_user) VALUES
('Elias Leonardo Breno Nascimento', 'elias_nascimento@bemdito.com.br', '1956-01-22', 'elias1956'),
('Anthony da Rocha', 'anthonydoarocha@arosacampinas.com.br', '1998-07-21', 'angel#98');

select * from Usuario_tb;
select * from Anotacao_tb;
insert into Anotacao_tb (titulo_anotacao, data_create, data_target, descricao_anotacao, user_ID) values ("Tarefas do dia", now(), now(), "Limpar a casa, lavar as roupas, cozinhar o almoço", 1), ("consulta no dentista", now(), now() + interval 3 day, "ir no dentista no endereço: rua do dentista, n-23", 2), ("Trabalho da faculdade", now() - interval 2 day, now() + interval 7 day, "desenvolver API rest de um sistema de cadastro", 2);

select id_anotacao as id, 
u.nome_user as 'Usuário',
titulo_anotacao as 'Título',
descricao_anotacao as 'Descrição',
date_format(data_create, '%d/%m/%y às %H:%i') as 'Data de criação', 
date_format(data_target, '%d-%m-%y %H:%i') as 'Data de expiração'
from Anotacao_tb a join Usuario_tb u on a.user_ID = u.id_user ;

