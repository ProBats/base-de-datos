drop database if exists almacenes_tm;
create database  almacenes_tm;
use almacenes_tm;

CREATE TABLE IF NOT EXISTS almacenes (
  codigo INT NOT NULL,
  lugar VARCHAR(100) NOT NULL,
  capacidad INT NOT NULL,
  PRIMARY KEY (codigo));


CREATE TABLE IF NOT EXISTS cajas (
  num_referencia INT NOT NULL,
  contenido VARCHAR(100) NOT NULL,
  valor INT NOT NULL,
  almacen INT NOT NULL,
  PRIMARY KEY (num_referencia),
  CONSTRAINT fk_cajas_almacenes
    FOREIGN KEY (almacen)
    REFERENCES almacenes (codigo));
    
    
    -- EJERCICIOS
-- 1.Obtener todos los almacenes
select * from almacenes;

-- 2.Obtener todas las cajas cuyo contenido tenga un valor superior a 150 ¤.
select * 
from cajas
where valor > 150; 

-- 3.Obtener los tipos de contenidos de las cajas.
select distinct contenido
from cajas;

-- 4.Obtener el valor medio de todas las cajas.
select  round(avg(valor),2) valor_Medio
from cajas;

-- 5.Obtener el valor medio de las cajas de cada almacén. Obtener  los  códigos  de  los  almacenes  
-- en  los  cuales  el  valor  medio  de  las  cajas  sea superior a 150 ¤.
select almacen, round(avg(valor),2) valor_Medio
from cajas
group by almacen
having avg(valor)>150;

-- 6.Obtener el número de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra.
select c.num_referencia, a.lugar
from cajas c 
join almacenes a on c.almacen = a.codigo;
-- 7.Obtener el número de  cajas  que  hay en cada  almacén.
select a.lugar, count(*)
from cajas c
join almacenes a on c.almacen = a.codigo
group by a.lugar;
-- 8.Obtener los códigos de los almacenes que están saturados (los almacenes donde el número de cajas 
-- es superior a la capacidad).
select codigo
from almacenes a
where capacidad<(select count(*) cantidad_cajas from cajas where almacen = codigo);

-- 9.Obtener los  números  de  referencia  de  las cajas  que  están en Bilbao.
select num_referencia
from almacenes a
left join cajas c on c.almacen = a.codigo
where lugar ='Bilbao';
-- 10.Insertar un nuevo  almacén en Barcelona  con capacidad para 3  cajas.
insert into almacenes(lugar, capacidad) values ('Barcelona',3);
-- 11.Insertar una nueva caja, con número de referencia ‘H5RT’, con contenido ‘Papel’, valor 200, 
-- y situada  en el almacén 2.
insert into cajas() values('H5RT','Papel',200,2);

-- 12.Rebajar el valor de todas las cajas un 15 %.
update cajas set valor = valor*0.85;

-- 13.Rebajar un 20 % el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.
update cajas set valor=valor*0.80 where valor >(select avg(valor) from cajas);
-- 14.Eliminar todas las cajas cuyo valor sea inferior a 100 ¤.
delete from cajas where valor< 100;
-- 15.Vaciar el contenido de  los  almacenes  que  están saturados.
delete from almacenes where capacidad < (select count(*) cantidad from cajas where almacen = codigo);



-- ####################################################################################################

drop database if exists hoteles_tm;
create database  hoteles_tm;
use hoteles_tm;

CREATE TABLE IF NOT EXISTS habitaciones (
  habitacionNumero INT NOT NULL,
  precioPorNoche DECIMAL(8,2) NOT NULL,
  piso INT NOT NULL,
  maxPersonas TINYINT NOT NULL,
  tieneCamaBebe TINYINT NOT NULL,
  tieneDucha TINYINT NOT NULL,
  tieneBano TINYINT NOT NULL,
  tieneBalcon TINYINT NOT NULL,
  PRIMARY KEY (habitacionNumero)
  );



CREATE TABLE IF NOT EXISTS huespedes (
  huespedId INT NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  telefono DOUBLE NOT NULL,
  correo VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  pais VARCHAR(45) NOT NULL,
  PRIMARY KEY (huespedId)
  );


CREATE TABLE IF NOT EXISTS reservas (
  reservasId INT NOT NULL,
  inicioFecha DATETIME NOT NULL,
  finFecha DATETIME NOT NULL,
  habitacion INT NOT NULL,
  huesped INT NOT NULL,
  PRIMARY KEY (reservasId),
  CONSTRAINT fk_reservas_habitaciones1
    FOREIGN KEY (habitacion)
    REFERENCES habitaciones (habitacionNumero)
    ON DELETE cascade,
  CONSTRAINT fk_reservas_huespedes1
    FOREIGN KEY (huesped)
    REFERENCES huespedes (huespedId)
    ON DELETE cascade
    );

insert into habitaciones values
(1,20000,1,3,0,1,1,1),
(2,25000,1,3,0,1,1,1),
(3,28000,1,3,0,1,1,1),
(4,32000,2,4,0,1,1,1),
(5,25000,2,4,0,1,1,1),
(6,32000,2,4,0,1,1,1);

insert into huespedes values
(1,'Lorena','Martinez','1111111','lorem@gmail.com',
'castillo 123','caba','argentina'),
(2,'Pablo','Gomez','2222222','pablog@gmail.com',
'San luis 456','caba','argentina'),
(3,'Paula','Perez','3333333','paulap@gmail.com',
'Mendoza 789','caba','argentina'),
(4,'Mariano','Alonso','4444444','marianoa@gmail.com',
'Cordoba 369','caba','argentina'),
(5,'Carlos','Tijera','4444555','carlost@gmail.com',
'Maipu 370','caba','argentina'),
(6,'Leticia','padilla','3334555','leticiap@gmail.com',
'brazil 390','caba','argentina');

insert into reservas values
(1,curtime(),'2024/11/10',1,1),
(2,curtime(),'2024/11/08',2,2),
(3,curtime(),'2024/11/04',3,3),
(4,curtime(),'2024/11/06',4,4),
(5,'2024/11/02','2024/11/07',5,3),
(6,'2024/11/03','2024/11/10',6,4);

-- RESOLVER LAS SIGUIENTES CONSULTAS
-- 1. Obtener todas las habitaciones disponibles
-- 2. Consultar reservas con información de los huéspedes
-- 3. Obtener el total de reservas por huésped
-- 4. Listar las habitaciones ocupadas en una fecha específica
-- 5. Obtener información de reservas junto con el precio total
-- 6. Buscar huéspedes por ciudad
-- 7. Actualizar el precio de una habitación
-- 8. Eliminar una reserva
-- 9. Contar el número total de habitaciones por piso
-- 10.Listar todos los huéspedes que han reservado habitaciones 
-- en un rango de fechas
-- 11.Obtener habitaciones que permiten más de un cierto número de  personas
-- 12.Listar huéspedes que han reservado una habitación con ducha
-- 13.Encontrar la habitación más cara
-- 14.Obtener las reservas que terminan hoy
-- 15.Obtener el promedio de precio por noche de las habitaciones
-- 16.Mostrar habitaciones que tienen balcón
-- 17.Buscar reservas de un huésped específico
-- 18.Listar habitaciones y sus respectivos huéspedes
-- 19.Contar el número de reservas por habitación
-- 20.Eliminar huéspedes que no tienen reservas