create database if not exists db_escolar 
default charset = "utf8"
default collate utf8_general_ci;

use db_escolar;
/* -- criação de tabelas 


create table if not exists tbl_Sala(
id_sala smallint primary key not null,
qtdaluno smallint not null
) default charset = "utf8";

create table if not exists tbl_Aluno(
Id_aluno smallint primary key not null auto_increment,
Nome_aluno varchar (55) not null,
Sexo_aluno enum('M','F'),
data_nasc date not null
) default charset = "utf8";

create table if not exists tbl_professor(
id_prof smallint primary key auto_increment,
nome_prof varchar (55) not null,
sexo_prof enum('M','F'),
data_nasc date not null,
Mat_prof varchar (55) not null
) default charset = "utf8";
*/

/* -- adicionar chaves estrangeiras 
alter table tbl_sala
add constraint fk_id_prof 
foreign key (id_prof)
references tbl_professor (id_prof);

alter table tbl_sala
add id_prof smallint not null;

alter table tbl_sala 
add column id_aluno smallint not null;

alter table tbl_sala
add constraint fk_id_aluno
foreign key (id_aluno)
references tbl_aluno (id_aluno);

*/

/* -- Comando insert into 
insert into tbl_professor (nome_prof,sexo_prof,data_nasc,mat_prof)
values ("Camila Silva","F",19911217,"hISTORIA");

select * from tbl_professor;

insert into tbl_professor (nome_prof,sexo_prof,data_nasc,mat_prof)
values ("Camila Silva","F","19911217","Português");

insert into tbl_professor (id_prof,nome_prof,sexo_prof,data_nasc,mat_prof)
values (1,"Camila Silva","F","19911217","Português");

insert into tbl_aluno (nome_aluno,sexo_aluno,data_nasc)
values ("Gedasio","M",19951217);

insert intO tbl_aluno (nome_aluno,sexo_aluno,data_nasc)
values ("Isac","M",19990830);


insert into tbl_sala (id_sala,qtdaluno,id_prof,id_aluno) values (15,45,1,1);

*/

/* -- consulta simples
select nome_aluno from tbl_aluno;

select id_sala , qtdaluno from tbl_sala;

select id_prof,nome_prof from tbl_professor 
where id_prof > 1;

select * from  tbl_SALA;


select nome_prof , sexo_prof from tbl_professor;

*/
/*-- Consultas com ordem By-- começo 

select nome_prof , id_prof from tbl_professor 
order by nome_prof;

select Mat_prof from tbl_professor
order by Mat_prof;

select id_sala, qtdaluno from tbl_sala
order by id_sala ;

select id_prof , id_aluno from tbl_sala
order by id_prof;

select id_aluno,sexo_aluno , nome_aluno from tbl_aluno
order by id_aluno;

-- fim consulta com order by 
*/ 

/* -- começo consultas com where e 
select id_prof , id_aluno from tbl_sala
where id_sala = 9 ;

select id_prof ,id_sala from tbl_sala
where id_aluno <> 4;

select id_aluno,id_sala from tbl_sala
where id_aluno > 1 and  5;


select * from tbl_professor;

select id_prof,nome_prof from tbl_professor
where id_prof = 1;

select nome_prof from tbl_professor
where nome_prof <> 'Camila Silva';

select id_prof from tbl_professor
where id_prof >= 1;

select id_prof from tbl_professor
where id_prof > 1 and id_prof < 4;

select id_prof from tbl_professor 
where id_prof > 1 or id_prof < 5;

select id_prof from tbl_professor 
where id_prof > 1 and not id_prof < 5;

select nome_prof , id_prof from tbl_professor
where id_prof in (2,3,4,5);

select id_prof , id_aluno from tbl_sala
where id_sala in (1,9);

select id_prof , id_aluno from tbl_sala
where id_sala not in (1,9);

 select id_prof from tbl_professor
 where id_prof not in (1,3);

select id_prof , id_aluno from tbl_sala
where id_sala 
*/
 
select qtdaluno
as qtAluno
from tbl_sala;

select sexo_aluno
as sex_Aluno
from tbl_aluno;





  
 
 
  