DROP DATABASE IF EXISTS CONCESIONARIO;
CREATE DATABASE CONCESIONARIO;
USE CONCESIONARIO;

CREATE TABLE CLIENTE
(
	idCliente int, 
	nombreCliente varchar(20) NOT NULL,
	apellidosCliente varchar(45) NOT NULL,
	direccionCliente varchar(45),
	poblacion varchar(20),
	codigoPostal float,
	telefono double,
	fechaNac date,
	PRIMARY KEY (idCliente)
);

INSERT INTO CLIENTE VALUES
(100,'Antonio','García Pérez','Astilleros, 3','Valencia','46011','963689521','1960-08-15'),
(101,'Carlos','Pérez Ruiz','Magallanes, 21','Utiel','46300','962485147','1958-04-26'),
(105,'Luis','Rodríguez Más','Juan de Mena, 11','Gandía','46700','962965478','1961-03-30'),
(112,'Jaime','Juangrán Sornes','Balmes, 21','Valencia','46014','963684596','1968-01-31'),
(225,'Alfonso','Prats Montolla','Séneca, 23','Sagunto','46500','963547852','1969-04-28'),
(260,'José','Navarro Lard','Río Segura, 14','Valencia','46002','963874569','1964-05-15'),
(289,'Elisa','Úbeda Sansón','Valencia, 4','Sagunto','46500','963547812','1962-07-10'),
(352,'Eva','San Martín','Villafranca, 34','Alzira','46600','962401589','1965-08-12'),
(365,'Gerardo','Hernández Luis','Salinas, 8','Valencia','46002','963589621','1965-01-02'),
(390,'Carlos','Prats Ruiz','Ercilla, 8','Valencia','46005','963589654','1967-05-03'),
(810,'Lourdes','Oliver Peris','Gran vía, 34','Valencia','46007','963587412','1964-06-25'),
(822,'Sergio','Larred Navas','Blasco Ibáñez, 65','Valencia','46005','963589621','1967-12-25'),
(860,'Joaquín','Árboles Onsins','Gandía, 8','Alzira','46800','963758963','1969-05-04');

CREATE TABLE COCHE_VENDIDO
(
	matricula varchar(10),
	marca varchar(10) DEFAULT 'Ford',
	modelo varchar(30),
	color varchar(10),
	precio double,
	extrasInstalados varchar(45),
	cliente int,
	PRIMARY KEY (matricula),
	FOREIGN KEY (cliente) REFERENCES CLIENTE (idCliente) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO COCHE_VENDIDO VALUES
('V2360OX','Opel','Corsa 1.2 Sport','Azul',2100000,'Antena eléctrica',100),
('V1010PB','Ford','Probe 2.0 16V','Blanco',2860000,NULL,101),
('V4578OB','Ford','Orion 1.8 Ghia','Negro',2600000,'Aire Acondicionado',105),
('V7640OU','Citroen','Xantia 16V','Negro',2480000,'Airbag',225),
('V3543NC','Ford','Escort 1.6 Ghia','Rojo',2500000,NULL,260),
('V7632NX','Citroen','Zx Turbo-D','Rojo',2800000,'Aire Acondicionado, Airbag',289),
('V8018LJ','Ford','Fiesta 1.4 CLX','Azul',1950000,'Elevalunas eléctricos',352),
('V2565NB','Renault','Clio 1.7 S','Blanco',2100000, NULL,390),
('V7642OU','Ford','Mondeo 1.8 GLX','Blanco',3100000, NULL,810),
('V1234LC','Audi','100 2.3','Verde',3510000,'Climatizador',822),
('V9834LH','Peugeot','205 GTI','Rojo',2450000, NULL,860);

CREATE TABLE REVISION
(
	noRevision int AUTO_INCREMENT,
	cambioAceite bool,
	cambioFiltro bool,
	revisionFrenos bool,
	otros varchar(30),
	matricula varchar(10),
	PRIMARY KEY (noRevision),
	FOREIGN KEY (matricula) REFERENCES COCHE_VENDIDO (matricula) ON DELETE RESTRICT/*Lo mismo ON DELTE NO ACTION o nada*/ ON UPDATE CASCADE
);

INSERT INTO REVISION VALUES
(1,true,false,false,'Revisar luces','V7632NX'),
(2,true,true,false,'Cambiar limpias','V7632NX'),
(3,false,true,true,'Arreglar alarma','V4578OB'),
(4,false,true,true,'Ajustar tablero','V2360OX'),
(5,true,true,true,'Cambiar limpias, revisar luces','V2565NB'),
(6,false,false,true,'Cambiar luz interior','V7642OU'),
(7,true,true,false,null,'V2565NB'),
(8,false,false,false,null,'V8018LJ'),
(9,true,false,true,'Regular encendido','V3543NC'),
(10,false,true,false,'Reparar puerta delantera','V8018LJ'),
(11,false,false,false,null,'V3543NC'),
(12,true,true,true,null,'V1234LC'),
(13,false,true,false,'Cambiar limpias','V9834LH'),
(14,false,true,false,null,'V1010PB');