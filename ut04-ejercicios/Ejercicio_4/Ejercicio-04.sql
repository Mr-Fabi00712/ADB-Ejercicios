-- 1. Crear la base de datos con collation utf8mb4_unicode_ci
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la collation de la base de datos
ALTER DATABASE universidad COLLATE utf8mb4_general_ci;

-- 3. Usar la base de datos
USE universidad;

-- 4. Crear la tabla alumnos
CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 5. Crear la tabla asignaturas
CREATE TABLE asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 6. Crear la tabla intermedia matriculas
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED,
    asignatura_id INT UNSIGNED,
    fecha_matricula DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id) ON DELETE CASCADE,
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id) ON DELETE CASCADE
);

-- 7.Modificar la tabla matriculas para agregar la columna nota
ALTER TABLE matriculas ADD COLUMN nota DECIMAL(4,2);

-- 8. Cambiar el tamaño del campo nombre en la tabla asignaturas
ALTER TABLE asignaturas MODIFY nombre VARCHAR(150) NOT NULL;

-- 9. Eliminar la columna nota de la tabla matriculas
ALTER TABLE matriculas DROP COLUMN nota;

-- 10. Añadir un índice a la columna nombre en asignaturas
CREATE INDEX idx_nombre ON asignaturas(nombre);

-- 11. Insertar un alumno llamado "Luis Gómez"
INSERT INTO alumnos (nombre) VALUES ('Luis Gómez');

-- 12. Añadir una asignatura llamada "Matemáticas"
INSERT INTO asignaturas (nombre) VALUES ('Matemáticas');

-- 13. Matricular al alumno en Matemáticas con fecha de matrícula de hoy
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula)
VALUES ((SELECT id FROM alumnos WHERE nombre = 'Luis Gómez'),
        (SELECT id FROM asignaturas WHERE nombre = 'Matemáticas'),
        CURDATE());

-- 14. Insertar dos alumnos adicionales
INSERT INTO alumnos (nombre) VALUES ('María Fernández'), ('Carlos Ruiz');

-- 15. Añadir tres asignaturas adicionales
INSERT INTO asignaturas (nombre) VALUES ('Física'), ('Historia'), ('Química');

-- 16.Matricular a los alumnos en distintas asignaturas
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) VALUES
((SELECT id FROM alumnos WHERE nombre = 'María Fernández'), (SELECT id FROM asignaturas WHERE nombre = 'Física'), CURDATE()),
((SELECT id FROM alumnos WHERE nombre = 'Carlos Ruiz'), (SELECT id FROM asignaturas WHERE nombre = 'Historia'), CURDATE()),
((SELECT id FROM alumnos WHERE nombre = 'Luis Gómez'), (SELECT id FROM asignaturas WHERE nombre = 'Química'), CURDATE());

-- 17. Consultar todas las asignaturas en las que está inscrito el alumno "Luis Gómez"
SELECT a.nombre AS Asignatura
FROM asignaturas a
JOIN matriculas m ON a.id = m.asignatura_id
JOIN alumnos al ON m.alumno_id = al.id
WHERE al.nombre = 'Luis Gómez';

-- 18. Consultar todos los alumnos que están inscritos en la asignatura "Matemáticas"
SELECT al.nombre AS Alumno
FROM alumnos al
JOIN matriculas m ON al.id = m.alumno_id
JOIN asignaturas a ON m.asignatura_id = a.id
WHERE a.nombre = 'Matemáticas';

-- 19. Eliminar la inscripción de un alumno en una asignatura específica
DELETE FROM matriculas 
WHERE alumno_id = (SELECT id FROM alumnos WHERE nombre = 'Carlos Ruiz')
AND asignatura_id = (SELECT id FROM asignaturas WHERE nombre = 'Historia');

-- 20. Eliminar un alumno y sus matrículas asociadas
DELETE FROM alumnos WHERE nombre = 'María Fernández';

-- 21. Eliminar la base de datos universidad
DROP DATABASE universidad;