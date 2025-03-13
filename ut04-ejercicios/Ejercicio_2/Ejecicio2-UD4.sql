-- Gestión de Pacientes e Historias Clínicas (Relación Uno a Uno - 1:1)

-- Cada paciente tiene una única historia clínica.

-- 1. Crear la base de datos `hospital` con `utf8mb4_unicode_ci`
CREATE DATABASE hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos `hospital` para cambiar su `collation` a `utf8mb4_general_ci`
ALTER DATABASE hospital COLLATE utf8mb4_general_ci;

-- 3. Crear la tabla `pacientes`
CREATE TABLE pacientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla `historias_clinicas`
CREATE TABLE historias_clinicas (
    paciente_id INT UNSIGNED PRIMARY KEY,
    diagnostico TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

-- 5. Modificar `historias_clinicas` agregando una columna `tratamiento`
ALTER TABLE historias_clinicas ADD COLUMN tratamiento TEXT;

-- 6. Cambiar el tamaño del campo `nombre` en `pacientes` a 150 caracteres
ALTER TABLE pacientes MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- 7. Agregar la columna `telefono` en `pacientes`
ALTER TABLE pacientes ADD COLUMN telefono VARCHAR(15) AFTER nombre;

-- 8. Cambiar `telefono` a tipo `BIGINT`
ALTER TABLE pacientes MODIFY COLUMN telefono BIGINT;

-- 9. Eliminar la columna `telefono` en `pacientes`
ALTER TABLE pacientes DROP COLUMN telefono;

-- 10. Insertar un paciente llamado "Juan Pérez"
INSERT INTO pacientes (nombre) VALUES ('Juan Pérez');

-- 11. Insertar una historia clínica para "Juan Pérez"
INSERT INTO historias_clinicas (paciente_id, diagnostico) 
VALUES ((SELECT id FROM pacientes WHERE nombre = 'Juan Pérez'), 'Hipertensión');

-- 12. Insertar dos pacientes adicionales
INSERT INTO pacientes (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- 13. Añadir historias clínicas para los nuevos pacientes
INSERT INTO historias_clinicas (paciente_id, diagnostico) 
VALUES 
    ((SELECT id FROM pacientes WHERE nombre = 'Ana Gómez'), 'Diabetes Tipo 2'),
    ((SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz'), 'Asma');

-- 14. Consultar todas las historias clínicas junto con el nombre del paciente
SELECT pacientes.nombre, historias_clinicas.diagnostico, historias_clinicas.fecha_registro
FROM historias_clinicas
JOIN pacientes ON historias_clinicas.paciente_id = pacientes.id;

-- 15. Mostrar pacientes sin historia clínica registrada
SELECT pacientes.nombre
FROM pacientes
LEFT JOIN historias_clinicas ON pacientes.id = historias_clinicas.paciente_id
WHERE historias_clinicas.paciente_id IS NULL;

-- 16. Actualizar el diagnóstico de "Juan Pérez"
UPDATE historias_clinicas
SET diagnostico = 'Hipertensión crónica'
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Juan Pérez');

-- 17. Eliminar la historia clínica de "Carlos Ruiz"
DELETE FROM historias_clinicas 
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz');

-- 18. Consultar la estructura de la tabla `historias_clinicas`
DESCRIBE historias_clinicas;

-- 19. Eliminar las tablas `historias_clinicas` y `pacientes`
DROP TABLE historias_clinicas;
DROP TABLE pacientes;

-- 20. Eliminar la base de datos `hospital`
DROP DATABASE hospital;
