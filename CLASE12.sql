drop database if exists biblioteca_TM;
CREATE DATABASE biblioteca_TM ;
USE biblioteca_TM ;

-- -----------------------------------------------------
-- Table tipoSocio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipoSocio (
  categoriaSocio VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (categoriaSocio));


-- -----------------------------------------------------
-- Table socios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS socios (
  codSocio INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  celular VARCHAR(20) NULL,
  dni VARCHAR(8) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  codigoPostal VARCHAR(12) NOT NULL,
  email VARCHAR(45) NULL,
  categoriaSocio VARCHAR(45) NOT NULL,
  PRIMARY KEY (codSocio),
  CONSTRAINT fk_socios_tipoSocio1
    FOREIGN KEY (categoriaSocio)
    REFERENCES tipoSocio (categoriaSocio)
    on delete cascade);


-- -----------------------------------------------------
-- Table mydb.tipoLibro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipoLibro (
  codTipoLibro INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (codTipoLibro));


-- -----------------------------------------------------
-- Table libros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libros (
  codLibro INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  autor VARCHAR(45) NOT NULL,
  editorial VARCHAR(45) NOT NULL,
  fechaPublicacion DATE NULL,
  codTipoLibro INT NOT NULL,
  PRIMARY KEY (codLibro),
  CONSTRAINT fk_libros_tipoLibro
    FOREIGN KEY (codTipoLibro)
    REFERENCES tipoLibro (codTipoLibro)
    on delete cascade);


-- -----------------------------------------------------
-- Table reserva
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS reserva (
  fechaReserva DATE NOT NULL,
  codLibro INT NOT NULL,
  codSocio INT NOT NULL,
  PRIMARY KEY (fechaReserva, codLibro, codSocio),
  CONSTRAINT fk_reserva_libros1
    FOREIGN KEY (codLibro)
    REFERENCES libros (codLibro)
    on delete cascade,
  CONSTRAINT fk_reserva_socios1
    FOREIGN KEY (codSocio)
    REFERENCES socios (codSocio)
    on delete cascade);


INSERT INTO tipoSocio (categoriaSocio, descripcion) VALUES
('Activo', 'Socio con derechos completos'),
('Adherente', 'Acceso limitado a servicios'),
('Honorario', 'Reconocimiento especial'),
('Estudiante', 'Socio con descuento'),
('Jubilado', 'Socio con beneficios'),
('Familiar', 'Socio por parentesco'),
('Invitado', 'Acceso temporal'),
('Temporal', 'Membresía por tiempo limitado'),
('Corporativo', 'Socio empresa'),
('Voluntario', 'Socio colaborador');

INSERT INTO tipoLibro (codTipoLibro, descripcion) VALUES
(1, 'Ficción'),
(2, 'No Ficción'),
(3, 'Ciencia'),
(4, 'Historia'),
(5, 'Biografía'),
(6, 'Tecnología'),
(7, 'Arte'),
(8, 'Infantil'),
(9, 'Autoayuda'),
(10, 'Educativo');
		
INSERT INTO socios (codSocio, nombre, apellido, telefono, celular, dni, direccion, codigoPostal, email, categoriaSocio) VALUES
(1, 'Carlos', 'Pérez', '123456789', '987654321', '12345678', 'Av. Siempre Viva 123', '1000', 'carlos@example.com', 'Activo'),
(2, 'Laura', 'Gómez', '234567890', NULL, '87654321', 'Calle Falsa 456', '2000', 'laura@example.com', 'Adherente'),
(3, 'María', 'López', '345678901', '111222333', '23456789', 'Pasaje Luna 789', '3000', NULL, 'Honorario'),
(4, 'Jorge', 'Díaz', '456789012', NULL, '34567890', 'Calle 10 N°55', '4000', 'jorge@example.com', 'Estudiante'),
(5, 'Ana', 'Martínez', '567890123', '333444555', '45678901', 'Boulevard Este 12', '5000', 'ana@example.com', 'Jubilado'),
(6, 'Diego', 'Suárez', '678901234', '444555666', '56789012', 'Ruta 8 Km 90', '6000', 'diego@example.com', 'Familiar'),
(7, 'Valeria', 'Méndez', '789012345', NULL, '67890123', 'Calle Sur 21', '7000', NULL, 'Invitado'),
(8, 'Rosa', 'Ramírez', '890123456', '555666777', '78901234', 'Av. Oeste 45', '8000', 'rosa@example.com', 'Temporal'),
(9, 'Nicolás', 'Fernández', '901234567', '666777888', '89012345', 'Diagonal Norte 3', '9000', 'nico@example.com', 'Corporativo'),
(10, 'Cecilia', 'Herrera', '012345678', '777888999', '90123456', 'Zona Rural S/N', '10000', 'ceci@example.com', 'Voluntario');

INSERT INTO libros (codLibro, nombre, autor, editorial, fechaPublicacion, codTipoLibro) VALUES
(1, 'Viaje Estelar', 'A. Luna', 'Galaxia Books', '2020-01-01', 1),
(2, 'Realidades', 'B. Torres', 'Editorial Sur', '2019-03-12', 2),
(3, 'Ciencia para Todos', 'C. Álvarez', 'Ciencia Hoy', '2021-06-22', 3),
(4, 'Grandes Batallas', 'D. Márquez', 'HistoriArte', '2018-11-30', 4),
(5, 'La Vida de Tesla', 'E. Newton', 'Bio Ediciones', '2020-05-10', 5),
(6, 'Programar Fácil', 'F. Linarez', 'TecnoPrint', '2022-08-15', 6),
(7, 'Arte Moderno', 'G. Picasso', 'Arte XXI', '2017-10-01', 7),
(8, 'Cuentos Infantiles', 'H. Molina', 'Niñez Feliz', '2021-12-01', 8),
(9, 'Sé Tu Mejor Versión', 'I. Paredes', 'Autoayuda YA', '2023-02-18', 9),
(10, 'Matemática Básica', 'J. Ramos', 'Educando', '2016-04-05', 10);

INSERT INTO reserva (fechaReserva, codLibro, codSocio) VALUES
('2025-06-01', 1, 1),
('2025-06-02', 2, 2),
('2025-06-03', 3, 3),
('2025-06-04', 4, 4),
('2025-06-05', 5, 5),
('2025-06-06', 6, 6),
('2025-06-07', 7, 7),
('2025-06-08', 8, 8),
('2025-06-09', 9, 9),
('2025-06-10', 10, 10);

-- vistas

create view biblioteca_tm as select ts.categoriaSocio, ts.descripcion descripcion_tipo_Socio, 
									s.codSocio, s.nombre , s.apellido, s.telefono, s.celular, s.dni, s.direccion, s.codigoPostal, s.email,
                                    r.fechaReserva, 
                                    l.nombre nombre_Libro, l.autor, l.editorial, l.fechaPublicacion,
                                    tl.codTipoLibro, tl.descripcion descripcion_tipo_libro
from tipoSocio ts
join socios s on ts.categoriaSocio = s.categoriaSocio
join reserva r on s.codSocio = r.codSocio
join libros l on l.codLibro = r.codLibro
join tipoLibro tl on tl.codTipoLibro = l.codTipoLibro;

show tables;
-- borrar una vista

drop view biblioteca_tm; -- para borrar la vista
show tables;

-- CONSULTAS
-- A que socio se le presto Matemática Básica
select nombre, apellido
from biblioteca_tm
where descripcion_tipo_libro ='Educativo';

-- que se le presto a Jorge Díaz
select descripcion_tipo_libro, nombre_libro,autor
from biblioteca_tm
where nombre ='Jorge' and apellido ='Díaz';
-- que clase de socio es Jorge Díaz
select descripcion_tipo_socio
from biblioteca_tm
where nombre ='Jorge' and apellido ='Díaz';
-- cuantos libros se le prestaron a los socios temporales
select count(*) cantidad_libros
from biblioteca_tm
where categoriaSocio='Temporal';

-- A quienes se le prestaron manuales
select nombre , apellido
from biblioteca_tm
where descripcion_tipo_libro ='Arte';

-- Cuantos libros se le prestaron a Jorge Díaz
select count(*) cantidad_libros
from biblioteca_tm

 