-- 1.Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

-- SQL1:
SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente c, pedido p
WHERE c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- SQL2:
SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- 2.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

-- SQL1:
SELECT c.*, p.*
FROM cliente c, pedido p
WHERE c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- SQL2:
SELECT c.*, p.*
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- 3.Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

-- SQL1:
SELECT cm.*, p.*
FROM comercial cm, pedido p
WHERE cm.id = p.id_comercial
ORDER BY cm.nombre, cm.apellido1, cm.apellido2;

-- SQL2:
SELECT cm.*, p.*
FROM comercial cm
JOIN pedido p ON cm.id = p.id_comercial
ORDER BY cm.nombre, cm.apellido1, cm.apellido2;

-- 4.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

-- SQL1:
SELECT c.*, p.*, cm.*
FROM cliente c, pedido p, comercial cm
WHERE c.id = p.id_cliente
  AND cm.id = p.id_comercial;

-- SQL2:
SELECT c.*, p.*, cm.*
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
JOIN comercial cm ON cm.id = p.id_comercial;

-- 5.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

-- SQL1:
SELECT DISTINCT c.*
FROM cliente c, pedido p
WHERE c.id = p.id_cliente
  AND YEAR(p.fecha) = 2017
  AND p.total BETWEEN 300 AND 1000;

-- SQL2:
SELECT DISTINCT c.*
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
WHERE YEAR(p.fecha) = 2017
  AND p.total BETWEEN 300 AND 1000;

-- 6.Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

-- SQL1:
SELECT DISTINCT cm.nombre, cm.apellido1, cm.apellido2
FROM comercial cm, pedido p, cliente c
WHERE p.id_cliente = c.id
  AND p.id_comercial = cm.id
  AND c.nombre = 'María'
  AND c.apellido1 = 'Santana'
  AND c.apellido2 = 'Moreno';

-- SQL2:
SELECT DISTINCT cm.nombre, cm.apellido1, cm.apellido2
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
JOIN comercial cm ON cm.id = p.id_comercial
WHERE c.nombre = 'María'
  AND c.apellido1 = 'Santana'
  AND c.apellido2 = 'Moreno';

-- 7.Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

-- SQL1:
SELECT DISTINCT c.nombre, c.apellido1, c.apellido2
FROM cliente c, pedido p, comercial cm
WHERE p.id_cliente = c.id
  AND p.id_comercial = cm.id
  AND cm.nombre = 'Daniel'
  AND cm.apellido1 = 'Sáez'
  AND cm.apellido2 = 'Vega';

-- SQL2:
SELECT DISTINCT c.nombre, c.apellido1, c.apellido2
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
JOIN comercial cm ON cm.id = p.id_comercial
WHERE cm.nombre = 'Daniel'
  AND cm.apellido1 = 'Sáez'
  AND cm.apellido2 = 'Vega';
