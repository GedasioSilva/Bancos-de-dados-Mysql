create database if not exists db_biblioteca
default charset = "utf8"
default collate utf8_general_ci;


create table if not exists tbl_livro(
Id_livro smallint auto_increment primary key,
Nome_Livro varchar (50) not null,
ISBN varchar(30) not null,
Data_Pub Date not null,
Preco_Livro decimal(7,2) not null
) default charset = "utf8";

Create table if not exists tbl_Autores(
ID_Autores smallint primary key,
Nome_Autor varchar(50) not null,
SobreNome_autor varchar (60)
)default charset = "utf8";

create table  if not exists tbl_editoras(
ID_Editora Smallint primary key auto_increment,
Nome_Editora Varchar(50) not null
) default charset = "utf8"; 



create table if not exists tbl_teste_incremento(
codigo smallint primary key auto_increment,
Nome varchar(20) not null
)Auto_increment = 15 , default charset = "utf8";
-- auto incremento pra começa com 15 

