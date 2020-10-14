IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaMaterial' AND type = 'P')
DROP PROCEDURE creaMaterial
GO

CREATE PROCEDURE creaMaterial
	@uclave NUMERIC(5,0),
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2),
	@uimpuesto NUMERIC(6,2)
AS
	INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

SELECT * FROM MATERIALES
EXECUTE creaMaterial 5000,'Martillos Acme',250,15
SELECT * FROM MATERIALES

--Creando Procedimientos
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaMaterial' AND type = 'P')
DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaMaterial
	@uclave NUMERIC(5,0),
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2),
	@uimpuesto NUMERIC(6,2)
AS
	UPDATE Materiales SET Clave = @uclave, Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto WHERE Clave = @uclave
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaMaterial' AND type = 'P')
DROP PROCEDURE eliminaMaterial
GO

CREATE PROCEDURE eliminaMaterial
	@uclave NUMERIC(5,0)
AS
	DELETE FROM Materiales WHERE Clave = @uclave
GO

--Proyectos
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaProyectos' AND type = 'P')
DROP PROCEDURE creaProyecto
GO

CREATE PROCEDURE creaProyecto
	@uNumero NUMERIC(5),
	@uDenominacion VARCHAR(50)
AS
	INSERT INTO Proyectos VALUES(@uNumero, @uDenominacion)
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaProyectos' AND type = 'P')
DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaProyectos
	@uNumero NUMERIC(5),
	@uDenominacion VARCHAR(50)
AS
	UPDATE Proyectos SET Numero = @uNumero, Denominacion = @uDenominacion WHERE Numero = @uNumero
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaProyectos' AND type = 'P')
DROP PROCEDURE eliminaProyectos
GO

CREATE PROCEDURE eliminaProyectos
	@uNumero NUMERIC(5)
AS
	DELETE FROM Proyectos WHERE Numero = @uNumero
GO

--Proveedores
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaProveedores' AND type = 'P')
DROP PROCEDURE creaProveedores
GO

CREATE PROCEDURE creaProveedores
	@uRFC CHAR(13),
	@uRazonSocial VARCHAR(50)
AS
	INSERT INTO Proveedores VALUES(@uRFC, @uRazonSocial)
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaProveedores' AND type = 'P')
DROP PROCEDURE modificaProveedores
GO

CREATE PROCEDURE modificaProveedores
	@uRFC CHAR(13),
	@uRazonSocial VARCHAR(50)
AS
	UPDATE Proveedores SET RFC = @uRFC, RazonSocial = @uRazonSocial WHERE RFC = @uRFC
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaProveedores' AND type = 'P')
DROP PROCEDURE eliminaProveedores
GO

CREATE PROCEDURE eliminaProveedores
	@uRFC CHAR(13)
AS
	DELETE FROM Proveedores WHERE RFC = @uRFC
GO

--Entregan
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaEntrega' AND type = 'P')
DROP PROCEDURE creaEntrega
GO

CREATE PROCEDURE creaEntrega
	@uClave NUMERIC(5),
	@uRFC CHAR(13),
	@uNumero NUMERIC(5),
	@uFecha DATETIME,
	@uCantidad NUMERIC(8,2)
AS
	INSERT INTO Entregan VALUES(@uClave, @uRFC, @uNumero, @uFecha, @uCantidad)
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaEntrega' AND type = 'P')
DROP PROCEDURE modificaEntrega
GO

CREATE PROCEDURE modificaEntrega
	@uClave NUMERIC(5),
	@uRFC CHAR(13),
	@uNumero NUMERIC(5),
	@uFecha DATETIME,
	@uCantidad NUMERIC(8,2)
AS
	UPDATE Entregan SET Clave = @uclave, RFC = @uRFC, Numero = @uNumero, Fecha = @uFecha, Cantidad = @uCantidad WHERE Clave = @uclave AND RFC = @uRFC AND Numero = @uNumero AND Fecha = @uFecha
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaEntrega' AND type = 'P')
DROP PROCEDURE eliminaEntrega
GO

CREATE PROCEDURE eliminaEntrega
	@uClave NUMERIC(5),
	@uRFC CHAR(13),
	@uNumero NUMERIC(5),
	@uFecha DATETIME
AS
	DELETE FROM Entregan WHERE Clave = @uclave AND RFC = @uRFC AND Numero = @uNumero AND Fecha = @uFecha 
GO

--Crear procedimientos para realizar consultas con parámetros
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'queryMaterial' AND type = 'P')
DROP PROCEDURE queryMaterial
GO

CREATE PROCEDURE queryMaterial
	@udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2)
AS
	SELECT * FROM Materiales WHERE descripcion LIKE '%'+@udescripcion+'%' AND costo > @ucosto
GO

EXECUTE queryMaterial 'Lad',20