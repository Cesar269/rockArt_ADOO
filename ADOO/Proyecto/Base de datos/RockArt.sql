drop database if exists RockArt;
create database RockArt;
use RockArt;

CREATE TABLE Compania_de_grabacion
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(50) NOT NULL,
  Direccion VARCHAR(300) NOT NULL,
  Sitio_web VARCHAR(300) NOT NULL,
  Telefono BIGINT NOT NULL
);

CREATE TABLE Banda
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(50) NOT NULL
);


CREATE TABLE Usuarios
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(20) NOT NULL,
  Apellido_Paterno VARCHAR(20) NOT NULL,
  Apellido_Materno VARCHAR(20) NOT NULL,
  Genero CHAR NOT NULL,
  Ciudad_de_nacimiento VARCHAR(50) NOT NULL,
  Correo_electronico VARCHAR(50) NOT NULL,
  Telefono BIGINT NOT NULL,
  Contrasenia VARCHAR(25) NOT NULL
);

CREATE TABLE Artista
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(20) NOT NULL,
  Apellido_Paterno VARCHAR(20) NOT NULL,
  Apellido_Materno VARCHAR(20) NOT NULL,
  Genero CHAR NOT NULL,
  Ciudad_de_nacimiento VARCHAR(50) NOT NULL,
  Biografia VARCHAR(500) NOT NULL,
  Sitio_web VARCHAR(50) NOT NULL
);


CREATE TABLE Musico
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(20) NOT NULL,
  Apellido_Paterno VARCHAR(20) NOT NULL,
  Apellido_Materno VARCHAR(20) NOT NULL,
  Instrumento VARCHAR(50) NOT NULL,
  Ciudad_de_nacimiento VARCHAR(50) NOT NULL
);



CREATE TABLE Registro_Banda_Artistas
(
  Id INT NOT NULL auto_increment primary key,
  Id_Banda INT NOT NULL,
  Id_Artista INT NOT NULL,
  FOREIGN KEY (Id_Banda) REFERENCES Banda(Id) on delete cascade,
  FOREIGN KEY (Id_Artista) REFERENCES Artista(Id) on delete cascade
);

CREATE TABLE Registro_Banda_Musicos
(
  Id INT NOT NULL auto_increment primary key,
  Id_Banda INT NOT NULL,
  Id_Musico INT NOT NULL,
  FOREIGN KEY (Id_Banda) REFERENCES Banda(Id) on delete cascade,
  FOREIGN KEY (Id_Musico) REFERENCES Musico(Id) on delete cascade
);


CREATE TABLE Album
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(50) NOT NULL,
  Anio INT NOT NULL,
  Numero_de_pistas INT NOT NULL,
  Id_Banda INT NOT NULL,
  Id_Compania_Grabacion INT NOT NULL,
  Imagen_de_portada VARCHAR(150) NOT NULL,
  Imagen_de_contraportada VARCHAR(150) NOT NULL,
  FOREIGN KEY (Id_Compania_Grabacion) REFERENCES Compania_de_grabacion(Id) on delete cascade,
  FOREIGN KEY (Id_Banda) REFERENCES Banda(Id) on delete cascade
);

CREATE TABLE Canciones
(
  Id INT NOT NULL auto_increment primary key,
  Nombre VARCHAR(30) NOT NULL,
  Duracion VARCHAR(10) NOT NULL,
  Id_Album INT NOT NULL,
  Numero_de_pista_del_album INT NOT NULL,
  FOREIGN KEY (Id_Album) REFERENCES Album(Id) on delete cascade
);

CREATE TABLE Tablatura
(
  Id INT NOT NULL auto_increment primary key,
  Fecha DATE NOT NULL,
  URL VARCHAR(150) NOT NULL,
  Traductor VARCHAR(100) NOT NULL,
  Correo_del_traductor VARCHAR(50) NOT NULL,
  Id_Cancion INT NOT NULL,
  FOREIGN KEY (Id_Cancion) REFERENCES Canciones(Id) on delete cascade
);

CREATE TABLE Artistas_invitados
(
  Id INT NOT NULL auto_increment primary key,
  Id_musico INT NOT NULL,
  Id_Cancion INT NOT NULL,
  FOREIGN KEY (Id_musico) REFERENCES Musico(Id) on delete cascade,
  FOREIGN KEY (Id_Cancion) REFERENCES Canciones(Id) on delete cascade
);

insert into Usuarios (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Correo_electronico,Telefono,Contrasenia) values ('Reyna Elia','Melara','Abarca','F','CDMX','reynaelia@ipn.mx',5567864312,'Tienen10');

insert into Usuarios (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Correo_electronico,Telefono,Contrasenia) values ('Alejandro','Enriquez','Rivera','M','Tlaxcala','alex@hotmail.com',5567864312,'123');

insert into Artista (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Biografia,Sitio_web) values ("Alejandro","Enriquez","Rivera","M","Tlaxcala","Esta es mi biografia","Este es mi sitio web");

insert into Artista (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Biografia,Sitio_web) values ("Cesar","Leal","Hernandes","F","Disneylandia","Esta es mi biografia","Este es mi sitio web");

insert into Artista (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Biografia,Sitio_web) values ("Alejandro","Enriquez","Harper","M","EUUA","Esta es mi biografia","Este es mi sitio web");

insert into Musico (Nombre,Apellido_Paterno,Apellido_Materno,Instrumento,Ciudad_de_nacimiento) values ("Alejandro","Enriquez","Rivera","Guitarra","Tlaxcala");

insert into Musico (Nombre,Apellido_Paterno,Apellido_Materno,Instrumento,Ciudad_de_nacimiento) values ("Cesar","Leal","Hernandez","Guitarra","Disneylandia");

insert into Musico (Nombre,Apellido_Paterno,Apellido_Materno,Instrumento,Ciudad_de_nacimiento) values ("David","Madrigal","Buendia","Piano","CDMX");

insert into Compania_de_grabacion (Nombre,Direccion,Sitio_web,Telefono) values ("Compania 1","Direccion 1","Sitio web 1",7564756489);

insert into Compania_de_grabacion (Nombre,Direccion,Sitio_web,Telefono) values ("Compania 2","Direccion 2","Sitio web 2",7564356333);

insert into Compania_de_grabacion (Nombre,Direccion,Sitio_web,Telefono) values ("Compania 3","Direccion 3","Sitio web 3",1829892765);

insert into Banda (Nombre) values ("Banda 1");

insert into Banda (Nombre) values ("Banda 2");

insert into Banda (Nombre) values ("Banda 3");

insert into Album (Nombre,Anio,Numero_de_pistas,Id_Banda,Id_Compania_Grabacion,Imagen_de_portada,Imagen_de_contraportada) values("Album 1",2000,11,1,2,"Imagenes de un album/Portada.png","Imagenes de un album/Contraportada.png");

insert into Album (Nombre,Anio,Numero_de_pistas,Id_Banda,Id_Compania_Grabacion,Imagen_de_portada,Imagen_de_contraportada) values("Album 2",2001,1,2,1,"Imagenes de un album/Portada.png","Imagenes de un album/Contraportada.png");

insert into Album (Nombre,Anio,Numero_de_pistas,Id_Banda,Id_Compania_Grabacion,Imagen_de_portada,Imagen_de_contraportada) values("Album 3",2002,41,3,3,"Imagenes de un album/Portada.png","Imagenes de un album/Contraportada.png");

insert into Canciones (Nombre,Duracion,Id_Album,Numero_de_pista_del_album) values ("Cancion 1", "4:00",1,3);

insert into Canciones (Nombre,Duracion,Id_Album,Numero_de_pista_del_album) values ("Cancion 2", "4:30",2,1);

insert into Canciones (Nombre,Duracion,Id_Album,Numero_de_pista_del_album) values ("Cancion 3", "3:00",3,2);

insert into Tablatura (Fecha,URL,Traductor,Correo_del_traductor,Id_Cancion) values ("2021-04-21","Tablaturas/Ejemplo1.pdf","Traductor 1","Correo 1",1);

insert into Tablatura (Fecha,URL,Traductor,Correo_del_traductor,Id_Cancion) values ("2021-07-30","Tablaturas/Ejemplo2.pdf","Traductor 2","Correo 2",2);

insert into Tablatura (Fecha,URL,Traductor,Correo_del_traductor,Id_Cancion) values ("2020-01-01","Tablaturas/Ejemplo1.pdf","Traductor 3","Correo 3",3);

insert into Artistas_invitados (Id_Musico,Id_Cancion) values (1,1);

insert into Artistas_invitados (Id_Musico,Id_Cancion) values (2,2);

insert into Artistas_invitados (Id_Musico,Id_Cancion) values (3,3);

insert into Registro_Banda_Artistas (Id_Banda,Id_Artista) values (1,1);

insert into Registro_Banda_Artistas (Id_Banda,Id_Artista) values (2,2);

insert into Registro_Banda_Artistas (Id_Banda,Id_Artista) values (3,3);

insert into Registro_Banda_Musicos (Id_Banda,Id_Musico) values (1,1);

insert into Registro_Banda_Musicos (Id_Banda,Id_Musico) values (2,2);

insert into Registro_Banda_Musicos (Id_Banda,Id_Musico) values (3,3);
