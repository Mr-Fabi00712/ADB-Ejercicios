-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

SELECT * FROM pedido ORDER BY fecha DESC;

-- Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * FROM pedido ORDER BY total DESC limit 2;

-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

SELECT distinct id_cliente FROM pedido;

-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT * FROM pedido WHERE YEAR(fecha) = 2017 AND total > 500;

-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT nombre, apellido1, apellido2 FROM comercial WHERE comision between 0.05 and 0.11;

-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT comision FROM comercial ORDER BY comision DESC limit 1;

SELECT MAX(comision) AS comision_maxima  FROM comercial;

-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT id, apellido1, nombre FROM comercial WHERE apellido2 IS NOT NULL ORDER BY apellido1, apellido2, nombre;

-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

SELECT nombre FROM cliente WHERE nombre LIKE 'A%n' OR nombre LIKE 'P%' ORDER BY nombre;

-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

SELECT nombre FROM cliente WHERE nombre NOT LIKE 'A%' ORDER BY nombre;

-- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

SELECT DISTINCT nombre FROM comercial WHERE nombre LIKE '%o%';