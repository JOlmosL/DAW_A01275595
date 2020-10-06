select * from materiales

select * from materiales
where clave=1000

select clave,rfc,fecha from entregan

select * from materiales,entregan
where materiales.clave = entregan.clave

select * from entregan,proyectos
where entregan.numero < = proyectos.numero

(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300)

SELECT * FROM ENTREGAN WHERE clave = 1300 OR clave = 1450

(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)

(select * from entregan)
minus
(select * from entregan where clave=1000)

SELECT * FROM ENTREGAN WHERE Clave != 1000

select * from entregan,materiales

set dateformat dmy
SELECT M.Descripcion FROM MATERIALES M, ENTREGAN E WHERE M.Clave = E.Clave AND Fecha >= '01/01/2000' AND Fecha <'01/01/2001'

set dateformat dmy
SELECT DISTINCT M.Descripcion FROM MATERIALES M, ENTREGAN E WHERE M.Clave = E.Clave AND Fecha >= '01/01/2000' AND Fecha <'01/01/2001'

SELECT P.Numero, P.Denominacion, E.Fecha, E.Cantidad FROM PROYECTOS P, ENTREGAN E WHERE P.Numero = E.Numero ORDER BY P.Numero, E.Fecha DESC

SELECT * FROM MATERIALES where Descripcion LIKE 'Si%'
SELECT * FROM MATERIALES where Descripcion LIKE 'Si'

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

SELECT Clave,RFC,Numero,Fecha,Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010;

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND RFC IN 
( SELECT [RFC] FROM [Proveedores] WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] E
WHERE [Numero] Between 5000 and 5010 AND E.RFC NOT IN 
( SELECT [RFC] FROM [Proveedores] WHERE RazonSocial NOT LIKE 'La%')

SELECT TOP 2 * FROM Proyectos

SELECT TOP Numero FROM Proyectos

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

SELECT * FROM Materiales

SELECT M.Clave, (SUM(E.Cantidad)*M.Costo)+((SUM(E.Cantidad)*M.Costo)*M.PorcentajeImpuesto) AS "IMPORTE" FROM MATERIALES M, ENTREGAN E WHERE E.Clave = M.Clave GROUP BY E.Clave, M.Clave

CREATE VIEW AD (RFC) AS SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT * FROM AD;
CREATE VIEW NOT_A (RFC) AS SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT * FROM NOT_A;
CREATE VIEW Cuatro (Numero) AS SELECT Numero FROM Entregan WHERE Numero LIKE '___6';
SELECT * FROM Cuatro;
CREATE VIEW LIMITE (Clave,RFC,Numero,Fecha,Cantidad ) AS SELECT Clave,RFC,Numero,Fecha,Cantidad FROM Entregan WHERE Numero Between 5000 and 5010;
SELECT * FROM LIMITE;
CREATE VIEW COMPLETO (RFC,Cantidad, Fecha, Numero) AS SELECT RFC,Cantidad, Fecha, Numero FROM [Entregan] WHERE [Numero] Between 5000 and 5010 AND Exists ( SELECT [RFC] FROM [Proveedores] WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )
SELECT * FROM COMPLETO;

SELECT E.Clave, M.Descripcion FROM MATERIALES M, ENTREGAN E, PROYECTOS P WHERE M.Clave = E.Clave AND P.Numero = E.Numero AND P.Denominacion = 'Mexico sin ti no estamos completos'

SELECT E.Clave, M.Descripcion FROM MATERIALES M, ENTREGAN E, PROVEEDORES P WHERE M.Clave = E.Clave AND P.RFC = E.RFC AND P.RazonSocial = 'Acme tools'

SELECT RFC FROM ENTREGAN WHERE FECHA BETWEEN '01/01/2000' and '01/01/2001' GROUP BY RFC HAVING AVG(Cantidad)>=300

SELECT Clave, SUM(Cantidad) FROM ENTREGAN WHERE FECHA BETWEEN '01/01/2000' and '01/01/2001' GROUP BY Clave

SELECT TOP 1 Clave, SUM(Cantidad) AS "Total" FROM ENTREGAN WHERE FECHA BETWEEN '01/01/2001' and '01/01/2002' GROUP BY CLAVE ORDER BY Total DESC

SELECT * FROM Materiales WHERE Descripcion LIKE '%ub%'

SELECT P.Denominacion, SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) AS "TOTAL" FROM ENTREGAN E, PROYECTOS P, MATERIALES M WHERE P.Numero = E.Numero AND M.Clave = E.Clave GROUP BY P.Denominacion

CREATE VIEW televisaNoCoahuila AS (SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN (SELECT PR.RFC FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND P.Denominacion LIKE 'Edu%'));
SELECT * FROM televisaNoCoahuila;

SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN (SELECT PR.RFC FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND P.Denominacion LIKE 'Edu%');

SELECT M.Costo, M.Descripcion FROM ENTREGAN E, PROYECTOS P, MATERIALES M, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND M.Clave = E.Clave AND P.Denominacion LIKE 'Tel%' AND PR.RFC IN (SELECT PR.RFC FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PR WHERE P.Numero = E.Numero AND PR.RFC = E.RFC AND P.Denominacion LIKE 'Edu%')

SELECT M.Descripcion, P.Denominacion, SUM(E.Cantidad), SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) FROM ENTREGAN E, MATERIALES M, PROYECTOS P WHERE M.Clave = E.Clave AND P.Numero = E.Numero GROUP BY M.Descripcion, P.Denominacion