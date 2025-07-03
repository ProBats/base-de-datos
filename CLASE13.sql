-- Laboratorio 14

drop database if exists blog_tm;
create database blog_tm;
use blog_tm;
-- postead
-- post
-- comentarios
-- perfil
-- usuario

-- Table mydb.posteado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS posteado (
  id_posteado INT NOT NULL,
  detalle VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_posteado));


-- -----------------------------------------------------
-- Table mydb.perfil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS perfil (
  id_perfil INT NOT NULL,
  detalle VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_perfil));


-- -----------------------------------------------------
-- Table mydb.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  email VARCHAR(150) NOT NULL,
  fechaCreacion DATETIME NOT NULL,
  id_perfil INT NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_perfil1
    FOREIGN KEY (id_perfil)
    REFERENCES perfil (id_perfil)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table mydb.post
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS post (
  id_post INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  cuerpo TEXT NOT NULL,
  fechaCreacion DATETIME NOT NULL,
  id_usuario INT NOT NULL,
  id_posteado INT NOT NULL,
  PRIMARY KEY (id_post),
  CONSTRAINT fk_post_usuario1
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_post_posteado1
    FOREIGN KEY (id_posteado)
    REFERENCES posteado (id_posteado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table mydb.comentarioEstado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comentarioEstado (
  id_comentarioEstado INT NOT NULL,
  detalle VARCHAR(45) NULL,
  PRIMARY KEY (id_comentarioEstado));


-- -----------------------------------------------------
-- Table mydb.comentario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comentario (
  id_comentario INT NOT NULL,
  comentario TEXT NOT NULL,
  fechaCreacion VARCHAR(45) NOT NULL,
  id_usuario INT NOT NULL,
  id_post INT NOT NULL,
  id_comentarioEstado INT NOT NULL,
  PRIMARY KEY (id_comentario),
  CONSTRAINT fk_comentario_usuario1
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_comentario_post1
    FOREIGN KEY (id_post)
    REFERENCES post (id_post)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_comentario_comentarioEstado1
    FOREIGN KEY (id_comentarioEstado)
    REFERENCES comentarioEstado (id_comentarioEstado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

