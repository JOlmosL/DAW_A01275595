--EJERCICIO 1
DROP TABLE Entregan, Materiales, Proyectos, Proovedores;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales') DROP TABLE Materiales
CREATE TABLE Materiales
(
  Clave numeric(5) NOT NULL,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proovedores') DROP TABLE Proovedores
CREATE TABLE Proveedores
(
  RFC char(13) NOT NULL,
  RazonSocial varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos') DROP TABLE Proyectos
CREATE TABLE Proyectos
(
  Numero numeric(5) NOT NULL,
  Denominacion varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan') DROP TABLE Entregan
CREATE TABLE Entregan
(
  Clave numeric(5) NOT NULL,
  RFC char(13) NOT NULL,
  Numero numeric(5) NOT NULL,
  Fecha DateTime NOT NULL,
  Cantidad numeric (8,2)
);



BULK INSERT A1275595.A1275595.[Materiales]
  FROM 'e:\wwwroot\rcortese\materiales.csv'
  WITH
  (
	CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

BULK INSERT A1275595.A1275595.[Proyectos]
  FROM 'e:\wwwroot\rcortese\proyectos.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

BULK INSERT A1275595.A1275595.[Proveedores]
  FROM 'e:\wwwroot\rcortese\proveedores.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

SET DATEFORMAT dmy 
BULK INSERT A1275595.A1275595.[Entregan]
  FROM 'e:\wwwroot\rcortese\entregan.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

  SELECT * FROM Entregan;
  SELECT * FROM Materiales;
  SELECT * FROM Proveedores;
  SELECT * FROM Proyectos;

 --EJERCICIO 2
INSERT INTO Materiales VALUES(1000, 'xxx', 1000);
SELECT * FROM Materiales;
DELETE FROM Materiales WHERE Clave = 1000 and Costo = 1000;
ALTER TABLE Materiales ADD CONSTRAINT llaveMateriales PRIMARY KEY (Clave);
INSERT INTO Materiales VALUES(1000, 'xxx', 1000);
sp_helpconstraint Materiales;
ALTER TABLE Proveedores ADD CONSTRAINT llaveProveedores PRIMARY KEY (RFC);
sp_helpconstraint Proveedores;
ALTER TABLE Proyectos ADD CONSTRAINT llaveProyectos PRIMARY KEY (Numero);
sp_helpconstraint Proyectos;
ALTER TABLE Entregan ADD CONSTRAINT llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha);
sp_helpconstraint Entregan;
--ALTER TABLE Entregan DROP CONSTRAINT llaveEntregan;

--EJERCICIO 3
INSERT INTO Entregan VALUES (0, 'xxx', 0, '1-jan-02', 0);
SELECT * FROM Entregan;
DELETE FROM Entregan WHERE Clave = 0;
ALTER TABLE Entregan ADD CONSTRAINT cfentreganclave FOREIGN KEY (Clave) REFERENCES Materiales(Clave);
INSERT INTO Entregan VALUES (0, 'xxx', 0, '1-jan-02', 0);
sp_helpconstraint ENTREGAN;
ALTER TABLE Entregan ADD CONSTRAINT cfentreganrfc FOREIGN KEY (RFC) REFERENCES Proveedores(RFC);
ALTER TABLE Entregan ADD CONSTRAINT cfentregannumero FOREIGN KEY (Numero) REFERENCES Proyectos(Numero);
sp_helpconstraint ENTREGAN;

--EJERCICIO 4
  INSERT INTO Entregan VALUES (1000, 'AAAA800101', 5000, GETDATE(), 0);
  SELECT * FROM Entregan;
  DELETE FROM Entregan WHERE Cantidad = 0;
  ALTER TABLE Entregan ADD CONSTRAINT Cantidad CHECK (Cantidad > 0);
  INSERT INTO Entregan VALUES (1000, 'AAAA800101', 5000, GETDATE(), 0);