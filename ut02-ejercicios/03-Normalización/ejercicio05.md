# Ejercicio 5

En una universidad, se lleva un registro de cursos, estudiantes y sus calificaciones. Sin embargo, la tabla CursosEstudiantes no está completamente normalizada.

Normaliza la tabla CursosEstudiantes para que cumpla con 1FN, 2FN y 3FN. Identifica las dependencias funcionales y elimina las dependencias parciales y transitivas en cada paso.

![alt text](image-2.png)

## Dependencias funcionales

RegistroID → EstudianteID

EstudianteID → NombreEstudiante → Cursos → Profesor → Notas → Departamento

## Primera Forma Normal

La tabla debe contener solo valores atómicos, por lo que los campos con listas deben dividirse. Como se puede ver en la tabla Cursos y Notas contienen dos valores, así que, creamos una Tabla llamada __CursosNotas__:

|RegistroID|EstudianteID|NombreEstudiante|Curso|Profesor|Nota|Departamento|
|-----|------|-----|-----|-----|------|-------|
|1|201|Alicia|Matemáticas|"Dr.Pérez"|85|Ciencias|
|1|201|Alicia|Física|"Dr.Pérez"|90|Ciencias|
|2|202|Roberto|Matemáticas|"Dr.Pérez"|78|Ciencias|
|2|202|Roberto|Química|"Dr.Pérez"|88|Ciencias|
|3|203|Julia|Historia|"Dr.Gómez"|92|Humanidades|
|3|203|Julia|Literatura|"Dr.Gómez"|80|Humanidades|
|4|204|Mario|Química|"Dr.Pérez"|75|Ciencias|

## Segunda Forma Normal (2FN)

La tabla debe estar en 1FN y no debe tener dependencias parciales. Los atributos no clave deben depender de toda la clave primaria.

__Dependencias parciales:__

+ _NombreEstudiante_ depende de _EstudianteID_.

+ _Departamento_ depende de _Curso_.



Creamos la tabla __Estudiantes__:

| EstudianteID | NombreEstudiante | 
|--------------|------------------| 
| 201 | Alicia | 
| 202 | Roberto | 
| 203 | Julia | 
| 204 | Mario |



Creamos la tabla __Cursos__:

| CursoID | Curso | Departamento | 
|---------|-------------|--------------| 
| 1 | Matemáticas | Ciencias | 
| 2 | Física | Ciencias | 
| 3 | Química | Ciencias | 
| 4 | Historia | Humanidades |
| 5 | Literatura | Humanidades |



 ## Tercera Forma Normal (3FN)

La tabla debe estar en 2FN y no debe tener dependencias transitivas. Un atributo no clave no debe depender de otro atributo no clave.


__Dependencias transitivas eliminadas__:


__Profesor__ depende de __Curso__.

+ Creamos la tabla Profesores:

| CursoID | Profesor | 
|---------|-------------| 
| 1 | Dr. Pérez |
| 2 | Dr. Pérez | 
| 3 | Dr. Pérez | 
| 4 | Dr. Gómez | 
| 5 | Dr. Gómez |

+ Tabla final RegistroCursos:

| RegistroID | EstudianteID | CursoID | Nota |
|---------|-------------|---------|-------------| 
|1 |201 |1 |85 |
|1 |201 |2 |90 |
|2 |202 |1 |78 |
|2 |202 |3 |88 |
|3 |203 |4 |92 |
|3 |203 |5 |80 |
|4 |204 |3 |75 |
