-- TRABAJO PRACTICO N°1

drop database if exists empanadas;
CREATE database empanadas;
USE empanadas ;

-- -----------------------------------------------------
-- Table tipoEmpanada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipoEmpanada (
  id_tipo_empanada INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  id_gusto VARCHAR(45) NOT NULL,
  descripcion VARCHAR(180) NULL,
  PRIMARY KEY (id_tipo_empanada));


-- -----------------------------------------------------
-- Table venta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS venta (
  id_venta INT NOT NULL,
  fecha_venta DATETIME NOT NULL,
  cantidad_vendida INT NOT NULL,
  precio_facturacion_final DOUBLE NOT NULL,
  id_tipoEmpanada INT NOT NULL,
  PRIMARY KEY (id_venta),
  CONSTRAINT fk_venta_tipoEmpanada
    FOREIGN KEY (id_tipoEmpanada)
    REFERENCES tipoEmpanada (id_tipo_empanada)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Insertar tipos de empanadas
INSERT INTO tipoEmpanada 
(id_tipo_empanada, nombre, id_gusto, descripcion) VALUES
(1, "salteñas", 1, "empanadas estilo salteñas"),
(2, "tucumanas", 2, "empanadas estilo tucumanas"),
(3, "catamarqueñas", 3, "empanadas estilo catamarqueñas"),
(4, "jujeñas", 4, "empanadas estilo jujeñas");


-- Insertar ventas
INSERT INTO venta
(id_venta, fecha_venta, id_tipoEmpanada, cantidad_vendida, precio_facturacion_final) VALUES

(2, '2024-06-05', 1, 48, 38400),
(3, '2024-06-05', 2, 12, 9600),
(4, '2024-06-05', 2, 16, 12800),
(5, '2024-06-05', 3, 15, 12000),
(6, '2024-06-05', 3, 24, 19200),
(7, '2024-06-05', 4, 12, 9600),
(8, '2024-06-05', 4, 48, 38400);

select * from venta;
select * from tipoEmpanada;

-- 1 La consulta que puedes utilizar para obtener el `id_venta`, `precio_facturacion_final` y `nombre` de la empanada (ordenado alfabéticamente por el tipo de empanada) con una condición sobre la cantidad vendida (entre 10,000 y 20,000 unidades)  
select v.id_venta, v.precio_facturacion_final, te.nombre
from venta v
join tipoEmpanada te on te.id_tipo_empanada = v.id_tipoEmpanada
where v.precio_facturacion_final between 10000 and 20000
order by te.nombre;

-- 2 Listar todas las ventas junto con el nombre del tipo de empanada y la cantidad vendida
-- Esta consulta devolverá todas las ventas y su información relacionada, mostrando el tipo de empanada y la cantidad vendida.

select te.nombre, v.id_venta, v.cantidad_vendida
from venta v
join tipoEmpanada te on te.id_tipo_empanada = v.id_tipoEmpanada;

-- 3 Obtener el total de ventas por tipo de empanada
-- En este caso, se agrupan las ventas por tipo de empanada y se muestra el total de la facturación para cada tipo.

select te.nombre, sum(v.precio_facturacion_final) 'total Venta por empanada'
from tipoEmpanada te
join venta v on v.id_tipoEmpanada = te.id_tipo_empanada
group by te.nombre;
