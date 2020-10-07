/*•	La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.*/
SELECT E.Clave, SUM(E.Cantidad) AS 'Suma de Cantidades', SUM((E.Cantidad * M.Costo)+((M.PorcentajeImpuesto*(E.Cantidad * M.Costo))/100)) AS 'Importe Total'
FROM ENTREGAN E, Materiales M 
WHERE E.Clave = M.Clave AND E.Fecha >= '1997-01-01' AND E.FECHA < '1998-01-01'
GROUP BY E.Clave;

/*•	Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.*/
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

/*Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor 
a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450.*/