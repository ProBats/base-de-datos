drop database if exists ferreteria;
create database ferreteria;
use ferreteria;

-- -----------------------------------------------------
-- Table piezas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS piezas (
  cod_pieza INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (cod_pieza));


-- -----------------------------------------------------
-- Table proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS proveedores (
  id_proveedor CHAR(4) NOT NULL,
  nombre VARCHAR(100) NULL,
  PRIMARY KEY (id_proveedor));


-- -----------------------------------------------------
-- Table suministra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS suministra (
  precio INT NULL,
  id_proveedor CHAR(4) NOT NULL,
  cod_pieza INT NOT NULL,
  CONSTRAINT fk_suministra_proveedores
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores (id_proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_suministra_piezas1
    FOREIGN KEY (cod_pieza)
    REFERENCES piezas (cod_pieza)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




    
insert into piezas (cod_pieza, nombre) VALUES
(1, 'tuercas'),
(2, 'tornillos'),
(3, 'arandelas'),
(4, 'clavos');

insert into proveedores (id_proveedor, nombre) VALUES
('HAL', 'HAL Corp.'),
('RBT', 'Susan Calvin Corp.');

insert into suministra (cod_pieza, id_proveedor, precio) VALUES
(1, 'HAL', 10),
(2, 'HAL', 15),
(3, 'RBT', 20),
(4, 'RBT', 25);

-- 1. Seleccionar todas las piezas con sus respectivos proveedores y precios

select pi.nombre Pieza, pr.nombre Proveedor, s.precio Precio
from suministra s
join piezas pi on pi.cod_pieza = s.cod_pieza
join  proveedores pr on pr.id_proveedor = s.id_proveedor;

-- 2. Consultar todos los proveedores que suministran una pieza específica. Ej:'tuercas'
select pr.nombre Proveedor, pi.nombre Pieza
from suministra s
join piezas pi on pi.cod_pieza = s.cod_pieza
join proveedores pr on pr.id_proveedor = s.id_proveedor
where pi.nombre='tuercas';

-- 3. Ver el precio más bajo para cada pieza.
select pi.nombre,min(s.precio) precio_minimo
from suministra s
join piezas pi on pi.cod_pieza = s.cod_pieza
group by pi.nombre;

-- 4. Consultar los proveedores que tienen un precio mayor que un valor específico, ej: 15
select pr.nombre Proveedor,pi.nombre,s.precio Precio
from suministra s
join piezas pi on pi.cod_pieza =s.cod_pieza 
join proveedores pr on pr.id_proveedor = s.id_proveedor
where s.precio >15;

-- 5. Obtener las piezas que no están siendo suministradas por ningún proveedor
INSERT INTO piezas (cod_pieza, nombre) VALUES
(5, 'bisagras'),
(6, 'pernos'),
(7, 'tornillos de banco');

select pi.nombre Piezas
from piezas pi
left join suministra s on s.cod_pieza = pi.cod_pieza
where s.cod_pieza is null;

-- 6. Contar cuántos proveedores suministran cada pieza

-- 7. Obtener los proveedores con más piezas suministradas
-- 8. Actualizar el precio de una pieza específica de un proveedor
-- 9. Eliminar una pieza y sus registros relacionados
-- 10. Hacer constar en la base de datos que la empresa ”Skellington Supplies”(código TNBC) va a 
-- empezar a suministrarnos tuercas (código 1) a 7 dolares cada tuerca.

