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
  -------------------------------
  
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

-- ////////////////////////////////////////////////////////////////////////////////

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
on tbl_livro.Id_autor = tbl_autores.ID_Autores;
-- se algums livros não forem publicado eles não aparecem 


select * from tbl_autores
left join tbl_livro
on tbl_livro.Id_autor = tbl_autores.ID_Autores;
-- consulta todos os dados de autores mesmo que não tenha conecxao com tbl_livro

select * from tbl_autores
left join tbl_livro
on tbl_livro.Id_autor = tbl_autores.ID_Autores
where tbl_livro.Id_autor is null;
-- consulta nas tabela autores onde os autores não tem id na tabela livro

select * from tbl_livro as li
right join tbl_editoras as ed
ON Li.ID_Editora = ed.ID_Editora;
-- vai pega a editora que tenha id na tabela livro tendo livro publicado ou não 

select concat('Gedasio' , 'Da Silva') as 'Meu Nome'; -- concatenando Stringues 

select concat(nome_autor, ' ', sobreNome_autor) as 'Nome Autor Completo' from tbl_autores; -- concatenando os nomes dos autores 

select concat('Eu gosto do Livro', nome_livro)
from tbl_livro where Id_autor = 1;

select nome_livro,preco_livro * 5 as 'Preço de 5 Livros'
from tbl_livro where id_livro = 1;

select nome_livro,preco_livro * 5 as 'Preço de 5 Livros'
from tbl_Livro;

select nome_livro , CEILING(preco_livro / 2)  as 'Preço com 50% de desconto ' from tbl_livro;

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

/*Função Não funcionou
SELECT NOME_LIVRO, fn_teste(preco_livro,6) AS 'Preço de 6 Unidade'
FROM tbl_livro
WHERE Id_livro = 2;

drop function fn_teste;

*/

/*Stored Procedures

-- Criando Procedimento:
create procedure varPreço (VarLivro smallint)
select concat('O Preço e ' , preco_livro) as preço 
from tbl_livro
where Id_livro = varLivro;

-- invocando O Procedimento;
call varPreço(3);

-- Excluindo Procedimento;
drop procedure varPreço;

*/

-- Estudar função pq aqui esta dando Errado

/* Stored Procedures com Begin e  end

DELIMITER //
CREATE PROCEDURE VerPreço (VarLivro smallint)
BEGIN
	Select concat('O preço  ' , preco_livro) as preço
	from tbl_livro
	where id_livro = VarLivro;
	select 'Procedimento Executado com sucesso!';
END//
DELIMITER ;

call VerPreço(3); -- o id do livro

*/

-- PELO NOME DA EDITORA PEGAR O NOME DO LIVRO SEM EDITAR NO ARMAZENAMENTO

/*
DELIMITER //
create procedure editora_livro (IN editora VARCHAR(50))
BEGIN
	select L.nome_livro , E.nome_Editora
    from tbl_livro as L
    Inner join tbl_editoras As E
    on L.ID_Editora = E.ID_Editora
    where E.Nome_Editora = editora;
END//
DELIMITER ;

CALL editora_livro('shell');

SET @minhaeditora = 'shell'; -- aperta as duas linhas pra criar depois só a segunda pra exercutar
CALL editora_livro(@minhaeditora);

*/

 -- outro procedimento
 
 /* 
  DELIMITER // 
 create procedure aumenta_preco(IN codigo INT,taxa Decimal(10,2))
 BEGIN 
	update tbl_livro
    set preco_livro = tbl_livro.Preco_Livro + tbl_livro.Preco_Livro * taxa /100
    where id_livro = codigo;
 END//
 DELIMITER 
 
SET @livro = 4; -- ID ONDE O PREÇO VAI SUBIR
SET @aumento = 20; -- O QUANTO VAI AUMENTAR 
CALL aumenta_preco(@livro, @aumento); -- DEPOIS CLICA AQUI PRA CONSULTAR

select * from tbl_livro where Id_livro = '4';
 */

/*
DELIMITER //
CREATE procedure teste_out (IN id Int, out livro varchar(50))
BEGIN 
	select nome_livro
    into livro
    from tbl_livro
    where id_livro = id;
END //
DELIMITER ;

CALL teste_out(3,@livro);
select @livro;

select * from tbl_livro where Id_livro = '3';
*/

/*
DELIMITER //
CREATE PROCEDURE aumento (INOUT valor Decimal(10,2) , taxa decimal (10,2))
Begin
	set valor = valor + valor * taxa/100;
END//
DELIMITER ;
    
set @valorinicial = 20.00;
select @valorinicial;

CALL aumento(@valorinicial , 15.00);
*/

/*-- Não ta dando certo Procedure 
DELIMITER //
CREATE FUNCTION calcula_desconto(livro int, desconto Decimal(10,2))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE preco DECIMAL(10,2);
    SELECT preco_livro FROM tbl_livro
    WHERE Id_livro = livro INTO preco;
    RETURN preco - desconto;
END//
DELIMITER ;

SELECT * FROM tbl_livro where id_livro = 4;    
select calcula_desconto(4,10.00);
-- -------------------------------------------------------
*/

/*Comando if Não pegou
DELIMITER //
CREATE FUNCTION calcula_imposto(salario DEC(8,2))
returns DEC(8.2)
BEGIN 
	DECLARE valor_imposto DEC(8,2);
		IF salario < 1000.00 THEN
		SET valor_imposto = 0.00;
    ELSEIF salario < 2000.00 THEN
		SET valor_imposto = salario * 0.15;
    ELSEIF salario < 3000.00 THEN
		SET valor_imposto = salario * 0.22;
    ELSE 
		SET valor_imposto = salario * 0.27;
	END IF;
    RETURN valor_imposto;
END//
DELIMITER ;   

select calcula_imposto (850.00);
*/

/* Comando Case não pegou 
DELIMITER //
CREATE FUNCTION CALCULAR_IMPOSTO_CASE(SALARIO DEC(8,2))
RETURNS DEC(8,2)
BEGIN 
	DECLARE VALOR_IMPOSTO DEC(8,2);
    CASE
	WHEN SALARIO < 1000.00 THEN
		SET VALOR_IMPOSTO = 0.00;
    WHEN SALARIO < 2000.00 THEN
		SET VALOR_IMPOSTO = SALARIO * 0.15;
    WHEN SALARIO < 3000.00 THEN
		SET VALOR_IMPOSTO = SALARIO * 0.22;
    ELSE 
		SET VALOR_IMPOSTO = SALARIO * 0.27;
	END CASE;
    RETURN VALOR_IMPOSTO;
END//
DELIMITER ;   

select calcula_imposto (850.00);
*/

/* LOOP 
DELIMITER //
CREATE PROCEDURE ACUMULA(LIMITE INT)
BEGIN
	DECLARE CONTADOR INT DEFAULT 0;
    DECLARE SOMA INT DEFAULT 0;
    LOOP_TESTE: LOOP
		SET CONTADOR = CONTADOR + 1;
        SET SOMA = SOMA + CONTADOR;
        IF CONTADOR >= LIMITE THEN 
			LEAVE LOOP_TESTE;
        END IF;
    END LOOP LOOP_TESTE;
    SELECT SOMA;
END//
DELIMITER ;
 
call ACUMULA(3);

*/

/* REPEAT
DELIMITER //
CREATE PROCEDURE ACUMULA_REPITA (LIMITE TINYINT UNSIGNED)
MAIN: BEGIN
	DECLARE CONTADOR TINYINT UNSIGNED DEFAULT 0;
    DECLARE SOMA INT DEFAULT 0;
    IF LIMITE < 1 THEN
		SELECT 'O VALOR DEVE SER MAIOR QUE ZERO.' AS ERRO;
        LEAVE MAIN;
    END IF;
    REPEAT
		SET CONTADOR = CONTADOR + 1;
        SET SOMA = SOMA + CONTADOR;
	UNTIL CONTADOR >= LIMITE
	END REPEAT;
	SELECT SOMA;
END//
DELIMITER ;
    
CALL ACUMULA_REPITA(10);
CALL ACUMULA_REPITA(0);
*/

/*WHILE
DELIMITER //
CREATE PROCEDURE ACUMULA_WHILE (LIMITE TINYINT UNSIGNED)
BEGIN
	DECLARE CONTADOR TINYINT UNSIGNED DEFAULT 0;
    DECLARE SOMA INT DEFAULT 0;
    WHILE CONTADOR < LIMITE DO 
		SET CONTADOR = CONTADOR + 1;
        SET SOMA = SOMA + CONTADOR;
    END WHILE;
    SELECT SOMA;
END//
DELIMITER ;   

Call ACUMULA_WHILE('5');  vai somando 1 + 2 + 3 + 4 + 5 por isso deu 15

*/

/*ITERATE

DELIMITER //
CREATE PROCEDURE ACUMULA_ITERATE (LIMITE TINYINT)
BEGIN
	DECLARE CONTADOR TINYINT UNSIGNED DEFAULT 0;
    DECLARE SOMA INT UNSIGNED DEFAULT 0;
    TESTE: LOOP
		SET CONTADOR = CONTADOR + 1;
        SET SOMA = SOMA + CONTADOR;
        IF CONTADOR < LIMITE THEN
			ITERATE TESTE;
        END IF;
		LEAVE TESTE;
     END LOOP TESTE;
     SELECT SOMA;
END//
DELIMITER ;

call acumula_iterate(10);


DELIMITER //
CREATE PROCEDURE PARES(LIMITE TINYINT UNSIGNED)
MAIN: BEGIN
	DECLARE CONTADOR TINYINT DEFAULT 0;
    MEULOOP: WHILE CONTADOR < LIMITE DO
    SET CONTADOR = CONTADOR + 1;
    IF MOD (CONTADOR , 2) THEN
		ITERATE MEULOOP;
    END IF;
    SELECT CONCAT(CONTADOR,' É UM NÚMERO PAR') AS VALOR;
    END WHILE;
END//
DELIMITER ;

CALL PARES(20);    

*/

/* Triggers
	CREATE TABLE PRODUTO(
IDPRODUTO INT NOT NULL auto_increment,
Nome_produto varchar(45) null,
Preco_normal decimal(10,2) null,
Preco_desconto Decimal(10,2) null,
Primary key (idProduto));

-- Trigger trabalhar junto a uma tabela 

 -- tr_deconto pra mostra que é um Trigger
 -- before tem que ser feito antes da tabela receber dados
 
Create trigger tr_desconto BEFORE INSERT
ON produto
FOR EACH ROW 
SET NEW.Preco_Desconto = (NEW.Preco_Normal * 0.90); -- TA calculando 10% de desconto
-- esse triger calcula o desconto na tabela produto no campo preco desconto
-- set ta atualizando no campo preco_desconto recebendo a operação
insert INTO Produto (Nome_produto,Preco_normal) values ('Monitor',1.00);
insert INTO Produto (Nome_produto,Preco_normal) values ('DVD',1.00);
insert INTO Produto (Nome_produto,Preco_normal) values ('PENDRIVE',18.00);
SELECT * FROM Produto;
*/

show databases;

show tables;

/* Campos Gerados - Colunas Calculadas 
-- o campo num3 vai receber o campo num 1 * o campo num2;

CREATE TABLE TBL_MULT(
ID smallint primary key auto_increment,
num1 smallint not null,
num2 smallint not null,
num3 smallint GENERATED ALWAYS AS (num1 * num2) virtual
);

insert into TBL_MULT (num1,num2) values (2,1),(2,2),(2,3),(2,4);

select * from TBL_MULT;
-- os valores são regados quando fazemos a consulta é num1 * num2

UPDATE tbl_mult
set num2 = 8
where id = 2;

create table tbl_vendas(
ID_venda smallint primary key auto_increment,
preco_produto Decimal(6,2) not null,
qtde tinyint not null,
desconto decimal(4,2) not null,
preco_total Decimal(6,2) as (preco_produto * qtde * (1 - desconto / 100)) Stored
);

insert into tbl_vendas (preco_produto, qtde ,desconto) values
(50.00,2,20),
(65.00,3,15),
(100.00,1,12),
(132.00,3,18)
 ;

select * from  tbl_vendas;

*/

-- UNION junta um valor de uma consulta com o valor de outra Consulta

select Nome_livro as Livro, preco_livro as preço,
'Livro Caro ' Resultado
from tbl_livro
where Preco_Livro >= 60.00
UNION 
SELECT Nome_Livro Livro , preco_livro preço, 'Preço Razoável' Resultado
from tbl_livro
where Preco_Livro < 60.00;

Aula 57 3:30 minutos;


