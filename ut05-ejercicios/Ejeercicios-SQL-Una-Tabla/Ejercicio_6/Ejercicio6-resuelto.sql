-- ¿Cuál es el título de la película con el ID 10?
SELECT titulo FROM pelicula WHERE id_pelicula = 10;

-- ¿Cuántas películas hay en total en la tabla film?
SELECT COUNT(*) FROM pelicula;

-- ¿Cuál es el ID de la película más cara?
SELECT id_pelicula FROM pelicula ORDER BY replacement_cost DESC LIMIT 1;

-- ¿Cuántos actores están asociados con la película cuyo título es "ACADEMY DINOSAUR"?
SELECT COUNT(*)  FROM actor a
JOIN pelicula_actor pa ON a.id_actor = pa.id_actor
JOIN pelicula p ON pa.id_pelicula = p.id_pelicula
WHERE p.titulo = 'ACADEMY DINOSAUR';


-- ¿Cuáles son los primeros 5 títulos de películas con una clasificación de "PG"?
SELECT titulo FROM pelicula WHERE clasificacion = 'PG' LIMIT 5;

-- *¿Qué director tiene más películas en la base de datos?
-- NO EXISTE LA TABLA DIRECTOR

-- ¿Cuántas películas tienen un alquiler con un costo superior a 3.50?
SELECT COUNT(*) FROM pelicula WHERE rental_rate > 3.50;

-- ¿Cuál es el título de la película con el ID más bajo?
SELECT titulo FROM pelicula ORDER BY id_pelicula ASC LIMIT 1;

-- ¿Cuántas películas en total están disponibles para alquilar en la tienda?
SELECT COUNT(*) FROM inventario WHERE id_almacen = 1;


-- ¿Cuál es la duración promedio de las películas en la tabla film?
SELECT AVG(duracion) FROM pelicula;

-- ¿Qué actor tiene más películas asociadas a él en la tabla film_actor?
SELECT id_actor, COUNT(*) AS num_peliculas FROM pelicula_actor GROUP BY id_actor ORDER BY num_peliculas DESC LIMIT 1;

SELECT nombre, apellidos FROM actor WHERE id_actor = 107;

-- ¿Cuáles son los 10 títulos de películas con la mayor duración?
SELECT titulo FROM pelicula ORDER BY duracion DESC LIMIT 10;

-- ¿Cuál es la clasificación más común entre las películas?
SELECT clasificacion, COUNT(*) AS num_clasificaciones FROM pelicula GROUP BY clasificacion ORDER BY num_clasificaciones DESC LIMIT 1;

-- ¿Qué idioma se utiliza con mayor frecuencia en las películas?
SELECT id_idioma, COUNT(*) AS num_peliculas FROM pelicula GROUP BY id_idioma ORDER BY num_peliculas DESC LIMIT 1;

-- ¿Cuántas películas fueron estrenadas en el año 2005?
SELECT COUNT(*) FROM pelicula WHERE anyo_lanzamiento = 2005;

-- ¿Cuántas películas tienen una clasificación de "R" y un costo de alquiler superior a 4.00?
SELECT COUNT(*) FROM pelicula WHERE clasificacion = 'R' AND replacement_cost > 4.00; 

-- ¿Qué película tiene el precio de alquiler más bajo?
SELECT titulo FROM pelicula ORDER BY replacement_cost ASC LIMIT 1;

SELECT titulo, replacement_cost FROM pelicula WHERE titulo LIKE 'ANACONDA%';

-- ¿Cuál es el actor con más películas en la tabla film_actor?
SELECT id_actor, COUNT(*) AS num_peliculas
FROM pelicula_actor
GROUP BY id_actor
ORDER BY num_peliculas DESC
LIMIT 1;

-- ¿Cuáles son los 3 títulos de películas que tienen la mayor cantidad de copias disponibles en inventario?
SELECT p.titulo, COUNT(*) AS num_copias
FROM inventario i
JOIN pelicula p ON i.id_pelicula = p.id_pelicula
GROUP BY p.titulo
ORDER BY num_copias DESC
LIMIT 3;


-- ¿Cuáles son los 5 actores más comunes en las películas de la categoría "Action"?
SELECT a.nombre, COUNT(*) AS cantidad
FROM actor a
JOIN pelicula_actor pa ON a.id_actor = pa.id_actor
JOIN pelicula_categoria pc ON pa.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id_categoria
WHERE c.nombre = 'Action'
GROUP BY a.id_actor, a.nombre
ORDER BY cantidad DESC
LIMIT 5;


-- ¿Cuántas películas están catalogadas como "Drama" y tienen una duración superior a 120 minutos?
SELECT COUNT(*)
FROM pelicula p
JOIN pelicula_categoria pc ON p.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id_categoria
WHERE c.nombre = 'Drama' AND p.duracion > 120;


-- ¿Cuántas películas fueron estrenadas antes del 1 de enero de 2000?
SELECT COUNT(*) FROM pelicula WHERE anyo_lanzamiento < 2000;


-- ¿Cuál es el costo promedio de alquiler de todas las películas?
SELECT AVG(rental_rate) FROM pelicula;


-- ¿Qué película tiene el mayor precio de compra?
SELECT titulo FROM pelicula ORDER BY replacement_cost DESC LIMIT 1;


-- ¿Cuántos actores participaron en la película con el título "CHAMPION"?
SELECT COUNT(*) FROM actor a JOIN pelicula_actor pa ON a.id_actor = pa.id_actor JOIN pelicula p ON pa.id_pelicula = p.id_pelicula WHERE p.titulo = 'CHAMPION%';


-- ¿Cuál es la película más reciente en la base de datos?
SELECT titulo FROM pelicula ORDER BY anyo_lanzamiento DESC LIMIT 1;


-- ¿Cuál es el precio promedio de las películas en la categoría "Action"?
SELECT AVG(p.replacement_cost)
FROM pelicula p
JOIN pelicula_categoria pc ON p.id_pelicula = pc.id_pelicula
JOIN categoria c ON pc.id_categoria = c.id_categoria
WHERE c.nombre = 'Action';


-- ¿Cuáles son los 10 primeros títulos de películas cuyo título empieza con la letra "S"?
SELECT titulo FROM pelicula WHERE titulo LIKE 'S%' LIMIT 10;


-- ¿Cuáles son las 5 películas que tienen la menor duración y están disponibles para alquilar?
SELECT titulo, duracion
FROM pelicula
WHERE rental_rate > 0
ORDER BY duracion ASC
LIMIT 5;


-- ¿Cuál es la película con más copias en inventario?
SELECT p.titulo, COUNT(*) AS num_copias
FROM inventario i
JOIN pelicula p ON i.id_pelicula = p.id_pelicula
GROUP BY p.titulo
ORDER BY num_copias DESC
LIMIT 1;

