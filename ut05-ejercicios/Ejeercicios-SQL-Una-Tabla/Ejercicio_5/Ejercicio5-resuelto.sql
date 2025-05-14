-- 1. Listado con nombre y apellidos de todos los alumnos ordenado
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

-- 2. Alumnos sin número de teléfono
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Alumnos nacidos en 1999
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4. Profesores sin teléfono y NIF terminado en 'K'
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5. Asignaturas del primer cuatrimestre, tercer curso, grado id=7
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Nombres de todos los alumnos
SELECT nombre FROM persona WHERE tipo = 'alumno';

-- 7. Alumnos que viven en Madrid
SELECT * FROM persona WHERE tipo = 'alumno' AND ciudad = 'Madrid';

-- 8. Alumnos cuya ciudad comience por 'S'
SELECT * FROM persona WHERE tipo = 'alumno' AND ciudad LIKE 'S%';

-- 9. Alumnos que no viven en Madrid
SELECT * FROM persona WHERE tipo = 'alumno' AND ciudad != 'Madrid';

-- 10. Total de alumnos
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';

-- 11. Ciudades diferentes entre alumnos
SELECT COUNT(DISTINCT ciudad) AS ciudades_distintas FROM persona WHERE tipo = 'alumno';

-- 12. Nombres y ciudades de los alumnos ordenados por ciudad
SELECT nombre, ciudad FROM persona WHERE tipo = 'alumno' ORDER BY ciudad;

-- 13. Número de alumnos por ciudad
SELECT ciudad, COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno' GROUP BY ciudad;

-- 14. Alumnos con una "a" en su nombre
SELECT * FROM persona WHERE tipo = 'alumno' AND nombre LIKE '%a%';

-- 15. Alumnos con ciudad de exactamente 5 caracteres
SELECT * FROM persona WHERE tipo = 'alumno' AND CHAR_LENGTH(ciudad) = 5;
