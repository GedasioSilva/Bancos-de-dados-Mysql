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




