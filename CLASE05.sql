-- Comentario en linea
-- Es necesario hacer un espacio despues de los dos guiones
/* Bloque de comentario */

/* Modulo de Base de Datos del Trayecto Programador
dias: Jueves de 10 a 14 hs.
mail: laura.artaza@bue.edu.ar
*/

/* sofware que vamos a utilizar es MySQL
serves alternativos 
mariaDB, Oracle, SQL server

Requerimientos de conexion:
TCP/IP
Lenguaje: ANSI SQL

Paquete XAMMP - LINUX WINDOWS

Paquete WAMP - WINDOWS

*/

/* TIPO DE DATO NUMERICO
TIPO							LONGITUD
boolean							1 byte
tiniyint						1 byte
(numero rango
entre -128 a 127)
tiniyint unsigned				1 byte
(numero rango
entre 0 a 255)
smallint						2 byte
mediumtint						3 byte
interger						4 bytes
float
(para numeros decimales)		4 bytes
double
(para numeros con coma)			8 bytes
decimal(m,d)					m+2 bytes
(almacena los numeros como
cadena de digitos (m) otro
para la parte decimal(d)
ejemplo: precio(7,2)
total= 7+2= 9 bytes  99999,99
*/

/* TIPOS DE DATOS DE TEXTO MAS COMUNES

TIPO					LONGITUD
char(x)					x 
varchar(x)				x+1

EJEMPLO
nombre char(20)

Ana 				20 byte
Carlos				20 byte
Maximiliano			20 byte
total				60 byte

nombre varchar(20)
Ana 		3+1		4  byte
Carlos		6+1		7  byte
Maximiliano	11+1	12 byte
total				23 byte
*/
/* TIPOS DE DATOS DE FECHA Y HORA

TIPO				LONGITUD	
date 2025/03/20			3 byte
time hh:mm:ss			3 byte
datetime				8 byte
*/

# comentario no ANSI

-- SQL: STRUCTURE QUERY LANGUAGE( lenguaje de consulta)
/* DDL: DATA DEFINITION LANGUAGE 
(lenguaje de definicion de datos)

create table;
alter table;
drop table;
*/

/* DML: DATA MANIPULACION LANGUGE
(lenguaje de manipulacion)

select;
insert;
delete;
update;
*/

-- COMANDO SELECT
select 'HOLA MUNDO'; -- CTRL + ENTER
select 2+2;
select 2+2 as total; -- agregando es un alias a la columna
select 2+2 total;
select 2+2 valor_total;
select 2+2 'valor total';
select pi();
select round(pi()) valor_pi;
select round(pi(),2) 'valor pi';
select curdate();
select curdate() fecha_actual;
select curtime();
select curtime() hora_actual;
select sysdate() fecha_hora_actual;


-- LABORATORIO 1
-- 1- Borrar si existe la base de datos Agenda_TM.
drop database if exists agenda_tm;
-- 2- Crear la base de datos Agenda_TM.
create database agenda_tm;
-- 3- Ingresar a la base de datos creada.
use agenda_tm;
-- 4- Crear una tabla llamada "datos". Debe tener los siguientes campos:
--    nombre 	(varchar 20), 
--    Apellido 	(varchar 20),
--    domicilio (varchar 30),
--    telefono 	(varchar 15),
create table datos(
nombre		varchar(20),
apellido	varchar(20),
domicilio	varchar(30),
telefono	varchar(15)
); -- aca cree los campos de la tabla dato

-- 5- Visualizar las tablas existentes en la base de datos para 
-- verificar la creación de "agenda_TM".
show tables;

-- 6- Visualizar la estructura de campos de la tabla "datos". 
-- (describe).
describe datos;

-- 7- Ingresar 10 registros con valores aleatorios.
insert into datos(nombre,apellido,domicilio,telefono) values
('Maria','Garcia','Tucuman 456','12345678'),
('Juan', 'Perez', 'Avenida San Martin 789', '98765432'),
('Laura', 'Lopez', 'Calle Falsa 123', '55512345'),
('Carlos', 'Martinez', 'Calle Luna 345', '77765432'),
('Ana', 'Rodriguez', 'Calle Sol 567', '55567890'),
('Luis', 'Hernandez', 'Avenida Belgrano 234', '98712345'),
('Sofia', 'Gomez', 'Calle Flores 890', '65432123'),
('Pedro', 'Diaz', 'Tucuman 456', '12345678'),
('Elena', 'Fernandez', 'Calle del Parque 678', '32165487'),
('Ricardo', 'Ramirez', 'Avenida Libertador 234', '65498712');

-- 8- Seleccione y muestre todos los registros de la tabla:
select domicilio from datos; -- muestra solo el valor requerido
select * from datos; -- muestra todos los datos

-- LABORATORIO 2

-- 1_ Borrar si existe la base de datos Negocio_TM
drop database if exists negocio_tm;

-- 2_Crear la base de datos Negocio_TM
create database negocio_tm;

-- 3_ Ingresar a la base de datos creada.
use negocio_tm;

-- 4_ Crear la tabla Cliente dentro de la base de datos con el siguiente detalle:
-- codigo_cliente int auto_increment y pk
-- nombre varchar(20) not null
-- apellido varchar(20) not null
-- cuit char(13)
-- direccion varchar(50)
-- comentarios varchar(140)
-- pk significa Primary Key
create table clientes(
codigo_cliente int auto_increment,
nombre char(20) not null,
apellido char(20) not null,
cuit char(13),
direccion char(50),
comentarios char(140),
primary key(codigo_cliente)
);

-- 5_ Crear la tabla Factura dentro de la base de datos con el siguiente detalle:
-- letra char y pk
-- numero int y pk
-- fecha date
-- monto double

create table facturas(
letra	char(1),
numero	int,
fecha	date,
monto	double,
primary key(letra,numero)
);

-- observar que se esta declarando una clave primaria compuesta es decir primary key (letra,codigo) 
-- cada campo por si solo no es clave, ni tampoco identifica al registro pero la suma de los dos forman la clave

-- 6_Crear la tabla articulos dentro de la base de datos con el siguiente detalle: 

-- codigo  int auto_increment pk
-- nombre varchar(50)
-- precio double
-- stock int 
create table articulos(
codigo int auto_increment,
nombre char(50),
precio double,
stock int,
primary key(codigo)
);

-- 7_ Cargar 5 registros aleatorios en cada tabla.
 INSERT INTO clientes (nombre, apellido, cuit, direccion, comentarios) VALUES
('Juan', 'Pérez', '20-12345678-9', 'Av. Siempre Viva 123', 'Cliente frecuente'),
('María', 'González', '23-87654321-0', 'Calle Falsa 456', 'Solicita factura A'),
('Carlos', 'Ramírez', '27-11223344-5', 'Boulevard Central 789', 'Prefiere pagos en efectivo'),
('Ana', 'Fernández', '21-22334455-6', 'Av. Libertador 321', 'Cliente VIP'),
('Luis', 'Martínez', '22-33445566-7', 'Ruta 8 km 45', 'Compra al por mayor');

INSERT INTO facturas (letra, numero, fecha, monto) VALUES
('A', 1001, '2024-03-01', 15000.50),
('B', 2001, '2024-03-02', 23500.75),
('C', 3001, '2024-03-05', 8900.00),
('A', 1002, '2024-03-10', 12500.25),
('B', 2002, '2024-03-15', 17200.80);

INSERT INTO articulos (nombre, precio, stock) VALUES
('Teclado Mecánico', 12000.50, 15),
('Mouse Gamer', 8500.75, 30),
('Monitor LED 24"', 45000.00, 10),
('Silla Ergonómica', 75000.25, 5),
('Auriculares Inalámbricos', 18000.80, 20);

-- 8_ Mostrar las tablas que tiene la base de datos negocio_tm
show tables;

-- 9_Describir (detalle de campos - METADATO) cada una de las tablas de la base de datos

describe clientes; 
describe facturas;
describe articulos;

-- 10_ Listar los registros de cada tabla
select * from clientes;
select * from facturas;
select * from articulos;

-- COLUMNAS CALCULADAS

select nombre,precio precio_sin_iva
from articulos;

select nombre,precio precio_sin_iva,precio*1.21 precio_con_iva
from articulos;

-- Precio y Precio mas IVA
select nombre, precio , round(precio*1.21,2) 'precio con iva'
from articulos;

-- Precio y valor del IVA
select nombre, precio, round(precio*0.21,2) IVA
from articulos;

-- Descuento del 20%
select nombre, precio, round(precio*0.80) descuento
from articulos;

-- Aumento del 30 %
select nombre, precio, round(precio*1.30) aumento
from articulos;

-- COMANDO INSERT
-- insert sin definicion de campos (ANSI)
insert into clientes values (
null,'Juan','Gerro','30-21457800-0','Mexico 1278',null);
select * from clientes;


-- FALTA COMPLETAR UN CAMPO QUE ES EL DE COMENTARIO
-- insert into clientes values (
-- null,'Juan','Gerro','30-21457800-0','Mexico 1278');

-- Insert con definicion de campos (ANSI)

insert into clientes (nombre,apellido,direccion) values(
'Maria','Castro','Uruguay 568');
select * from clientes;

-- Insert masivo
insert into clientes(nombre,apellido) 
values('Carolina','Castro'),('Matias','Juarez'),('Patricia','Morales');
select * from clientes;

-- FUNCIONES DE AGRUPAMIENTO 
-- Funcion max() numerico, texto

select max(monto) maximo
from facturas; -- Devuelve el valor maciomo del campo monto

select max(monto) monto_maximo
from facturas;

select max(monto) "monto maximo"
from facturas;

select max(fecha)
from facturas;

select max(apellido) 'ultimo apellido'
from clientes;
select * from clientes;

-- FUNCION min() numerico, texto
select min(monto) 
from facturas;

select min(monto) Monto_minimo 
from facturas;

select min(fecha) 
from facturas;
select min(fecha) 'menor fecha' 
from facturas;

select min(apellido) 
from clientes;
select min(apellido) Primer_apellido 
from clientes;

select min(stock) 
from articulos;
select min(stock) 'stock minimo' 
from articulos;

-- Funcion avg(arg) argumento numerico -- promedio

select avg(monto)
from facturas;
select avg(monto) Valor_promedio 
from facturas;

select round(avg(monto),2) Valor_promedio 
from facturas;

select round(avg(precio),2) Precio_promedio 
from articulos;

select round(avg(stock),2) Stock_promedio 
from articulos;

-- Funcion sum(arg) argumento=numerico

select sum(monto) total_facturado 
from facturas;
select sum(stock) 'Total de mercaderia' 
from articulos;

-- Valor de venta de toda la mercaderia en stock

select sum(precio*stock) Total_mercaderia 
from articulos;

show tables; -- Muestra todas las tablas de la Base de Datos

rename table articulos to articulo; -- Renombra la tabla
show tables;
rename table articulo to articulos;

alter table articulos add observacion varchar(45) not null; -- agrega una columna a la tabla

describe articulos; -- para ver las columnas de las tablas

alter table articulos drop column observacion; -- Borra la columna

-- Filtrado de cliente
-- Por nombre 
 select * from clientes
where nombre='Ana';

-- Por Id
select * from clientes
where codigo_cliente=3;

-- Operador != <> distinto
select * from clientes
where codigo_cliente <>3; -- Muestra todos los datos menos del cliente 3

select * from articulos
where codigo != 2;

-- Operador < <= > >=

select * from clientes 
where codigo_cliente >2;

select * from clientes
where codigo_cliente >= 2;

select * from articulos
where precio < 18000.8;
select * from articulos
where precio <= 18000.8;

-- Valores null
select * from clientes;

insert into clientes(nombre,apellido,comentarios) values
('Ana','Rodriguez',''),
('Javier','Monte',null);

select  * from clientes
where comentarios is null;

select * from clientes
where comentarios is not null;

select * from clientes
where direccion is not null;

select * from clientes
where direccion is null;

-- Operador logico and  - or 

select * from clientes
where nombre = 'Ana' and apellido="Rodriguez"; -- Tiene que cumplir las 2 condiciones

select * from clientes
where nombre = 'Ana' or nombre='Juan';
select * from clientes
where nombre = 'Maria' or apellido='Castro';

insert into articulos (nombre,precio,stock) values 
('Remera S',15000,50),
('Remera M',16000,35),
('Remera L',20000,45),
('Remera XL',23000,30),
('Remera XXL',25000,45),
('Remera XXXL',28000,23);

select * from articulos
where precio >= 20000 and precio <= 25000;

-- Operador between not between

select* from articulos
where precio between 20000 and 25000;

select * from articulos
where precio not between 20000 and 250000;

-- operador in  -  not in
select * from clientes
where codigo_cliente = 2 or codigo_cliente = 4
or codigo_cliente=5 or codigo_cliente=6;

select * from clientes
where codigo_cliente in(2,4,5,6); 

select * from clientes
where codigo_cliente not in(2,4,5,6);

-- Busqueda con expresion like y not like

insert into clientes (nombre, apellido) values
('Maria', 'Perez'),
('Mariana', 'Perez'),
('Mario', 'Perez'),
('Marcelo', 'Perez'),
('Marcela', 'Perez'),
('Mirtha', 'Perez'),
('Marta', 'Perez'),
('Merlina', 'Perez'),
('Monica', 'Luna'),
('Micaela', 'Perez'),
('Omar', 'Luna'),
('Armando', 'Lopez');

select * from clientes
where nombre like'm%'; -- Todos los nombres que empiezan con M

select * from  clientes
where nombre like 'ma%';
select * from  clientes
where nombre like 'mar%';
select * from  clientes
where nombre not like 'm%'; -- Todos los nombres que no empiezan con M

select * from clientes 
where nombre like'%a';-- Todos los nombres que terminan en A 

select * from clientes 
where nombre like '%ar';
select * from clientes 
where nombre like 'm_r%'; -- el _ reemplaza el caracter

select * from clientes 
where nombre like '___';

-- Ordenamiento con order by
select * from clientes
order by nombre; -- Ordena automaticamente en forma ascendente

select * from clientes
order by nombre asc; -- no es necesario poner el asc
select * from clientes
order by nombre desc;
select * from clientes
order by apellido, nombre;
select * from clientes
order by apellido desc , nombre;
select * from clientes
order by nombre limit 1; -- muestra el primero de la lista
select * from clientes
order by nombre desc limit 1;

-- LABORATORIO 3
-- 1 - Ingrese a la base de datos negocio.
use negocio_tm;

-- 2 - Ingrese 5 registros aleatorios en cada tabla.
insert into clientes(nombre, apellido,cuit,direccion) values 
('Jose','Ortiz','30-254789235-0','Alberti 478'),
('Leonardo','Mendez','30-17854965-2','Misiones '),
('Paula','Campos','27-42487854-9','Pedernera 256'),
('Roxana','Aranda','27-14894456-8','Mansilla 258'),
('Luis','Herrera','20-35895412-0','Mexico 2568');

insert into facturas(letra, numero, fecha, monto) values
('A',1006,'2025/03/27',154000),
('A',1007,'2025/04/12',257500),
('A',1008,'2025/04/14',150659),
('A',1009,'2025/04/21',168900),
('A',1010,'2025/04/22',156800);

insert into articulos(nombre, precio, stock) values
('Chomba S a XL',25000,100),
('Pantalon Jean 38 a 50',35000,150),
('Campera Rompeviento',45000,50),
('Bermuda Cargo',25000,180),
('Buzo Friza',39000,250);

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.
-- a-	artículos con precio mayor a 15000
select * 
from articulos
where precio >15000;

-- b-	artículos con precio entre 20000 y 40000 (usar < y >)
select * 
from articulos
where precio >= 20000 and precio <= 40000;

-- c-	artículos con precio entre 40000 y 60000 (usar BETWEEN)
select *
from articulos
where precio between 40000 and 60000; 
-- d-	artículos con precio = 20000 y stock mayor a 30
select * 
from articulos
where precio = 25000 and stock >30;

-- e-	artículos con precio (12000,20000,30000) no usar IN
select *
from articulos
where precio = 12000 or precio = 20000 or precio = 30000;

-- f-	artículos con precio (12000,20000,30000) usar el IN
select * 
from articulos
where precio in(12000,20000,30000);

-- g-	artículos que su precio no sea (12000,20000,30000)
select *
from articulos
where precio not in(12000,20000,30000);

-- h-   artículos que su precio mas iva(21 %) sea mayor a 20000
select nombre, precio, precio*1.21 Precio_con_IVA
from articulos
where (precio*1.21) > 20000; 

-- i-   listar nombre y descripción de los artículos que no cuesten $25000
select * 
from articulos
where precio <> 25000;

-- j- 	artículos con nombre que contengan la cadena 'remera' (usar like)
select * 
from articulos
where nombre like '%jean%';
-- k-   artículos que su precio sea menor que 20000 y en su nombre no contenga la letra 'o'
select * 
from articulos
where precio < 20000 and nombre not like '%u%';

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
select *
from articulos
order by precio desc, nombre;

-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
select  nombre, precio, round(precio*1.21,2) 'Precio con IVA'
from articulos;

-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select nombre, precio 'Cantidad de cuotas 3', round(precio/3*1.05,2) 'Valor cuota'
from articulos;

-- Comando delete (ANSI) 
select * 
from clientes;
delete 
from clientes 
where codigo_cliente = 200; 

-- Comando que me habilita BOrrar
set sql_safe_update=0; -- Con 0 habilito
set sql_safe_update=1; -- Con 1 deshabilito

delete 
from clientes
where apellido ='Perez'; -- elimina todos los Perez

delete from clientes;
insert into clientes(nombre, apellido) values ('camila','Garcia');
insert into clientes(codigo_cliente, nombre, apellido) values (200,'camila','Garcia');
insert into clientes(nombre, apellido) values ('Liliana','Perez');


-- comando truncate
truncate clientes; -- borra todos los datos que contiene la tabla(reinicia el id)

-- Comando update (ANSI)
-- modificar los registros
update clientes set nombre = 'Gabriel', apellido = 'Rodriguez'
where codigo_cliente = 4;
select * from clientes;
describe clientes;
alter table clientes add telefono varchar(20) after cuit; -- despues del cuit

alter table clientes add dni char(8) first; -- coloca en primer lugar

update clientes set telefono = '11-5469-8588'
where codigo_cliente = 1;
select * from clientes;

update clientes set dni= '36554221'
where codigo_cliente = 4;

update clientes set apellido ='Mendez'; -- setea todos los apellido en Mendez

update clientes set apellido = 'Mendez'
where apellido = 'Luna'; -- ojo

-- alter table modify
alter table clientes modify dni int; -- modifica el tipo de dato

-- alter table drop
alter table clientes drop telefono;

describe clientes;
alter table clientes drop dni;

-- LABORATORIO 4
-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, 
-- es decir de la forma simplificada.
select * from clientes;
insert into clientes
values
(null,'Juan', 'Pérez', '20-12345678-3', 'Calle Falsa 123', 'Cliente nuevo'),
(null,'María', 'González', '27-87654321-9', 'Av. Siempreviva 742', 'Pago puntual'),
(null,'Luciano', 'Martínez', '23-45678901-2', 'Ruta 9 km 45', 'Prefiere contacto por mail'),
(null,'Carla', 'Fernández', '30-11223344-5', 'Belgrano 456', 'Solicitó factura A'),
(null,'Esteban', 'Ruiz', '24-99887766-1', 'Mitre 1010', 'Visita mensual');

-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. 
-- Completar solo los campos nombre, apellido y CUIT.
insert into clientes (nombre,apellido,cuit) values
('Sofía', 'López', '27-33445566-7'),
('Martín', 'Castro', '20-77889900-5'),
('Valentina', 'Mora', '23-44556677-3'),
('Agustín', 'Silva', '24-55667788-1'),
('Camila', 'Ramos', '30-66778899-2');

-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes 
set nombre = 'Jose'
where codigo_cliente = 1;

-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
update clientes 
set nombre ='Pablo', apellido ='Fuentes', cuit ='20-21053119-0'
where codigo_cliente = 3;

-- 5-	Actualizar todos los comentarios NULL  a ''.
select * from clientes;
update clientes set comentarios = ''
where comentarios IS NULL;

-- 6-	Eliminar los clientes con apellido Perez.
delete from clientes
where apellido = 'Perez';

-- 7-	Eliminar los clientes con CUIT Terminan en 0.
delete from clientes
where cuit like '%0';

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 25000.
select * from articulos;
update articulos set precio = precio*1.20
where precio <= 25000;

-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 35000.
update articulos set precio = precio*1.15
where precio > 35000;

-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 20000.
update articulos set precio =precio*0.95
where precio>20000;

-- 	11- Eliminar los artículos con stock menor a 0.
delete from articulos
where stock < 0;

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)}
alter table articulos add stockMinimo int after stock;
alter table articulos add stockMaximo int after stockMinimo;

--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
update articulos set stockMinimo=40, stockMaximo=100
where codigo = 1;
update articulos set stockMinimo=40, stockMaximo=100
where codigo = 2;
update articulos set stockMinimo=40, stockMaximo=100
where codigo = 3;
update articulos set stockMinimo=40, stockMaximo=100
where codigo = 4;
update articulos set stockMinimo=20, stockMaximo=50
where codigo = 5;
update articulos set stockMinimo=30, stockMaximo=100
where codigo = 6;
update articulos set stockMinimo=15, stockMaximo=70
where codigo = 7;
update articulos set stockMinimo=40, stockMaximo=100
where codigo = 8;

--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
select codigo,nombre,precio,stock,StockMaximo-stock cantidad_a_reponer,StockMinimo,StockMaximo
from articulos
where stock<StockMinimo;
update articulos set StockMinimo = 45, StockMaximo=70
where codigo=9;
select * from articulos; 

--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(precio*stock) valor_venta_total
from articulos;
--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
select sum(round(precio*stock*1.21,2)) venta_con_iva
from articulos;

-- FUNCION COUNT() CANTIDAD
select count(*) cantidad from facturas; -- 10 facturas
select count(*) cantidad from clientes; -- 24 clientes
select count(*) cantidad from articulos; -- 16 articulos
select count(*) cantidad from articulos
where direccion is null; -- 13 clientes
use negocio_tm;
-- Subconsultas (subqueries)
select max(monto) maximo
from facturas;

select * from facturas
where monto=(select max(monto) maximo
from facturas);

-- Sumar cantidad de facturas Letra A, letra B, lectra C
insert into facturas (letra,numero,monto) 
values	('B','1007',256325),
		('B','1008',125325),
        ('B','1009',156025),
        ('B','1010',254710),
        ('C','1007',65325),
        ('C','1008',145000);  
select count(*) cantidad 
from facturas
where letra='A';-- cantidad 2
select count(*) cantidad 
from facturas
where letra='B';-- cantidad 6
select count(*) cantidad 
from facturas
where letra='C';-- cantidad 3

select (select count(*) cantidad from facturas) 
from facturas 
where letra='A' +(select count(*) cantidad from facturas where letra='B') cantidad;

-- Agrupamiento group by
select letra , sum(monto) total from facturas
where letra ='A';
select letra , sum(monto) total from facturas
where letra ='B';
select letra , sum(monto) total from facturas
where letra ='C';

select letra,sum(monto) total from facturas
group by letra; -- agrupado por letra
select fecha,sum(monto) total from facturas
group by fecha; -- agrupado por fecha

-- Filtrado por having
select letra, sum(monto) total 
from facturas 
group by letra 
having total>500000;

insert into facturas(letra, numero,fecha, monto) values
('C',1009,curdate(),25000),
('C',1010,curdate(),55000),
('C',1011,curdate(),65000),
('A',1011,curdate(),75000),
('B',1011,curdate(),35000);

-- total facturado por mes
select letra,concat(year(fecha),'/',month(fecha)) mes,count(letra)
from facturas
group by mes,letra;
 

-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE

--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 128 en la tabla ASCII.


drop database if exists vehiculos_tm;
create database vehiculos_tm;
use vehiculos_tm;

create table autos(
codigo	int primary key,
marca	varchar(25),
modelo	varchar(25),
color	varchar(15),
anio int,
precio double
);

-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente varchar(10) after modelo;

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
INSERT INTO autos (codigo, marca, modelo, patente, color, anio, precio) VALUES
(1, 'Toyota', 'Corolla', 'AB123CD', 'Blanco', 2006, 230000),
(2, 'Ford', 'Focus', 'AC456EF', 'Negro', 2010, 180000),
(3, 'Chevrolet', 'Cruze', 'AD789GH', 'Gris', 2013, 195000),
(4, 'Volkswagen', 'Golf', 'AE321JK', 'Rojo', 2018, 250000),
(5, 'Honda', 'Civic', 'AF654LM', 'Azul', 2011, 270000),
(6, 'Nissan', 'Sentra', 'AG987NP', 'Blanco', 2020, 210000),
(7, 'Renault', 'Logan', 'AH159QR', 'Gris', 2017, 150000),
(8, 'Peugeot', '208', 'AJ753ST', 'Negro', 2021, 220000),
(9, 'Hyundai', 'Elantra', 'AK258UV', 'Plata', 2019, 200000),
(10, 'Kia', 'Rio', 'AL369WX', 'Azul', 2018, 170000),
(11, 'Fiat', 'Cronos', 'AM741YZ', 'Rojo', 2023, 240000),
(12, 'Mazda', '3', 'AN852BC', 'Negro', 2022, 260000),
(13, 'BMW', '320i', 'AP963DE', 'Blanco', 2021, 350000),
(14, 'Audi', 'A3', 'AQ147FG', 'Gris', 2020, 370000),
(15, 'Mercedes-Benz', 'Clase A', 'AR258HI', 'Negro', 2022, 390000);

-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select codigo,marca,modelo,patente,color,anio,precio 'precio maximo' from autos
where precio = (select max(precio) maximo from autos);

-- 	b. obtener el precio mínimo.
select codigo,marca,modelo,patente,color,anio,precio 'precio minimo' from autos
where precio =(select min(precio) minimo from autos);

-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select * from autos
where precio =(select min(precio) minimo from autos)and anio between 2010 and 2018;

-- 	d. obtener el precio promedio.
select count(*) cantidad,sum(precio) precio_total,round(avg(precio),2) promedio from autos;

-- 	e. obtener el precio promedio del año 2020.
select modelo,anio,count(*) cantidad,round(avg(precio),2) precio_promedio 
from autos
group by anio
having anio=2020;
-- 	f. obtener la cantidad de autos.
select count(*) cantidad_autos from autos;
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
select count(*) cantidad_autos
from autos
where precio between 235000 and 240000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) cantidad_autos
from autos
group by anio;

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio, count(*) cantidad_autos,round(avg(precio),2) precio_promedio
from autos
group by anio;
-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca,sum(precio) suma_precio, count(*) cantidad_autos,round(avg(precio),2) precio_promedio
from autos
group by marca;

--  k. informar los autos con el menor precio.
select marca, modelo, precio
from autos
where precio=(select min(precio) from autos);

--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select marca, modelo, precio
from autos
where precio=(select min(precio) from autos)and anio between 2016 and 2018;
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos
order by marca, modelo ,anio;
--  n. contar cuantos autos hay de cada marca.
select marca, count(*) cantidad
from autos
group by marca;

--  o. borrar los autos del siglo pasado.
delete 
from autos 
where anio < 2000;

-- EJERCICIOS DE REPASO
drop database if exists articulos;
create database articulos;
use articulos;

CREATE TABLE articulos (
  codigo int(10) unsigned NOT NULL,
  descripcion varchar(50) NOT NULL,
  nombre varchar(45) NOT NULL,
  precio float NOT NULL,
  stock int(10) unsigned NOT NULL,
  marca varchar(45) NOT NULL
);

INSERT INTO articulos VALUES
(1,'Televisores','TV LCD 19\" MODELO PFL3403',2199,40,'PHILIPS'),
(2,'Televisores','TV LCD22\" MODELO LN22A450',2399,30,'SAMSUNG'),
(3,'Televisores','TV LCD 32\" MODELO LC813H ',2999,25,'NOBLEX'),
(4,'Televisores','TV LCD 26\" MODELO 26LG30R',2999,25,'LG'),
(5,'Televisores','TV LCD 26\" MODELO CDH-L26S02',3099,20,'HITACHI'),
(6,'Televisores','TV LCD 32\" MODELO PL3219 ',3399,20,'PHILCO'),
(7,'Computadoras','CPU LE1250DVD2GB160VS',2199,15,'ADMIRAL'),
(8,'Computadoras','CPU A64X246DV2G160VBOF ',2499,8,'ADMIRAL'),
(9,'Computadoras','CPU E5200DVDR2GB320VB ',2699,5,'ADMIRAL'),
(10,'Computadoras','CPU SG3308LA ',3099,5,'COMPAQ PRESARIO'),
(11,'Impresoras','IMPRESORA T23 ',219,18,'EPSON'),
(12,'Impresoras','IMPRESORA DJ-6940 ',349,20,'HEWLETT PACKARD'),
(13,'Impresoras','IMPRESORA T33',399,12,'EPSON'),
(14,'Impresoras','IMPRESORA K5400  ',499,8,'HEWLETT PACKARD'),
(15,'Home Theater','HOME CINEMA SPH70 ',319,0,'PHILCO'),
(16,'Home Theater','HOME CINEMA AMX115 ',419,0,'NOBLEX'),
(17,'Home Theater','HOME CINEMA HT E 860 ',599,0,'X-VIEW'),
(18,'Home Theater','HOME CINEMA DC-T990 ',759,5,'SANYO'),
(19,'Home Theater','HOME CINEMA HT-1105U',829,18,'NOBLEX'),
(20,'Home Theater','HOME CINEMA HT304SL-A2 ',949,6,'LG'),
(21,'Home Theater','HOME CINEMA HT-Z110 ',999,22,'SAMSUNG'),
(22,'Home Theater','HOME CINEMA HTS3011/55',1099,18,'PHILIPS'),
(23,'Home Theater','HOME CINEMA HT503SH',1299,15,'LG'),
(24,'Home Theater','HOME CINEMA HT503SH-AM',1299,12,'LG'),
(25,'Home Theater','HOME CINEMA HT-IS10',1499,7,'SONY'),
(26,'Home Theater','HOME CINEMA HTS3365/55',1599,5,'PHILIPS'),
(27,'Radio','RADIO PORT RP 299  ',49,5,'NOBLEX'),
(28,'Radio','RADIO DX-365',79,15,'KEN BROWN'),
(29,'Radio','RADIO ICF-S10MK2/SCE',79,15,'SONY'),
(30,'Radio','RADIO ICF-18  ',99,15,'SONY'),
(31,'Radio','RADIO ICF-303/304 AM-FM ',129,8,'SONY'),
(32,'Radio','RADIO SRF-59/SC E ',129,10,'SONY'),
(33,'Notebooks','NOTEBOOK C2D2VB250WC14',3699,12,'ADMIRAL'),
(34,'Notebooks','NOTEBOOK CQ40-300',2999,9,'COMPAQ PRESARIO'),
(35,'Notebooks','NOTEBOOK DV2-1010',3999,7,'HEWLETT PACKARD'),
(36,'Notebooks','NOTEBOOK DV4-1212',4199,9,'HEWLETT PACKARD'),
(37,'Notebooks','NOTEBOOK DV4-1212',4199,10,'HEWLETT PACKARD'),
(38,'Telefonos','TELEFONO DECT1221S INALAMBRICO',169,15,'PHILIPS'),
(39,'Telefonos','TELEFONO CD1401B INALAMBRICO',169,8,'PHILIPS'),
(40,'Telefonos','TELEFONO CD2401S INALAMBRICO',239,8,'PHILIPS'),
(41,'Telefonos','TELEFONO CD1302S INALAMBRICO',249,8,'PHILIPS'),
(42,'Telefonos','TELEFONO SANYO HNS-3300 ',69,10,'SANYO'),
(43,'Lavarropas','LAVARROPA GAFA 7000 DIG PROGR 7KG',1679,7,'GAFA'),
(44,'Lavarropas','LAVARROPA GAFA 7500 T750 7,5K ',1839,4,'GAFA'),
(45,'Lavarropas','LAVARROPA GAFA ACQ7500 GRAFT750 7,5K ',1939,12,'GAFA'),
(46,'Lavarropas','LAVARROPA LG WF-T1202TP 12KG C/S',2449,10,'LG'),
(47,'Lavarropas','LAVARROPA LG WF-T1205TP 12K TITANIUM',2499,10,'LG'),
(48,'Camaras digitales','CAMARA DIGITAL KODAK C813',549,10,'KODAK'),
(49,'Camaras digitales','CAMARA DIGITAL VPCS-870EX ',579,15,'SANYO'),
(50,'Camaras digitales','CAMARA DIGITAL C913',599,15,'KODAK'),
(51,'Camaras digitales','CAMARA DIGITAL 760+KIT',649,15,'SAMSUNG'),
(52,'Camaras digitales','CAMARA DIGITAL ES10',749,20,'SAMSUNG'),
(53,'Camaras digitales','CAMARA DIGITAL ES15 ',799,40,'SAMSUNG'),
(54,'Video camaras','CAMARA VIDEO DCR-DVD650',2749,15,'SONY'),
(55,'Video camaras','CAMARA VIDEO DCR-DVD810 ',2999,10,'SONY'),
(56,'Estufas','CALEFACTOR TB 2400 GN',459,12,'SIGMA'),
(57,'Estufas','CALEFACTOR TB 3000 GN',699,12,'SIGMA'),
(58,'Estufas','CALEFACTOR TB 5000 GN',1999,15,'SIGMA'),
(59,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS',1999,15,'LG'),
(60,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS ',1999,10,'LG'),
(61,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C126EMAO 3000FS',2249,10,'LG'),
(62,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C1865DLO 4500FS',3049,20,'LG'),
(63,'Aire acondicionado','AIRE ACONDICIONADOR SP LS-C1863RMO 4500FS',3349,20,'LG'),
(64,'Aire acondicionado','AIRE ACONDICIONADOR SP WSX09CG5R 2500WFS',1599,15,'WESTINGHOUSE');

-- Usando la base de datos articulos.
-- 1 Informar cantidad de televisores.
-- 2- Informar cantidad de televisores segun marca.
-- 3- Informar cual es el televisor más barato.
-- 4- Aumentar un 15% los articulos de la marca 'LG'.
-- 5- Bajar un 4% los aires acondicionados.
-- 6- Listar los articulos ordenaros por marca,descripción,nombre,precio.
-- 7- Cantidad de articulos según marca y descripción.
-- 8- Mostrar el producto mas caro de la marca 'LG'