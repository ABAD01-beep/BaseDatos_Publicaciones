CREATE DATABASE BibliotecaPublicaciones_ITM

USE BibliotecaPublicaciones_ITM

CREATE TABLE Tipo_Publicacion(
Id INT IDENTITY NOT NULL,
Nombre VARCHAR(100) NOT NULL
)

ALTER TABLE Tipo_Publicacion
ADD CONSTRAINT pkTipoPublicacion PRIMARY KEY(Id)

CREATE UNIQUE INDEX ixTipoPublicacion_Nombre
ON Tipo_publicacion(Nombre)

CREATE TABLE Ubicacion(
Id INT IDENTITY NOT NULL,
Ciudad VARCHAR(100) NOT NULL,
Pais VARCHAR(100) NOT NULL
)

ALTER TABLE Ubicacion
ADD CONSTRAINT pkUbicacion PRIMARY KEY(Id)

CREATE TABLE Editorial(
Id INT IDENTITY NOT NULL,
Nombre VARCHAR(150) NOT NULL,
IdUbicacion INT NOT NULL
)

ALTER TABLE Editorial
ADD CONSTRAINT pkEditorial PRIMARY KEY(Id)

ALTER TABLE Editorial
ADD CONSTRAINT fkEditorial_Ubicacion
FOREIGN KEY(IdUbicacion)
REFERENCES Ubicacion(Id)


CREATE TABLE Autor(
Id INT IDENTITY NOT NULL,
Nombre VARCHAR(150) NOT NULL,
TipoAtor VARCHAR(50)NOT NULL
)

ALTER TABLE Autor
ADD CONSTRAINT pkAutor PRIMARY KEY(Id)

CREATE TABLE Publicacion(
Id INT IDENTITY NOT NULL,
Titulo VARCHAR(200) NOT NULL,
Anio INT  NOT NULL,
IdTipo INT  NOT NULL,
IdEditorial INT  NOT NULL,
Volumen INT NULL,
Numero INT NULL
)

ALTER TABLE Publicacion
ADD CONSTRAINT pkPublicacion PRIMARY KEY(Id)

ALTER TABLE Publicacion
ADD CONSTRAINT fkPublicacion_Tipo
FOREIGN KEY (IdTipo)
REFERENCES Tipo_Publicacion(Id)

ALTER TABLE Publicacion
ADD CONSTRAINT fkPublicacion_Editorial
FOREIGN KEY (IdEditorial)
REFERENCES Editorial(Id)

CREATE TABLE Descriptor(
Id INT IDENTITY NOT NULL,
Nombre VARCHAR(100) NOT NULL
)

ALTER TABLE Descriptor
ADD CONSTRAINT pkDescriptor PRIMARY KEY(ID)

CREATE UNIQUE INDEX ixDescriptor_Nombre
ON Descriptor(Nombre)

CREATE TABLE Publicacion_Autor(
IdPublicacion INT NOT NULL,
IdAutor INT NOT NULL
)

ALTER TABLE Publicacion_Autor
ADD CONSTRAINT pkPublicacionAutor
PRIMARY KEY(IdPublicacion,IdAutor)

ALTER TABLE Publicacion_Autor
ADD CONSTRAINT fkPublicacionAutor_Publicacion
FOREIGN KEY(Idpublicacion)
REFERENCES Publicacion(Id)

ALTER TABLE Publicacion_Autor
ADD CONSTRAINT fkPublicacionAutor_Autor
FOREIGN KEY(IdAutor)
REFERENCES Autor(Id)

CREATE TABLE Publicacion_Descriptor(
IdPublicacion INT NOT NULL,
IdDescriptor INT NOT NULL
)

ALTER TABLE Publicacion_Descriptor
ADD CONSTRAINT pkPublicacionDescriptor
PRIMARY KEY(IdPublicacion,IdDescriptor)

ALTER TABLE Publicacion_Descriptor
ADD CONSTRAINT fkPublicacionDescriptor_Publicacion
FOREIGN KEY(IdPublicacion)
REFERENCES Publicacion(Id)

ALTER TABLE Publicacion_Descriptor
ADD CONSTRAINT fkPublicacionDescriptor_Descriptor
FOREIGN KEY(IdDescriptor)
REFERENCES Descriptor(Id)







