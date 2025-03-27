-- Comentarioen linea
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

-- 8- Seleccione y muestre todos los registros de la tabla:

