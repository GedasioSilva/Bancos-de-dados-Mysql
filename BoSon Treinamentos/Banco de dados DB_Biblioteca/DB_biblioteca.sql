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

select * from tbl_livro;

alter table tbl_livro
add Id_autor smallint;

alter table tbl_livro
add constraint fk_Id_autor
foreign key (id_autor)
references tbl_autores (id_autores);

Create table if not exists tbl_Autores(
ID_Autores smallint primary key,
Nome_Autor varchar(50) not null,
SobreNome_autor varchar (60)
)default charset = "utf8";

alter table tbl_autores
add column sexo Enum ("F","M"); 

insert into tbl_autores (id_autores,Nome_autor,SobreNome_autor) values (1,"Isac","Lopes");


create table  if not exists tbl_editoras(
ID_Editora Smallint primary key auto_increment,
Nome_Editora Varchar(50) not null
) default charset = "utf8"; 

select * from tbl_editoras;
insert into tbl_editoras(nome_Editora) values ("Shell");

alter table tbl_livro
add Id_Editora smallint;

alter table tbl_livro
add constraint fk_Id_editora
foreign key (id_editora)
references tbl_editoras(id_editora);
----------------------------- Criar e adicionar chave estrangeira;


create table if not exists tbl_teste_incremento(
codigo smallint primary key auto_increment,
Nome varchar(20) not null
)Auto_increment = 15 , default charset = "utf8";
-- auto incremento pra começa com 15 

select * from tbl_teste_incremento;

drop table tbl_teste_incremento;
insert into tbl_teste_incremento(Nome) values ("Gedasio");

alter table tbl_teste_incremento
drop column nome;

alter table tbl_teste_incremento
add column Nome varchar(60) not null;

alter table tbl_teste_incremento
drop primary key;

alter table tbl_teste_incremento
add column nascimento date;
-- teste incremento -- -- -- -- --------------------------------------

----------------------------------------------------------------------
select * from tbl_livro;
select nome_autor from tbl_autores;

select nome_autor,sobreNome_autor from tbl_autores;
----------------------------------------------------------------------
 select * from tbl_livro
 order by nome_livro ;
 -- consuta os livros na ordem alfabetica dos nomes
 
 select * from tbl_livro
 order by nome_livro desc;
 -- consulta os livros sem esta na ordem alfabetica.
 
 select * from tbl_autores;
 
 select preco_livro from tbl_livro
 order by Preco_Livro desc;
  
  select Nome_Autor , SobreNome_autor from tbl_autores
  order by Nome_Autor desc ;
  
  select nome_livro,id_livro,Preco_Livro from tbl_livro
  where Nome_Livro = "PHP";
  
  select nome_autor from tbl_autores
  where id_autores = 1;
  
  select SobreNome_autor from tbl_autores
  where SobreNome_autor <> 'silva';
  
 select * from tbl_livro
 where id_livro >1 and Id_autor < 3;
 
 select * from tbl_livro
 where id_livro > 2 or id_autor <3;
 
 select * from tbl_livro
 where id_livro > 2 and not Id_autor < 3;
  
  select nome_livro , id_editora from tbl_livro
  where Id_Editora in (1,2);
  -- Comando In serve pra Busca dentro de lista passando os paramentos (1,2);
  
  select ID_Autores,nome_autor from tbl_autores
  where ID_Autores in (3,4,5);
  
  select ID_Autores,sobrenome_autor from tbl_autores
  where Id_autores not in (1,2,3);
  -- comando not in não quero os ids (1,2,3);
  
  select * from tbl_editoras;
  
  select nome_editora,id_editora from tbl_editoras
  where Nome_Editora = ("Nuuvem");
  
  select nome_livro,id_editora from tbl_livro
  where Id_Editora in (
  select Id_Editora 
  from tbl_editoras
  where Nome_Editora = 'Nuuvem'
  );
  
  select * from tbl_teste_incremento;
  
  delete from tbl_teste_incremento where codigo = 3 limit 1;
  
  truncate  table tbl_teste_incremento;
  
  select nome_livro
  as livros
  from tbl_livro;
  -- comando as Pra alterar o nome da coluna quando for consultar;
  
  select id_livro
  as Identidade,Nome_Livro as vulgo 
  from tbl_livro;
  
  select preco_livro as Taporra , data_pub as nascimento 
  from tbl_livro;
 
 select * from tbl_livro;
 
 select count(*) from tbl_autores;
 -- comando count pra consulta quantos registros tem na tabela
 
 select count(*) from tbl_editoras;
 
 select count(Distinct id_autor) from tbl_livro;
 -- count( Distinct id_autor) from tbl_livro é pra saber quantos id_autor tem na tabela livro;
 
select max(preco_livro) from tbl_livro;
-- comando max pega o valor do livro mais caro;
select max(id_livro) from tbl_livro;

select min(id_livro) from tbl_livro;
-- pega o menor valor da consulta 

select min(preco_livro) from tbl_livro;

select avg(preco_livro) from tbl_livro;
-- pega a media dos valores dos livros

select Sum(preco_livro) from tbl_livro;
-- sum soma todos os precos dos livros;

 rename table tbl_teste_incremento to teste_incremento;
 -- comando pra muda o nome das tabelas ;
 
 select * from teste_incremento;
 
 update teste_incremento
 set  nome = "Gedasiio" where codigo = 1;
 -- comando pra alter os registros atualizar o nome na tabela teste incremento;
 
 select * from tbl_livro
 where Data_Pub between '20111213' and '20201121';
 -- comando Between pra consultar entre os intervalos 
 
 select nome_livro as livro,preco_livro as preço from tbl_livro
 where id_autores between 55.33 and 70.66;
 
 select * from tbl_livro;
 
 select  sobreNome_autor as Last_nome from tbl_autores
 where ID_Autores between  1 and 3 ;
 
select Nome_Livro as Nome,Preco_Livro as Preço from tbl_livro
where Nome_Livro like 'J%';
-- comando like pista nome do livro que começe com a letra J

select nome_livro as Nome,preco_livro as preço from tbl_livro
where Nome_Livro not like 'J%';
-- Comando Not Like pesquisa nome do livro que não começe com A Letra J;

select nome_livro as nome , preco_livro as Preço from tbl_livro
where nome_livro like '_A%';
-- livro cujo a segunda letra do nome seja A;

select * from tbl_livro;

select nome_livro from tbl_livro 
where Nome_Livro regexp '^[PC]';
-- Consulta os nomes do livros que começam com P OU C 

select nome_livro from tbl_livro
where nome_livro regexp '^[^JH]';
-- Buscar nomes de livros que não começem com J OU H 

select nome_livro from tbl_livro
Where nome_livro regexp '[pa]$';
-- Nomes de Livros que terminem com P ou A 

select nome_livro from tbl_livro
Where nome_livro regexp '^[JH]|PHP';
-- pesquisar os nomes de livros que começem com J OU H ou PHp

select * from tbl_autores;

alter table tbl_autores
modify column SobreNome_autor varchar(60)
default 'Da Silva';
-- colocando valor padrão no sobre nome autor caso eu não coloque nada

 select * from vendas;
 
 update tbl_autores
 set sexo = "F" where id_autores = 5;

create table if not exists vendas(
id smallint primary key,
nome_vendedor varchar(20),
quantidade int,
produto varchar(20),
cidade varchar(20)
) default charset = "utf8";

insert into vendas(id,nome_vendedor,quantidade,produto,cidade) 
values (19,"Roberto",3145,"Mouse","São Paulo");

select * from vendas;

select id_editora,count(*)
from tbl_livro 
group by Id_Editora;

select cidade ,sum(quantidade) as total
from vendas
group by cidade;

select cidade,count(*) as Total
from vendas
group by cidade;

-- Group by é usado pra fazer consultas em grupo;

select cidade,sum(quantidade) 
from vendas
group by cidade
having sum(quantidade) < 2500;

select cidade,sum(quantidade) as total
from vendas
where produto = 'WebCam'  
group by cidade;

create view vw_LivroAutores
as select tbl_livro.nome_livro as Livro,
tbl_autores.Nome_Autor as Autor
from tbl_livro
inner join tbl_autores
on tbl_livro.Id_autor = tbl_autores.Id_autores;
-- Criando Tabela views consulta tbls livro e autores  

select livro,autor
from vw_livroautores
order by autor;
-- Consultando o Views

select * from tbl_livro
inner join tbl_autores
on tbl_livro.Id_autor = tbl_autores.Id_autor;


 