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

select * from tbl_livro;
select nome_autor from tbl_autores;

select nome_autor,sobreNome_autor from tbl_autores;

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
  
  
  
  
  
  
  
  
  
  
  
  



