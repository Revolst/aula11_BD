create database projeto_compra
go

use projeto_compra
go

create table cliente
(id_cliente				int				not null	identity(1,1)	primary key,
nom_cliente				varchar(50)		not null,
end_cliente				varchar(60)		not null);
go

create table compra
(id_compra				int				not null		identity(1,1)		primary key,
cliente					int				not null		constraint cliente_id_cliente	references cliente(id_cliente),
vl_compra				numeric(7,2)	not null,
dt_compra				date			not null);
go


insert into cliente(nom_cliente,end_cliente)
values('Maria','Rua Floriang, 20'),
	  ('Jose','Rua Alcantara, 113'),
	  ('Carlos','Av. Tiradentes, 10'),
	  ('Josefina','Trav. Clara Camarao, 25');
go

select * from cliente;

insert into compra
values(1,5020.20,'2017-10-01'),
	  (2,3510.55,'2017-10-01'),
	  (1,1000.00,'2017-10-30'),
	  (4,1200.10,'2017-11-01'),
	  (1,8000.00,'2017-11-02');
go

select * from compra;

/*JOIN OU INNER JOIN*/

select *
from cliente a inner join compra b on a.id_cliente = b.cliente;

select*
from compra b join cliente a on b.cliente = a.id_cliente;

select*
from cliente a join compra b on a.id_cliente = b.cliente;

/* Right join - lista as linhas referentes a tabela a direita da expressão*/

select *
from cliente a right join compra b on a.id_cliente = b.cliente;

/* Left join - lista as linhas referentes a tabela a direita da expressão*/

select *
from cliente a left join compra b on a.id_cliente = b.cliente;

/* Full join*/
select *
from cliente a full join compra b on a.id_cliente = b.cliente;

select a.id_cliente, a.nom_cliente
from cliente a join compra b on a.id_cliente = b.cliente
order by nom_cliente;

select a.id_cliente as 'Codigo cliente', a.nom_cliente as 'Nome Cliente'
from cliente a join compra b on a.id_cliente = b.cliente;

select a.nom_cliente, b.dt_compra, b.vl_compra
from cliente a join compra b on a.id_cliente = b.cliente
order by nom_cliente;

select a.id_cliente, a.nom_cliente, b.vl_compra
from cliente a join compra b on a.id_cliente = b.cliente
order by nom_cliente;

select a.nom_cliente, b.dt_compra, b.vl_compra
from cliente a join compra b on a.id_cliente = b.cliente
where b.dt_compra = '2017-10-01'
order by nom_cliente; 

select a.id_cliente,a.nom_cliente,b.vl_compra
from cliente a join compra b on a.id_cliente = b.cliente and b.vl_compra > 1200
order by nom_cliente;

select distinct a.id_cliente,a.nom_cliente
from cliente a join compra b on a.id_cliente = b.cliente
order by nom_cliente;


