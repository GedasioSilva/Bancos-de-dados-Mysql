/* Modificar tabela
 alter table cliente 
    modify column s_nome_cliente varchar (60);
    -- Modificar a tabela;
 
 */
/* Adicionar coluna
alter table cliente add i_tipo_cliente int not null ;
 */  
/* Remover coluna
  alter table cliente drop column i_tipo_cliete;
 */ 

create table if not exists tipo_cliente(
i_tipocliente_tipocliente int primary key auto_increment,
s_dsctipoclinete_tipocliente varchar (100) not null
) default char set utf8;

/* Referenciar "criar" Chaver Estrangeira 
alter table cliente add constraint fk_tipocliente 
foreign key (i_tipo_cliente) references tipo_cliente (i_tipocliente_tipocliente);
*/

