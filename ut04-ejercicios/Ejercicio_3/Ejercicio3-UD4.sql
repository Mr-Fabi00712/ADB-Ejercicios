-- Ejemplo 3: Biblioteca y Libros (Relación Uno a Muchos - 1:N)

-- 1. Crear la base de datos `biblioteca` con `utf8mb4_unicode_ci`
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos `biblioteca` para cambiar su `collation` a `utf8mb4_general_ci`
ALTER DATABASE biblioteca COLLATE utf8mb4_general_ci;

-- 3. Crear la tabla `bibliotecas` con los campos necesarios
CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla `libros` con los campos necesarios
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
);

-- 5. Modificar `libros` agregando una columna `genero` de tipo `VARCHAR(50)`
ALTER TABLE libros ADD COLUMN genero VARCHAR(50);

-- 6. Cambiar el tamaño de `nombre` en la tabla `bibliotecas` a 150 caracteres
ALTER TABLE bibliotecas MODIFY nombre VARCHAR(150) NOT NULL;

-- 7. Eliminar la columna `genero` de `libros`
ALTER TABLE libros DROP COLUMN genero;

-- 8. Añadir una nueva columna `isbn` de tipo `VARCHAR(20)` después de `titulo` en `libros`
ALTER TABLE libros ADD COLUMN isbn VARCHAR(20) AFTER titulo;

-- 9. Cambiar el tipo de dato de `isbn` en `libros` para que sea `CHAR(13)`
ALTER TABLE libros MODIFY isbn CHAR(13);

-- 10. Insertar una biblioteca llamada "Biblioteca Central"
INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');

-- 11. Añadir un libro "El Quijote" de "Miguel de Cervantes" en la Biblioteca Central
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) 
VALUES ((SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'), 'El Quijote', 'Miguel de Cervantes', 1605);

-- 12. Registra dos libros adicionales en la Biblioteca Central
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) 
VALUES 
    ((SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'), '1984', 'George Orwell', 1949),
    ((SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'), 'Matar a un ruiseñor', 'Harper Lee', 1960);

-- 13. Consultar todos los libros con su biblioteca
SELECT libros.titulo, libros.autor, bibliotecas.nombre AS biblioteca
FROM libros
JOIN bibliotecas ON libros.biblioteca_id = bibliotecas.id;

-- 14. Mostrar todas las bibliotecas sin libros registrados
SELECT bibliotecas.nombre
FROM bibliotecas
LEFT JOIN libros ON bibliotecas.id = libros.biblioteca_id
WHERE libros.biblioteca_id IS NULL;

-- 15. Actualizar el año de publicación de "1984" a 1950
UPDATE libros 
SET anio_publicacion = 1950 
WHERE titulo = '1984';

-- 16. Eliminar un libro con id = 1
DELETE FROM libros WHERE id = 1;

-- 17. Eliminar la "Biblioteca Central" y todos sus libros
DELETE FROM libros WHERE biblioteca_id = (SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central');
DELETE FROM bibliotecas WHERE nombre = 'Biblioteca Central';

-- 18. Consultar la estructura de la tabla `libros`
DESC libros;

-- 19. Eliminar las tablas `libros` y `bibliotecas`
DROP TABLE libros;
DROP TABLE bibliotecas;

-- 20. Eliminar la base de datos `biblioteca`
DROP DATABASE biblioteca;
