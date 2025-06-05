-- -------------    -------------------     -------------     
-- - libros    -    - prestamos       -     - socios    -    
-- -------------    -------------------     -------------     
-- - codigo PK -    - documento   PK  -     - documento -
-- - titulo    -    - codigolibro PK  -     - nombre    -
-- - autor     -    - fechaprestamo   -     - domicilio -
-- -------------    - fechadevolucion -     -------------
--                  -------------------                

drop database if exists libros_tm;
create database  libros_tm;
use libros_tm;

drop table if exists libros;
create table libros(
  codigo int,
  titulo varchar(40) not null,
  autor varchar(20),
  primary key (codigo)
);

drop table if exists socios;
create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
);

drop table if exists prestamos;
create table prestamos(
  documento char(8) not null,
  codigolibro int unsigned,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key (codigolibro,fechaprestamo)
);

insert into socios values('26333444','María Gómez','Mitre 123');
insert into socios values('27333444','Carlos Fernández','Belgrano 456');
insert into socios values('28333444','Lucía Martínez','San Martín 789');
insert into socios values('29333444','Diego Sánchez','Rivadavia 321');
insert into socios values('30333444','Sofía Romero','Hipólito Yrigoyen 654');
insert into socios values('31333444','Martín Díaz','Av. Corrientes 987');
insert into socios values('32333444','Laura Torres','Av. Santa Fe 258');
insert into socios values('33333444','Pedro Alvarez','Juan B. Justo 741');
insert into socios values('34333444','Ana Ruiz','Laprida 852');
insert into socios values('35333444','Jorge Gómez','Córdoba 963');

insert into libros (codigo, titulo, autor) values
(50,'El Aleph','Jorge Luis Borges'),
(51,'Cien años de soledad','Gabriel García Márquez'),
(52,'Rayuela','Julio Cortázar'),
(53,'Don Quijote de la Mancha','Miguel de Cervantes'),
(54,'La sombra del viento','Carlos Ruiz Zafón'),
(55,'El túnel','Ernesto Sabato'),
(56,'Sobre héroes y tumbas','Ernesto Sabato'),
(57,'Ficciones','Jorge Luis Borges'),
(58,'El amor en los tiempos del cólera','Gabriel García Márquez'),
(59,'El entenado','Juan José Saer');

insert into prestamos values('26333444', 50, '2025-04-01', null);
insert into prestamos values('27333444', 51, '2025-03-15', '2025-04-01');
insert into prestamos values('28333444', 52, '2025-03-20', null);
insert into prestamos values('29333444', 53, '2025-04-02', null);
insert into prestamos values('30333444', 54, '2025-03-25', '2025-03-30');
insert into prestamos values('31333444', 55, '2025-03-28', null);
insert into prestamos values('32333444', 56, '2025-04-01', null);
insert into prestamos values('33333444', 57, '2025-03-15', '2025-04-05');
insert into prestamos values('34333444', 58, '2025-03-22', null);
insert into prestamos values('35333444', 59, '2025-03-30', '2025-04-10');


-- Usanso la base de datos Libros responder la siguientes consultas.

-- 1- Que libros (codigo,titulo,autor) se le prestaron a cada 
-- socio.
select distinct s.documento, s.nombre, l.codigo,l.titulo, l.autor
from socios s
join prestamos p on p.documento = s.documento
join libros l on p.codigoLibro = l.codigo;
-- 2- Lista de socios (documento,nombre,domicilio) que se le 
-- presto libros de 'java' (like '%java%')
insert into socios values('22252568','Juan Garcia','Colon 123');
insert into libros values(44,'Aprenda Java','Mario Dominguez');
insert into prestamos values ('22252568',44,curdate(),null); 

select s.documento, s.nombre,s.domicilio
from socios s
join prestamos p on s.documento = p.documento
join libros l on l.codigo = p.codigoLibro
where titulo like '%java%';

-- 3- Lista de libros (codigo,titulo,autor) que no fueron 
-- devueltos (fechadevolucion is null)
select l.codigo, l.titulo,l.autor
from libros l
join prestamos p on l.codigo = p.codigoLibro
where fechadevolucion is null;
-- 4- Lista de socios (documento,nombre,domicilio) que tienen 
-- libros sin devolver.
select s.documento, s.nombre, s.domicilio
from socios s
join prestamos p on s.documento = p.documento
where fechadevolucion is null;
-- 5- Lista de socios (documento,nombre,domicilio) que tienen 
-- libros sin devolver y cuales son los libros.
select s.documento,s.nombre,s.domicilio, l.titulo, l.autor
from socios s
join prestamos p on s.documento = p.documento
join libros l on l.codigo = p.codigoLibro
where fechadevolucion is null;
-- 6- Cantidad de libros sin devolver.
select count(*) cantidad_Libros_Sin_Devolver
from prestamos
where fechadevolucion is null;

-- 7- Lista de libros que fueron prestados el día de hoy.
select * 
from libros l
join prestamos p on l.codigo = p.codigoLibro
where fechaprestamo =curdate();

-- 8-Cantidad de socios que se le prestaron libros en este mes.
select count(*) Cantidad_Socios
from socios s
join prestamos p on s.documento = p.documento
where month(fechaprestamo)=month(curdate()) and year(fechaprestamo)=year(curdate());

-- MAS CONSULTAS
-- 1. Mostrar el nombre del socio y los titulos de los libros que tiene prestados (incluso si no devolvio aun).
select s.nombre,l.titulo,p.fechaprestamo,p.fechadevolucion
from socios s
join prestamos p on s.documento = p.documento
join libros l on l.codigo = p.codigoLibro;

-- 2. Listar todos los socios junto con la cantidad total de libros que han prestado (incluyendo los que no han 
-- devuelto).
select s.nombre, count(*) cantidad_Libros
from socios s
left join prestamos p on s.documento = p.documento
group by s.nombre;
-- 3. Mostrar los libros que nunca fueron prestados.
select *
from libros l
left join prestamos p on l.codigo = p.codigoLibro
 where p.codigoLibro is null;
-- 4. Listar los socios que tienen prestamos activos (no han devuelto los libros).
select distinct s.documento, s.nombre, s.domicilio
from socios s
join prestamos p on s.documento = p.documento
where p.fechadevolucion is null;
-- 5. Mostrar el total de prestamos por libro, ordenados de mayor a menor.
select l.codigo, l.titulo, l.autor,count(p.codigoLibro) total_Prestamos
from libros l
join prestamos p on l.codigo = p.codigoLibro
group by l.codigo, l.titulo
order by total_Prestamos desc;
