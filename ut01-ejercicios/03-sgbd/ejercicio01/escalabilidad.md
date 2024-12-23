# ¿Qué es la escalabilidad vertical y escalabilidad horizontal? 

## Escalabilidad Vertical vs Escalabilidad Horizontal

1. __Escalabilidad Vertical (Vertical Scaling):__ La escalabilidad vertical consiste en mejorar el rendimiento de un sistema añadiendo más recursos a un solo servidor o nodo, como más CPU, memoria RAM o almacenamiento. En el contexto de bases de datos, esto implica que una base de datos funciona en un servidor más potente para manejar más datos o consultas. Sin embargo, este enfoque tiene un límite físico y puede ser costoso una vez alcanzado cierto nivel de hardware.

### __Ventajas:__ 

+ __Sencillez:__ No requiere cambiosen la aplicación o arquitectura. Menos complejidad en la gestión de datos.

### Inconvenientes:
  
__Limitaciones físicas:__ Hay un límite en cuanto a cuánta capacidad se puede agregar a un servidor.

__Costo elevado:__ Servidores más potentes tienden a ser mucho más costosos.

2. __Escalabilidad Horizontal (Horizontal Scaling):__ La escalabilidad horizontal implica agregar más servidores o nodos a un sistema para distribuir la carga de trabajo. En lugar de depender de un solo servidor más potente, se añaden más máquinas y los datos o las consultas se distribuyen entre ellos. Esto es común en sistemas distribuidos y es más adecuado para manejar grandes volúmenes de datos y un número creciente de usuarios.
   
### Ventajas:

+ Mejora de rendimiento a gran escala: Se pueden añadir tantos servidores como sea necesario.
+ Mayor tolerancia a fallos: Al distribuir los datos entre varios nodos, un fallo en uno de ellos no afecta a todo el sistema.
  
### Inconvenientes:

+ Mayor complejidad: Requiere una arquitectura más sofisticada para gestionar la distribución de datos y la consistencia.
  
+ Dificultad en la gestión de transacciones en sistemas distribuidos.

# ¿Qué SGBD permiten un mejor escalado horizontal?

1. __Bases de datos NoSQL:__ Estas bases de datos están diseñadas específicamente para soportar la escalabilidad horizontal, lo que las hace más adecuadas para sistemas distribuidos. Ejemplos:

+ __MongoDB:__ Distribuye datos entre diferentes nodos a través de "sharding", lo que facilita la escalabilidad horizontal.

+ __Cassandra:__ Es una base de datos distribuida que escala horizontalmente añadiendo más nodos sin afectar el rendimiento.

+ __Couchbase:__ Soporta la distribución de datos y cargas de trabajo en clústeres, facilitando el escalado horizontal.

2. __Bases de datos relacionales (RDBMS):__ Tradicionalmente, las bases de datos relacionales no estaban diseñadas para la escalabilidad horizontal, pero algunas han comenzado a soportar este tipo de escalabilidad mediante técnicas como particionamiento y replicación.
 
+ __MySQL:__ Puede escalar horizontalmente utilizando "sharding" o soluciones como Galera Cluster.

+ __PostgreSQL:__ Aunque históricamente se ha centrado más en la escalabilidad vertical, hay soluciones como Citus que permiten el escalado horizontal en PostgreSQL.

## Enlaces recomendados para más información:

[Escalabilidad en bases de datos (MongoDB)](https://www.mongodb.com/basics/scalability)

[Escalado horizontal y vertical explicado (Couchbase)](https://www.arsys.es/blog/escalado-horizontal-vs-vertical)
