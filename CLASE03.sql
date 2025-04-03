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

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100

-- b-	artículos con precio entre 20 y 40 (usar < y >)
-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
-- d-	artículos con precio = 20 y stock mayor a 30
-- e-	artículos con precio (12,20,30) no usar IN
-- f-	artículos con precio (12,20,30) usar el IN
-- g-	artículos que su precio no sea (12,20,30)
-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
-- i-   listar nombre y descripción de los artículos que no cuesten $100
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
