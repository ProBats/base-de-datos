use articulos_TM;
SELECT * FROM articulos;
-- Usando la base de datos articulos.
-- 1 Informar cantidad de televisores.
select 	descripcion,count(*) cantidad_televisores
from	articulos
where	descripcion='televisores';
-- 2- Informar cantidad de televisores segun marca.
select	descripcion,marca,count(*) cantidad_televisores
from	articulos
where	descripcion='televisores'
group by marca;
-- 3- Informar cual es el televisor más barato.
select	descripcion,marca,min(precio) precio_minimo
from	articulos
where	precio=(select min(precio) from articulos
where	descripcion='televisores');
-- 4- Aumentar un 15% los articulos de la marca 'LG'.
select * from articulos where marca='LG';

update 	articulos set precio=precio*1.15
where	marca='LG';
-- 5- Bajar un 4% los aires acondicionados.
update	articulos set precio=0.96
where	descripcion='aire acondicionado';
-- 6- Listar los articulos ordenaros por marca,descripción,nombre,
-- precio.
select * from articulos
order by marca,descripcion,nombre,precio;
-- 7- Cantidad de articulos según marca y descripción.
select 	marca,descripcion, count(*) cantidad
from	articulos
group by marca,descripcion;
-- 8- Mostrar el producto mas caro de la marca 'LG'
select marca,descripcion,nombre,max(precio)precio_maximo
from	articulos
where	marca='LG';

select * from articulos
where	precio=(select max(precio) from articulos
where	marca='LG') and marca='LG'; -- subconsulta

-- LABORATORIO 6
-- Crear la base de datos Laboratorio_06_TM, si ya existe borrarla.
drop database if exists Laboratorio_06_tm;
create database Laboratorio_06_tm;
use Laboratorio_06_tm;
-- Crear la siguiente tabla.
create table cursos(
	codigo int,
	nombre varchar(20),
	dias varchar(10),
	inscriptos int,
	primary key(codigo)
);

insert into cursos values
	(1,'PHP','lunes',10),
	(2,'Java','lunes',5),
	(3,'Corel Draw','martes',2),
	(4,'Java','martes',5),
	(5,'MySQL','martes',5),
	(6,'Oracle','miercoles',6),
	(7,'C#.net','jueves',5),
	(8,'C#.net','viernes',4),
	(9,'PHP','lunes',10),
	(10,'C#.net','lunes',5),
	(11,'Corel Draw','martes',2),
	(12,'Oracle','martes',5),
	(13,'PHP','martes',5),
	(14,'Oracle','miercoles',6),
	(15,'C#.net','jueves',5),
	(16,'Java','viernes',4);

-- Según la tabla cursos
-- 1 - Sumar en uno la cantidad de alumnos inscriptos del curso Java 
-- de los días Lunes
select * from cursos;
update cursos set inscriptos=inscriptos+1
where	nombre='Java' and dias='lunes';
-- 2 - Poner en 0 la cantidad de alumnos inscriptos de los cursos de 
-- los días Martes
update	cursos set inscriptos=0
where	dias='martes';
-- 3 - Borrar los cursos de Java en día Martes
delete	from cursos where nombre='java' and dias='martes';
-- 4 - Sumar 5 inscriptos en los cursos que tengan menos de 5 alumnos 
-- inscriptos.
update	cursos set inscriptos=inscriptos+5
where	inscriptos<5;
-- 5 - Cambiar el nombre de los cursos Java por Java 2 SE.
update	cursos set nombre='Java 2 SE'
where	nombre='Java';	

-- Ejercicio 2-- Crear la siguiente tabla.

create table empleados(
	codigo int auto_increment,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	seccion enum('administracion','ventas','produccion','deposito'),
	sueldo float,
	primary key (codigo)
);

insert into empleados (nombre,apellido,seccion,sueldo) values
	('juan','perez','administracion',72000),
	('diego','torres','ventas',35200),
	('laura','gomez','ventas',46000),
	('mario','lopez','produccion',45000),
	('dario','sanchez','administracion',86000),
	('juan','boneli','administracion',72000),
	('diego','martinez','ventas',35200),
	('laura','moretti','ventas',46000),
	('sandra','lazante','produccion',45000),
	('susana','mendez','administracion',86000);
select * from empleados;
-- 1 Cambiar al empleado Mario Lopez de la sección produccion
-- a administracion.
update 	empleados set seccion='administracion'
where	nombre='Mario' and apellido='Lopez';
-- 2 Aplicar un aumento de sueldo básico del 15% a los empleados de 
-- ventas.
update	empleados set sueldo=sueldo*1.15
where	seccion='ventas';
-- 3 Aplicar un aumento del 8% a todos los empleados de producción 
-- que tengan un sueldo básico menor a 6000 pesos.
update	empleados set sueldo=sueldo*1.08
where	seccion='produccion' and sueldo<6000;
-- 4 Dar de baja al empleado Susana Méndez.
delete	from empleados
where	codigo=10;
-- 5 Aplicar un aumento de sueldo del 4% a todos los empleados que 
-- tengan un básico mayor o igual a 5000 pesos.
update	empleados set sueldo=sueldo*1.04
where	sueldo>=5000;
-- 6 Aplicar un aumento de sueldo del 8% a todos los empleados que 
-- tengan un básico menor a 5000 pesos.
update	empleados set sueldo=sueldo*1.08
where	sueldo<5000;
-- 7 Agregar el campo fecha de nacimiento (date) en la tabla empleados 
-- despues del campo apellido.
alter table empleados add fenaci date after apellido;
describe empleados;
-- 8 Completar una fecha de nacimiento para cada empleado.
update empleados set fenaci='1985/04/06' where codigo=1;
update empleados set fenaci='1990/10/05' where codigo=2;
update empleados set fenaci='2002/07/16' where codigo=3;
update empleados set fenaci='1996/04/07' where codigo=4;
update empleados set fenaci='1998/05/16' where codigo=5;
update empleados set fenaci='2001/09/10' where codigo=6;
update empleados set fenaci='1995/08/20' where codigo=7;
update empleados set fenaci='1987/01/26' where codigo=8;
select * from empleados;
-- 9 Listar todos los campos de empleados + una columna que calcule 
-- la edad de cada empleado.
-- select curdate()-fenaci edad from empleados; noo!!!
-- select (curdate()-fenaci/365.25) edad from empleados; No!!!
-- select round((curdate()-fenaci/365.25) )edad from empleados; Nooo!!
select round(datediff(curdate(),fenaci)/365.25,0) edad
from empleados;
select nombre,apellido,
round(datediff(curdate(),fenaci)/365.25,0) edad
from empleados;

-- 1. Crear las tablas:

CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY,
nombre_categoria VARCHAR(50)
);

CREATE TABLE Productos (
id_producto INT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10, 2)
);
CREATE TABLE Vendedores (
VendedorID INT PRIMARY KEY,
Nombre VARCHAR (100),
Email VARCHAR (100),
Telefono VARCHAR(15)
);

-- 2. Insertar datos:

INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES
(1, 'Electrónica'),
(2, 'Ropa'),
(3, 'Alimentos');

INSERT INTO Productos (id_producto, nombre, precio) VALUES
(1, 'Televisor', 300.00),
(2, 'Laptop', 800.00),
(3, 'Camisa', 20.00),
(4, 'Pantalón', 25.00),
(5, 'Manzana', 1.00),
(6, 'Plátano', 0.50);

INSERT INTO Vendedores (VendedorID, Nombre, Email, Telefono) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', '555-1234'),
(2, 'María López', 'maria.lopez@example.com', '555-5678');

-- 1. Seleccionar todos los productos:
select * from productos;
-- 2. Seleccionar todos los vendedores:
select * from vendedores;
-- 3. Obtener productos de una categoría específica (por ejemplo, Electrónica):

-- 4. Contar cuántos productos hay en cada categoría:
select *
from categorias
where nombre_categoria='electronica';
-- 5. Obtener el precio promedio de los productos:
select round(avg(precio),2) precio_promedio from productos;
-- 6. Listar los vendedores con su información de contacto:
select vendedorid,nombre,email,telefono from vendedores;
-- 7. Buscar un producto por su nombre (por ejemplo, "Laptop"):
select * from productos where nombre like 'laptop';

-- 8. Actualizar el precio de un producto (por ejemplo, aumentar el precio de la Camisa):
update productos set precio = 10 where nombre = 'camisa';
-- 9. Eliminar un vendedor (por ejemplo, Juan Pérez):
delete from vendedores where vendedorid=1;
-- 10. Si deseas actualizar la información de un vendedor, puedes usar la siguiente consulta. Por ejemplo, si quieres cambiar el teléfono de Juan Pérez:
update vendedires set telefono = '1239876543' where vendedorid = 2;
-- 11. Supongamos que queremos aumentar el precio de todos los productos en la categoría "Ropa" en un 10%.

-- 12 Agregar un nuevo campo, como Direccion,
alter table vendedores add direccion varchar(100);
-- 13 Si decides agregar una columna para almacenar la descripción de los productos, puedes modificar la tabla Productos

-- Ejercicios de Consulta
-- 1. SUM: ¿Cuál es el precio total de todos los productos?
select sum(precio) 'Suma de precios' from productos;
-- 2. MAX: ¿Cuál es el precio del producto más caro?
select max(precio) 'Precio mas alto' from productos;
select * from productos where precio = (select max(precio) from productos);
-- 3. MIN: ¿Cuál es el precio del producto más barato?
select max(precio) 'Precio minimo' from productos;
select * from productos where precio = (select min(precio) from productos);
-- 4. HAVING: ¿Cuántos productos hay en cada categoría y cuáles son las categorías que tienen más de un producto?

### Ejercicios de Actualización y Eliminación
-- 5. UPDATE: Supongamos que quieres actualizar el precio de la 'Laptop' a 750.00. ¿Cómo lo harías?
update productos set precio = 750.00 where nombre = 'laptop';
-- 6. DELETE: Si deseas eliminar el producto 'Manzana', ¿cuál sería la consulta?
delete from productos where nombre = 'manzana';

use negocio_tm;
show tables;
describe articulos;
describe facturas;
describe clientes;
select * from articulos;
select * from clientes;

-- SENTENCIA JOIN
select * from facturas, clientes; -- 160
select count(*) from facturas; -- 16
select count(*) from clientes;-- 10

alter table facturas add CodigoCliente int not null;
describe facturas;
update facturas set CodigoCliente = 5 where numero = 1001 and letra='A';
update facturas set CodigoCliente = 7 where numero = 1002 and letra='A';
update facturas set CodigoCliente = 2 where numero = 1003 and letra='A';
update facturas set CodigoCliente = 10 where numero = 1004 and letra='A';
update facturas set CodigoCliente = 11 where numero = 1005 and letra='A';
update facturas set CodigoCliente = 5 where numero = 1006 and letra='B';
update facturas set CodigoCliente = 12 where numero = 1010 and letra='B';
update facturas set CodigoCliente = 7 where numero = 1007 and letra='C';
update facturas set CodigoCliente = 8 where numero = 1008 and letra='C';

select * from facturas;

select * from clientes, facturas
where clientes.codigo_cliente = facturas.CodigoCliente;

select * from clientes c, facturas f 
where c.codigo_cliente = f.CodigoCliente;

-- sentencia join para unir tablas
select * from clientes c 
join facturas f 
on c.codigo_cliente = f.CodigoCliente;

-- left join
select * from clientes c
left join facturas f
on c.codigo_cliente = f.CodigoCliente;

-- rigth join
select * from clientes c
right join facturas f
on c.codigo_cliente = f.CodigoCliente;

drop database if exists kiosco_tm;
create database kiosco_tm;
use kiosco_tm;

create table CLIENTE(
id_cliente int primary key,
nombre varchar(50),
direccion varchar(50),
telefono varchar(50),
ciudad varchar(50)
);

create table PRODUCTO(
id_producto int primary key,
descripcion varchar(45) not null,
precio double not null
);
create table VENTA(
id_venta int primary key,
cantidad int not null,
id_cliente int not null references cliente,
id_producto int not null references producto
);


describe CLIENTE;
show tables;
SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES(123,'Simon Bolivar', 'Kra11#9-56', '7702291', 'Cali');
INSERT INTO CLIENTE VALUES(456,'Mark Zuckerberg', 'Cll 21#95-52', '+57-315291', 'Medellin');
INSERT INTO CLIENTE VALUES(789,'Drew Barrymore', 'Kra52#65-05', '3125359456', 'Cali');
INSERT INTO CLIENTE VALUES(741,'Larry Page', 'Cll 05#52-95', '7872296', 'Tunja');
INSERT INTO CLIENTE VALUES(147,'Tom Delonge', 'Cll 52#65-56', '7992293', 'Medellin');
INSERT INTO CLIENTE VALUES(852,'Simon Bolivar', 'Kra 21#65-52', '982295', 'Bogota');
INSERT INTO CLIENTE VALUES(258,'Mark Hoppus', 'Cll 11#95-9', '8952294', 'Bogota');
INSERT INTO CLIENTE VALUES(963,'Britney Spears', 'Cll 05#52-56', '7705295', 'Tunja');
INSERT INTO CLIENTE VALUES(369,'John Forbes Nash', 'Kra 21#05-56', '776622966', 'Cali');
INSERT INTO CLIENTE VALUES(159,'Tom Delonge', 'Kra05#65-05', '6702293','Medellin');
INSERT INTO CLIENTE VALUES(753,'Sergey Brin', 'Cll 11#65-11', '9702299', 'Medellin');
INSERT INTO CLIENTE VALUES(153,'Emma Watson', 'Kra 9#9-95', '31569638', 'Tunja');


INSERT INTO PRODUCTO VALUES(1,'Coca-Cola 2L',24);
INSERT INTO PRODUCTO VALUES(2,'Doritos',95);
INSERT INTO PRODUCTO VALUES(3,'Salchicha',55);
INSERT INTO PRODUCTO VALUES(4,'Pan',50);
INSERT INTO PRODUCTO VALUES(5,'Queso',100);
INSERT INTO PRODUCTO VALUES(6,'Sandia',80);
INSERT INTO PRODUCTO VALUES(7,'Leche 1L',45);
INSERT INTO PRODUCTO VALUES(8,'Atun',180);
INSERT INTO PRODUCTO VALUES(9,'Pescado',78);
INSERT INTO PRODUCTO VALUES(10,'Cinta Estatica',180);
INSERT INTO PRODUCTO VALUES(11,'Camiseta',1200);
INSERT INTO PRODUCTO VALUES(12,'Blue-Jean',780);
INSERT INTO PRODUCTO VALUES(13,'Papaya',50);
INSERT INTO PRODUCTO VALUES(14,'Agua',30);
INSERT INTO PRODUCTO VALUES(15,'Red Bull',55);


INSERT INTO VENTA VALUES(1,5,123,1);
INSERT INTO VENTA VALUES(2,6,123,2);
INSERT INTO VENTA VALUES(3,7,123,3);
INSERT INTO VENTA VALUES(4,8,123,4);
INSERT INTO VENTA VALUES(5,2,456,5);
INSERT INTO VENTA VALUES(6,4,741,6);
INSERT INTO VENTA VALUES(7,5,456,7);
INSERT INTO VENTA VALUES(8,600,741,8);
INSERT INTO VENTA VALUES(9,69,852,9);
INSERT INTO VENTA VALUES(10,15,789,10);
INSERT INTO VENTA VALUES(11,11,456,5);
INSERT INTO VENTA VALUES(12,22,789,6);
INSERT INTO VENTA VALUES(13,11,753,7);
INSERT INTO VENTA VALUES(14,10,963,12);
INSERT INTO VENTA VALUES(15,65,963,11);
INSERT INTO VENTA VALUES(16,12,852,10);
INSERT INTO VENTA VALUES(17,65,741,9);
INSERT INTO VENTA VALUES(18,78,147,8);
INSERT INTO VENTA VALUES(19,92,258,9);
INSERT INTO VENTA VALUES(20,12,258,6);
INSERT INTO VENTA VALUES(21,32,147,3);
INSERT INTO VENTA VALUES(22,3,789,1);
INSERT INTO VENTA VALUES(23,45,456,2);
INSERT INTO VENTA VALUES(24,5,123,3);
INSERT INTO VENTA VALUES(25,5,789,4);
INSERT INTO VENTA VALUES(26,6,456,1);
INSERT INTO VENTA VALUES(27,4,123,2);
INSERT INTO VENTA VALUES(28,7,789,12);
INSERT INTO VENTA VALUES(29,8,258,13);
INSERT INTO VENTA VALUES(30,9,852,14);
INSERT INTO VENTA VALUES(31,9,753,15);
INSERT INTO VENTA VALUES(32,6,753,10);
INSERT INTO VENTA VALUES(33,7,159,9);
INSERT INTO VENTA VALUES(34,8,963,10);
INSERT INTO VENTA VALUES(35,9,369,8);
INSERT INTO VENTA VALUES(36,15,369,7);
INSERT INTO VENTA VALUES(37,5,123,5);
INSERT INTO VENTA VALUES(38,6,123,6);
INSERT INTO VENTA VALUES(39,7,123,7);
INSERT INTO VENTA VALUES(40,8,123,8);
INSERT INTO VENTA VALUES(41,5,123,9);
INSERT INTO VENTA VALUES(42,6,123,10);
INSERT INTO VENTA VALUES(43,7,123,11);
INSERT INTO VENTA VALUES(44,8,123,12);
INSERT INTO VENTA VALUES(45,5,123,13);
INSERT INTO VENTA VALUES(46,6,123,14);
INSERT INTO VENTA VALUES(47,7,123,15);


-- 1. Id de los clientes de Cali.
select id_cliente 
from cliente 
where ciudad like 'Cali';

-- 2. Id y la descripción de los productos que cuesten menos de $150 pesos.
select id_producto, descripcion
from producto
where precio < 150;
-- 3. Id y nombre de los clientes, cantidad vendida y la descripción del producto, 
-- en las ventas en las cuales se vendieron más de 10 unidades.
select c.id_cliente id, c.nombre, v.cantidad, p.descripcion from cliente c 
join venta v 
on c.id_cliente = v.id_cliente
join producto p
on p.id_producto = v.id_producto
where cantidad> 10;

-- 4. Id y nombre de los clientes que no aparecen en la tabla de ventas 
-- (Clientes que no han comprado productos).
select c.id_cliente, c.nombre 
from cliente c
left join venta v
on c.id_cliente = v.id_cliente
where v.id_cliente is null;
-- 5. Id y nombre de los clientes que han comprado todos los productos de la empresa.
select c.id_cliente, c.nombre 
from cliente c
join venta v
on c.id_cliente = v.id_cliente
group by c.id_cliente,c.nombre
having count(distinct v.id_producto) = (select count(*) from producto);
-- 6. Id, nombre de cada cliente y la suma total (suma de cantidad) 
-- de los productos que ha comprado.
select c.id_cliente,c.nombre,sum(v.cantidad)
from cliente c
join venta v
on c.id_cliente = v.id_cliente 
group by  c.id_cliente, c.nombre;
-- 7. Id de los productos que no han sido comprados por clientes de Tunja.
select id_producto from producto 
where id_producto not in(select distinct v.id_producto from venta v join cliente c on v.id_cliente = c.id_cliente where ciudad like'Tunja');
-- 8. Id de los productos que se han vendido a clientes de Medellín y que 
-- también se han vendido a clientes de Bogotá.
select distinct p.id_producto,p.descripcion 
from producto p
join venta v 
on v.id_producto = p.id_producto
join cliente c 
on v.id_cliente= c.id_cliente
where ciudad in ('Medellin', 'Bogota'); 
-- 9. Nombre de las ciudades en las que se han vendido todos los productos.
select c.ciudad from cliente c
join venta v on c.id_cliente=v.id_cliente
group by c.ciudad
having count(distinct v.id_producto)=(select count(*) from producto);