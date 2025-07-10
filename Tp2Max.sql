drop database if exists postre;
create database postre;
use postre;
-- -----------------------------------------------------
-- Table postre
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS postre (
  id_postre INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(180) NULL,
  precio_unitario DOUBLE NOT NULL,
  PRIMARY KEY (id_postre, precio_unitario));


-- -----------------------------------------------------
-- Table venta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS venta (
  id_venta INT NOT NULL auto_increment,
  fecha_venta DATETIME NOT NULL,
  cantidad_vendida INT NOT NULL,
  precio_facturacion_final DOUBLE NOT NULL,
  id_postre INT NOT NULL,
  PRIMARY KEY (id_venta),
  CONSTRAINT fk_venta_postre1
    FOREIGN KEY (id_postre)
    REFERENCES postre (id_postre)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
insert into postre (id_postre,nombre,descripcion,precio_unitario) values
(1,'Pasta Frola','Torta con dulce de membrillo o batata',500),
(2,'Budin','Budin de pan',300),
(3,'Rosca de Pascua','Rosca gigante para pascuas',470),
(4,'Pan Dulce','Pan dulce con chips de chocolate',1200),
(5,'Torta','Torta para cumpleaños',4500);

insert into venta (fecha_venta,id_postre,cantidad_vendida,precio_facturacion_final) values
('2024-06-13 13:20:10',2,4,1200),
('2024-06-14 13:40:18',3,2,940),
('2024-06-15 12:10:25',5,3,13500),
('2024-06-16 11:35:10',1,4,2000),
('2024-06-17 09:37:28',2,1,300);

-- 1 La consulta debe listar los campos id_venta, precio_facturacion_final y el nombre del postre 
-- para las ventas que tengan un precio_facturacion_final entre 800 y 2000 pesos, ordenados alfabéticamente por el nombre del postre.

select p.nombre, v.id_venta, v.precio_facturacion_final 
from venta v
join postre p on p.id_postre = v.id_postre
where v.precio_facturacion_final between 800 and 2000
order by p.nombre;

-- 2 Obtener el total de ventas por cada tipo de postre (sumando las cantidades y precios)

select p.nombre, sum(v.cantidad_vendida) 'Cantidad vendida',p.precio_unitario 'Valor Unitario', sum(v.precio_facturacion_final) 'Total'
from venta v
join postre p on p.id_postre = v.id_postre
group by p.nombre
order by p.nombre;

-- 3 Obtener el postre con el precio de facturación promedio más alto
select p.id_postre, p.nombre, avg(v.precio_facturacion_final) promedio_facturacion
from postre p
join venta v on v.id_postre = p.id_postre
group by p.id_postre 
order by avg(v.precio_facturacion_final) DESC
LIMIT 1;
