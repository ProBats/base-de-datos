drop database if exists ejemplo_tm;
create database ejemplo_tm;
use ejemplo_tm;


CREATE TABLE Fabricantes (
  codigo INT NOT NULL,
  nombre VARCHAR(100) NULL,
  PRIMARY KEY (codigo)
  );


-- -----------------------------------------------------
-- Table mydb.Articulos
-- -----------------------------------------------------
CREATE TABLE Articulos (
  codigo INT NOT NULL,
  nombre VARCHAR(100) NULL,
  precio DOUBLE NULL,
  F_codigo INT NOT NULL,
  PRIMARY KEY (codigo),
    CONSTRAINT fk_Articulos_Fabricantes
    FOREIGN KEY (F_codigo)
    REFERENCES Fabricantes (codigo)
    );

show tables;

use ejemplo_tm;
INSERT INTO FABRICANTES (codigo, nombre) VALUES
(1, 'Fabricante A'),
(2, 'Fabricante B'),
(3, 'Fabricante C');

INSERT INTO ARTICULOS (codigo, nombre, precio, f_codigo) VALUES
(1, 'Producto 1', 100, 1),
(2, 'Producto 2', 150, 1),
(3, 'Producto 3', 200, 2),
(4, 'Producto 4', 50, 2),
(5, 'Producto 5', 80, 3),
(6, 'Producto 6', 180, 3),
(7, 'Producto 7', 220, 1),
(8, 'Producto 8', 120, 2),
(9, 'Producto 9', 90, 3);


-- 1 Obtener los nombres de los productos de la tienda.
select nombre from articulos;
-- 2 Obtener los nombres y los precios de los productos de la 
-- tienda.
select nombre,precio from articulos;
-- 3 Obtener el nombre de los productos cuyo precio sea menor o 
-- igual a $ 200.
select 	nombre from articulos
where	precio<=200;
-- 4 Obtener todos los datos de los artículos cuyo precio este 
-- entre los $ 60  y los $120 (Ambas cantidades incluidas).
select	* from articulos
where	precio between 60 and 120;
-- 5 Obtener el nombre y el precio en dólares (es decir, el precio 
-- peso multiplicado por 1000)
select 	nombre,precio/1000 precio_dolares
from	articulos;
-- 6 Seleccionar el precio medio de todos los productos.
select 	round(avg (precio),2) precio_promedio
from	articulos;
-- 7 Obtener el precio medio de los  artículos  cuyo código de  
-- fabricante  sea 2.
select 	round(avg (precio),2) precio_promedio
from	articulos
where	f_codigo=2;
-- 8 Obtener el número de artículos cuyo precio sea mayor o igual 
-- a $ 180.
select 	count(*) cantidad_articulos
from	articulos
where	precio>=180;
-- 9 Obtener el nombre y precio de los artículos cuyo precio sea 
-- mayor o igual a $ 180 y ordenarlos descendentemente por precio, 
-- y luego ascendentemente por nombre.
select		nombre,precio from articulos
where		precio>=180
order by	precio desc,nombre asc;
-- 10 Obtener un listado completo de artículos, incluyendo por 
-- cada artículo los datos del artículo y de su fabricante.
select	* from articulos a
join	fabricantes f 
on		a.f_codigo=f.codigo;
-- 11 Obtener un listado de artículos, incluyendo el nombre del 
-- artículo, su precio, y el nombre de su fabricante.
select	a.nombre,a.precio,f.nombre
from	articulos a
join	fabricantes f
on		a.f_codigo=f.codigo;
-- 12 Obtener el precio medio de los productos de cada fabricante, 
-- mostrando solo los códigos  de  fabricante.
select		round(avg(a.precio),2) precio_promedio, f.codigo
from		articulos a
join		fabricantes f 
on			a.f_codigo=f.codigo
group by 	f.codigo;
-- 13 Obtener el precio medio de los productos de cada fabricante,
--  mostrando el nombre del fabricante.
select		round(avg(a.precio),2) precio_promedio, f.nombre
from		articulos a
join		fabricantes f 
on			a.f_codigo=f.codigo
group by 	f.nombre;
-- 14 Obtener los nombres de los fabricantes que ofrezcan productos
--  cuyo precio medio sea mayor o igual a $150.
select		distinct f.nombre 
from		articulos a 
join		fabricantes f 
on			a.f_codigo=f.codigo
group by	f.nombre
having		avg(precio) >=150;

-- 15 Obtener el nombre y precio  del artículo más barato.
select		nombre,precio
from		articulos 
order by 	precio asc limit 1;

select		nombre,precio
from		articulos
where		precio=(select min(precio)
from		articulos);
-- 16 Obtener  una  lista  con  el  nombre  y  precio  de  los  
-- artículos  más  caros  de  cada  proveedor 
-- (incluyendo el nombre del proveedor).
select		a.nombre,f.nombre,max(a.precio) Precio_maximo
from		articulos a 
join		fabricantes f 
on			a.f_codigo=f.codigo
group by	f.nombre;
-- 17 Añadir un nuevo producto: Altavoces de  $ 70   
-- (del fabricante 2)
INSERT INTO ARTICULOS (codigo, nombre, precio, f_codigo) VALUES
(10, 'Altavoces', 70, 2);
-- 18 Cambiar el nombre del producto 8 a Impresora Láser
update 	articulos set nombre='impresora laser'
where	nombre='producto 8';
-- 19 Aplicar un descuento del 10 % (multiplicar el precio por 0,9) a todos los productos.
update	articulos set precio=precio*0.9;

-- ejercicio de diagrama de EER
use ejemplo_tm;
CREATE TABLE IF NOT EXISTS Clientes (
  idClientes INT NOT NULL,
  dni VARCHAR(8) NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  PRIMARY KEY (idClientes));



CREATE TABLE IF NOT EXISTS Factura (
  id INT NOT NULL,
  precio DOUBLE NULL,
  iva DOUBLE NULL,
  subtotal DOUBLE NULL,
  total DOUBLE NULL,
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Factura_Clientes
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Detalle (
  id INT NOT NULL,
  cantidad INT NULL,
  total INT NULL,
  Factura_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Detalle_Factura1
    FOREIGN KEY (Factura_id)
    REFERENCES Factura(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    