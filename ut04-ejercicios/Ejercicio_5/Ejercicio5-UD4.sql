-- 1. Crear la base de datos 'cine' con utf8mb4_unicode_ci
CREATE DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos 'cine' para cambiar su collation a utf8mb4_general_ci
ALTER DATABASE cine COLLATE utf8mb4_general_ci;

-- 3. Crear la tabla 'actores'
CREATE TABLE actores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla 'peliculas'
CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL
);

-- 5. Crear la tabla intermedia 'actores_peliculas'
CREATE TABLE actores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    actor_id INT UNSIGNED,
    pelicula_id INT UNSIGNED,
    personaje VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES actores(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- 6. Modificar la tabla 'actores_peliculas' para agregar la columna 'salario'
ALTER TABLE actores_peliculas ADD salario DECIMAL(10, 2);

-- 7. Cambiar el tamaño del campo 'nombre' en la tabla 'actores'
ALTER TABLE actores MODIFY nombre VARCHAR(150) NOT NULL;

-- 8. Eliminar la columna 'salario' de la tabla 'actores_peliculas'
ALTER TABLE actores_peliculas DROP COLUMN salario;

-- 9. Añadir un índice a la columna 'titulo' en 'peliculas'
CREATE INDEX idx_titulo ON peliculas(titulo);

-- 10. Insertar un actor llamado "Leonardo DiCaprio"
INSERT INTO actores (nombre) VALUES ('Leonardo DiCaprio');

-- 11. Añadir una película llamada "Titanic" con año de estreno 1997
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Titanic', 1997);

-- 12. Registrar la participación de "Leonardo DiCaprio" en "Titanic" como el personaje "Jack Dawson"
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
SELECT a.id, p.id, 'Jack Dawson'
FROM actores a, peliculas p
WHERE a.nombre = 'Leonardo DiCaprio' AND p.titulo = 'Titanic';

-- 13. Insertar dos actores adicionales ("Kate Winslet" y "Tom Hanks")
INSERT INTO actores (nombre) VALUES ('Kate Winslet'), ('Tom Hanks');

-- 14. Añadir tres películas adicionales ("Forrest Gump", "Avatar", "Inception")
INSERT INTO peliculas (titulo, anio_estreno) VALUES 
    ('Forrest Gump', 1994),
    ('Avatar', 2009),
    ('Inception', 2010);

-- 15. Registrar la participación de actores en distintas películas
-- Leonardo DiCaprio en "Inception"
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
SELECT a.id, p.id, 'Dominick Cobb'
FROM actores a, peliculas p
WHERE a.nombre = 'Leonardo DiCaprio' AND p.titulo = 'Inception';

-- Kate Winslet en "Titanic"
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
SELECT a.id, p.id, 'Rose DeWitt Bukater'
FROM actores a, peliculas p
WHERE a.nombre = 'Kate Winslet' AND p.titulo = 'Titanic';

-- Tom Hanks en "Forrest Gump"
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
SELECT a.id, p.id, 'Forrest Gump'
FROM actores a, peliculas p
WHERE a.nombre = 'Tom Hanks' AND p.titulo = 'Forrest Gump';

-- 16. Consultar todas las películas en las que ha trabajado "Leonardo DiCaprio"
SELECT p.titulo
FROM peliculas p
JOIN actores_peliculas ap ON p.id = ap.pelicula_id
JOIN actores a ON ap.actor_id = a.id
WHERE a.nombre = 'Leonardo DiCaprio';

-- 17. Consultar todos los actores que han participado en la película "Titanic"
SELECT a.nombre
FROM actores a
JOIN actores_peliculas ap ON a.id = ap.actor_id
JOIN peliculas p ON ap.pelicula_id = p.id
WHERE p.titulo = 'Titanic';

-- 18. Eliminar la participación de un actor en una película específica
DELETE FROM actores_peliculas
WHERE actor_id = (SELECT id FROM actores WHERE nombre = 'Leonardo DiCaprio')
  AND pelicula_id = (SELECT id FROM peliculas WHERE titulo = 'Titanic');

-- 19. Eliminar un actor y sus registros de películas
DELETE FROM actores_peliculas WHERE actor_id = (SELECT id FROM actores WHERE nombre = 'Tom Hanks');
DELETE FROM actores WHERE nombre = 'Tom Hanks';

-- 20. Eliminar la base de datos 'cine'
DROP DATABASE cine;
