-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

-- SQL1
SELECT nombre, precio,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS fabricante
FROM producto;


-- SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id;


-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

-- SQL1
SELECT nombre, precio,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS fabricante
FROM producto
ORDER BY fabricante;


-- SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre;


-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

-- SQL1
SELECT id, nombre, id_fabricante,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS nombre_fabricante
FROM producto;

-- SQL2
SELECT producto.id, producto.nombre, fabricante.id AS id_fabricante, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id;



-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

-- SQL1
SELECT nombre, precio,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS fabricante
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MIN(precio) FROM producto);



-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

-- SQL1
SELECT nombre, precio,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS fabricante
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MAX(precio) FROM producto);


-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Lenovo');


-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Lenovo';


-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Crucial')
  AND precio > 200;

-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;


-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus')
   OR id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard')
   OR id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Seagate');


-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus'
   OR fabricante.nombre = 'Hewlett-Packard'
   OR fabricante.nombre = 'Seagate';


-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante IN (
  SELECT id FROM fabricante
  WHERE nombre IN ('Asus', 'Hewlett-Packard', 'Seagate')
);


-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');


-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante IN (
  SELECT id FROM fabricante
  WHERE nombre LIKE '%e'
);


-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%e';


-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

-- SQL1
SELECT nombre, precio
FROM producto
WHERE id_fabricante IN (
  SELECT id FROM fabricante
  WHERE nombre LIKE '%w%'
);


-- SQL2
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%w%';


-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

-- SQL1
SELECT nombre, precio,
  (SELECT nombre FROM fabricante WHERE fabricante.id = producto.id_fabricante) AS fabricante
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;


-- SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;


-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

-- SQL1
SELECT id, nombre
FROM fabricante
WHERE id IN (SELECT id_fabricante FROM producto);


-- SQL2
SELECT DISTINCT fabricante.id, fabricante.nombre
FROM fabricante
JOIN producto ON fabricante.id = producto.id_fabricante;


