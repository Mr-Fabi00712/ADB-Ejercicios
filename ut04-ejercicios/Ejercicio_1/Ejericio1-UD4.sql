-- Ejercicio 1: Usuarios y Direcciones (Relación Uno a Uno - 1:1)

-- 1. Crear la base de datos `usuarios_db` con `utf8mb4_unicode_ci`
CREATE DATABASE usuarios_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos `usuarios_db` para cambiar su `collation` a `utf8mb4_general_ci`
ALTER DATABASE usuarios_db COLLATE utf8mb4_general_ci;

-- 3. Crear la tabla `usuarios` con los campos necesarios
CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla `direcciones` donde cada usuario tiene una única dirección
CREATE TABLE direcciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- 5. Modificar `direcciones` para cambiar la clave primaria y hacer que `usuario_id` sea clave primaria y clave foránea a la vez
ALTER TABLE direcciones DROP PRIMARY KEY, ADD PRIMARY KEY (usuario_id);

-- 6. Cambiar el tamaño del campo `nombre` en `usuarios` a 150 caracteres
ALTER TABLE usuarios MODIFY nombre VARCHAR(150) NOT NULL;

-- 7. Agregar una nueva columna `telefono` de tipo `VARCHAR(15)` después del campo `nombre` en `usuarios`
ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(15) AFTER nombre;

-- 8. Cambiar el tipo de dato de `telefono` en `usuarios` para que sea `BIGINT`
ALTER TABLE usuarios MODIFY telefono BIGINT;

-- 9. Eliminar la columna `telefono` en `usuarios`
ALTER TABLE usuarios DROP COLUMN telefono;

-- 10. Insertar un usuario llamado "Juan Pérez"
INSERT INTO usuarios (nombre) VALUES ('Juan Pérez');

-- 11. Insertar una dirección "Calle Mayor 123" para el usuario "Juan Pérez"
INSERT INTO direcciones (usuario_id, direccion) VALUES (1, 'Calle Mayor 123');

-- 12. Insertar dos usuarios adicionales ("Ana Gómez" y "Carlos Ruiz")
INSERT INTO usuarios (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- 13. Añadir direcciones para los nuevos usuarios
INSERT INTO direcciones (usuario_id, direccion) 
VALUES (2, 'Avenida Sol 456'), (3, 'Calle Luna 789');

-- 14. Consultar todas las direcciones junto con el nombre del usuario
SELECT usuarios.nombre, direcciones.direccion 
FROM usuarios 
LEFT JOIN direcciones ON usuarios.id = direcciones.usuario_id;

-- 15. Mostrar todos los usuarios que no tienen dirección registrada
SELECT usuarios.nombre 
FROM usuarios 
LEFT JOIN direcciones ON usuarios.id = direcciones.usuario_id 
WHERE direcciones.usuario_id IS NULL;

-- 16. Actualizar la dirección de "Juan Pérez" a "Avenida Central 456"
UPDATE direcciones 
SET direccion = 'Avenida Central 456' 
WHERE usuario_id = 1;

-- 17. Eliminar la dirección de "Carlos Ruiz"
DELETE FROM direcciones WHERE usuario_id = 3;

-- 18. Consultar la estructura de la tabla `direcciones`
DESC direcciones;

-- 19. Eliminar las tablas `direcciones` y `usuarios`
DROP TABLE direcciones;
DROP TABLE usuarios;

-- 20. Eliminar la base de datos `usuarios_db`
DROP DATABASE usuarios_db;
