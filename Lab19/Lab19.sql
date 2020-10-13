/*La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.*/
SELECT E.Clave, SUM(E.Cantidad) AS 'Suma de Cantidades', SUM((E.Cantidad * M.Costo)+((M.PorcentajeImpuesto*(E.Cantidad * M.Costo))/100)) AS 'Importe Total'
FROM ENTREGAN E, Materiales M 
WHERE E.Clave = M.Clave AND E.Fecha >= '1997-01-01' AND E.FECHA < '1998-01-01'
GROUP BY E.Clave;

/*Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.*/
SELECT E.RFC, P.RazonSocial, COUNT(E.Cantidad) AS 'Número de Entregas', SUM((E.Cantidad * M.Costo)+((M.PorcentajeImpuesto*(E.Cantidad * M.Costo))/100)) AS 'Importe Total'
FROM ENTREGAN E, PROVEEDORES P, MATERIALES M
WHERE E.RFC = P.RFC AND E.Clave = M.Clave
GROUP BY E.RFC, P.RazonSocial;

/*Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, 
la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.*/
SELECT E.Clave, M.Descripcion, SUM(E.Cantidad) AS 'Cantidad Total Entregada', MIN(E.Cantidad) AS 'Mínima Cantidad Entregada', MAX(E.Cantidad) AS 'Máxima Cantidad Entregada', SUM((E.Cantidad * M.Costo)+((M.PorcentajeImpuesto*(E.Cantidad * M.Costo))/100)) AS 'Importe Total'
FROM ENTREGAN E, MATERIALES M
GROUP BY E.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400

/*Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, 
excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500.*/
SELECT P.RazonSocial, AVG(E.Cantidad) AS 'Promedio por Material', M.Clave, M.Descripcion
FROM PROVEEDORES P, MATERIALES M, ENTREGAN E
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) >= 500

/*Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio 
entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450.*/
SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) AS 'Promedio por Mterial'
FROM PROVEEDORES P, MATERIALES M, ENTREGAN E
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) < 370 OR AVG(E.Cantidad) > 450

/*Utilizando la sentencia INSERT INTO tabla VALUES (valorcolumna1, valorcolumna2, [...] , valorcolumnan) ;
Considerando que los valores de tipos CHAR y VARCHAR deben ir encerrados entre apóstrofes, los valores numéricos se escriben directamente y los de fecha, como 
'1-JAN-00' para 1o. de enero del 2000, inserta cinco nuevos materiales.*/

INSERT INTO MATERIALES VALUES (1440,'Tela Comex', 150, 2.88);
INSERT INTO MATERIALES VALUES (1450,'Telas Rayo', 150, 2.9);
INSERT INTO MATERIALES VALUES (1460,'Tela Prieto', 150, 2.92);
INSERT INTO MATERIALES VALUES (1470,'Telas Obo', 150, 2.94);
INSERT INTO MATERIALES VALUES (1480,'Telas Poncho', 150, 2.96);

/*Clave y descripción de los materiales que nunca han sido entregados.*/
SELECT Clave, Descripcion
FROM MATERIALES
WHERE Clave NOT IN (SELECT Clave FROM ENTREGAN)

/*Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'.*/
(SELECT PV.RazonSocial
FROM PROVEEDORES PV, PROYECTOS P, ENTREGAN E
WHERE PV.RFC = E.RFC AND P.Numero = E.Numero AND E.Numero IN (SELECT Numero FROM PROYECTOS WHERE Denominacion = 'Vamos Mexico'))
UNION
(SELECT PV.RazonSocial
FROM PROVEEDORES PV, PROYECTOS P, ENTREGAN E
WHERE PV.RFC = E.RFC AND P.Numero = E.Numero AND E.Numero IN (SELECT Numero FROM PROYECTOS WHERE Denominacion = 'Queretaro limpio'))

/*Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.*/
SELECT Descripcion
FROM Materiales 
WHERE Clave NOT IN (SELECT E.Clave FROM PROYECTOS P, ENTREGAN E WHERE P.Numero = E.Numero AND P.Denominacion = 'CIT Yucatan')

/*Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el
proveedor con el RFC 'VAGO780901'.*/
SELECT PV.RazonSocial, AVG(E.Cantidad) AS 'Promedio de la Cantidad Entregada'
FROM Entregan E, Proyectos P, Proveedores PV
WHERE P.Numero = E.Numero AND PV.RFC = E.RFC
GROUP BY PV.RazonSocial
HAVING AVG(E.Cantidad) > (SELECT AVG(Cantidad) FROM ENTREGAN WHERE RFC='VAGO780901' GROUP BY RFC)

/*RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 fueron mayores a 
las cantidades totales entregadas en el 2001.*/
SET DATEFORMAT dmy
SELECT PV.RFC, PV.RazonSocial
FROM ENTREGAN E, PROYECTOS P, PROVEEDORES PV
WHERE P.Numero = E.Numero AND PV.RFC = E.RFC AND P.Denominacion ='Infonavit Durango'
GROUP BY PV.RFC, PV.RazonSocial HAVING 
(SELECT SUM(E.Cantidad) FROM ENTREGAN E, PROYECTOS P, PROVEEDORES AS PV WHERE P.Numero = E.Numero AND PV.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2000' AND '31/12/2000')) 
> 
(SELECT SUM(E.Cantidad) FROM ENTREGAN E, PROYECTOS P, PROVEEDORES AS PV WHERE P.Numero = E.Numero AND PV.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2001' AND '31/12/2001'))
