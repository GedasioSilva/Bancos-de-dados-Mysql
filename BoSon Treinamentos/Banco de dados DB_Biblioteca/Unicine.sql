use unicine;
create table if not exists Filme(
nome_filme varchar (60) not null,
cod_filme smallint primary key,
Snopise_filme varchar (120) not null,
Data_estreia date not null,
Data_fim date not null
)default charset = "utf8";

create table if not exists Diretor(
Nome_diretor varchar (80) not null,
cod_diretor smallint primary key,
nasc_diretor date not null,
Sexo enum("M","F") not null
)default charset = "utf8"; 

create table if not exists Ator(
Cod_ator smallint primary key,
Nome_ator varchar (60) not null,
Nas_ator date not null,
Sexo enum("M","F") not null 
)default charset = "utf8";

create table if not exists Sala(
Cod_sala smallint primary key ,
Nome_Sala varchar (60) not null,
qtd_cadeiras smallint not null
)default charset ="utf8";

alter table filme
add cod_diretor smallint;

alter table filme
add cod_ator smallint;

alter table sala
add cod_filme smallint;

alter table filme 
add constraint fk_Cod_diretor
foreign key(cod_diretor)
references diretor (cod_diretor);


alter table filme
add constraint fk_cod_ator
foreign key(cod_ator)
references ator (cod_ator);

alter table sala
add constraint fk_cod_filme
foreign key (cod_filme)
references filme (cod_filme);

create table Funcionario_cinema(
Nome_func varchar(60) not null,
cod_func smallint primary key,
Func_nas date not null,
Sexo_func enum("M","F") not null,
Cargo_func varchar(60),
salario_func decimal(6,2)
)default charset = "utf8";

select * from ator;

select nome_ator as Nomes,Sexo as Genero,nas_ator as Dados 
from ator order by nome_ator desc;

select count(*) from ator;

select nome_ator as Nome from ator 
where nome_ator = "gedasio";

select cod_ator as Codigo, Nome_ator as Nome from ator
where Cod_ator > 1 and Cod_ator < 3;

select cod_ator as Codigo, Nome_ator as Nome from ator
where Cod_ator > 1 and not Cod_ator =  3;

select cod_ator as Codigo, Nome_ator as Nome from ator
where Cod_ator in(4,3); /* só server se tiver nesse intervalo*/

select * from filme;

select count(distinct cod_diretor) from diretor;
select count(distinct cod_diretor) from filme;

select max(cod_diretor) from diretor;
select min(cod_diretor) from diretor;

show  tables;
rename table salla to Sala; /* Alterar o nome da tabela*/

select * from filme;

update  filme
set Nota_IMB = 9 where cod_filme = 3;

update  filme
set Nota_IMB = 8.8 where cod_filme = 4;

update  filme
set Nota_IMB = 8 where cod_filme = 1;

update  filme
set snopise_filme = " Patrick Bateman tem uma segunda vida como um horrível assassino em série durante a noite." where cod_filme = 4;

select snopise_filme from filme where cod_filme = 4;

select data_estreia As Estreia, nome_filme as Nome from filme
where Data_estreia between '2001-01-01' and '2007-12-01';

select cod_ator from ator where Cod_ator
between 3 and 5;

select nome_ator as Nome from ator
where Nome_ator like 'M%'; /* Procure na tabela ator nome de ator que começe com G e não importa o resto*/

select nome_filme as Filme from filme 
where nome_filme like 'P%';

select nome_filme as Filme from filme 
where nome_filme NOT like 'l%'; /* Nome de filme Que não começe com a letra L*/

select nome_ator as Filme from ator 
where nome_ator NOT like 'l%'; 

select nome_ator as Nome from ator 
where nome_ator  like '__d%'; /* 3 letra do nome tem um D*/

select Nome_ator from ator
where Nome_ator regexp '^[GM]';
-- Nomes que comecem com G ou M

select Nome_ator from ator
where Nome_ator regexp '^[^GM]'; -- não começe com G ou M

alter table ator
modify column TELL smallint
default '00';
-- valor padrão caso nenhum dado for inserido

select Cod_ator,count(*) from filme group by nome_filme;

alter table filme
add column Bilheteria smallint;

update filme 
set Bilheteria = 263
where cod_filme = 3;

select bilheteria,count(*)
from filme
group by cod_filme;

select * from filme;

create view FilmesAtor
as select filme.nome_filme as Filme,
ator.Nome_ator as Ator
from filme
inner join ator 
on filme.cod_ator = ator.Cod_ator;
-- Criando uma view que vai chamar na table filme o cod do ator e nome do ator 

select filme,ator from FilmesAtor order by ator; -- chamando minha view 

create view FilmeDiretor
as select filme.nome_filme as Filme,
diretor.nome_diretor as Diretor
from filme
inner join diretor
on filme.cod_diretor = diretor.cod_diretor;

select filme,diretor 
from 
filmediretor order by diretor;

select * from filme
inner join diretor
on filme.cod_diretor = diretor.cod_diretor;
-- chama todos os dados das duas tabelas 

select * from filme
inner join ator
on filme.Cod_ator = ator.Cod_ator;


select * from filme 
inner join funcionario
on filme.cod_filme = funcionario.cod_func;
-- traz os dados das duas tabelas mesmo não tendo conecxao;

select nome_filme,bilheteria from filme
where Bilheteria is null;

select nome_filme,Nota_IMB from filme
where Nota_IMB is null;
-- traz na tabela filme o campo nota_imb que estão vazios e o nome do filme

select bilheteria , nome_filme from filme
inner join diretor
on filme.cod_filme = diretor.cod_diretor;

select * from filme
right join diretor
on filme.cod_diretor=diretor.cod_diretor;
-- pegar o diretor tendo filme publicado ou não


select * from tbl_livro as li
right join tbl_editoras as ed
ON Li.ID_Editora = ed.ID_Editora;
-- vai pega a editora que tenha id na tabela livro tendo livro publicado ou não 

select concat('Camila','silva') as 'Meu Nome completo';
select concat(nome_diretor , '  ',nasc_diretor) as ' Dados  do  Diretor' from diretor;

select concat(' O melhor Filme foi ' ,  nome_filme) as Filmes 
from filme where cod_filme = 1;

select nome_filme,bilheteria * 3 as 'Bilheteria dos filmes'
from filme where cod_filme = 1;

select bilheteria , ceiling(bilheteria/2) as 'Bilheteria do Filme dividida por 2 ' from filme;

select ceiling(10 / 3);
select 10 mod 3;
select CEILING(sqrt(3));

/* Funções matematicas
CEILING() ARREDONDA PRA CIMA
FLOOR() ARREDONDA PRA BAIXO
PI() RETORNA O VALOR DE PI
POW(X,Y) RETORNA X ELEVADO A Y
SQRT()  RETORNA A RAIZ QUADRADA
SIN() RETORNA O SENO DE UM NÚMERO DADO EM RADIANOS
HEX() Retorna a representação hexadecimal de um valor decimal 

*/
	CREATE FUNCTION fn_teste ( valorA DECIMAL(10,2), ValorB INT) RETURNS INT
    RETURN valorA * valorB;
    
    SELECT fn_teste(2.5,4) AS Resultado;


-- Functions exercitando 













-- Functions 

