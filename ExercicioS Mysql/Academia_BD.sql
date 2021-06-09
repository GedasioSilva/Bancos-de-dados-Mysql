create database if not exists DB_Academia
default charset = utf8
default collate utf8_general_ci;

create table if not exists tbl_Instrutor(
ID_instrutor smallint primary key auto_increment,
RG smallint not null,
Nome varchar(60) not null,
sobre_Nome varchar(60) not null,
Nascimento date not null,
Sexo enum ("F","M") not null
) default charset = "utf8";

create table if not exists Contato_Instru(
Id_Telefone smallint primary key auto_increment,
Email varchar(60) not null,
endereco varchar(60) not null
)default charset = "utf8";

create table if not exists tbl_Aluno(
Cod_Matricula smallint primary key auto_increment,
Data_Matricula Date not null,
Nome_Aluno varchar(60) not null,
Nasci_Aluno varchar(60) not null,
Sexo enum ("F","M") not null,
Altura decimal(3,2) not null,
peso decimal(5,2) not null
)default charset = "utf8";

create table if not exists Contato_Aluno(
ID_tef_Aluno smallint primary key auto_increment,
end_Aluno varchar(60) not null
) default charset = "utf8";

