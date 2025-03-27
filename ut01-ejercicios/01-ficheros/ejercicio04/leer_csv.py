import csv

# Definir los datos para los 5 registros
registros = [
    {"Producto": "Laptop Acer Aspire", "Categoria": "Electrónica", "Precio": "650 €", "Stock": "20"},
    {"Producto": "Auriculares Sony", "Categoria": "Audio", "Precio": "300 €", "Stock": "15"},
    {"Producto": "iPhone 14", "Categoria": "Telefonía", "Precio": "1100 €", "Stock": "10"},
    {"Producto": "Lavadora LG 8kg", "Categoria": "Electrodomésticos", "Precio": "400 €", "Stock": "8"},
    {"Producto": "Bicicleta de Carretera", "Categoria": "Deportes", "Precio": "750 €", "Stock": "12" },
    {"Producto": "Smart TV Samsung 55", "Categoria": "Televisión", "Precio": "900 €", "Stock": "7" },
    {"Producto": "Cama King Size", "Categoria": "Muebles", "Precio": "1200 €", "Stock": "5" },
    {"Producto": "Mesa de Comedor", "Categoria": "Hogar", "Precio": "350 €", "Stock": "6" },
    {"Producto": "Zapatos Deportivos Nike", "Categoria": "Moda", "Precio": "80 €", "Stock": "50" },
    {"Producto": "Cafetera Nespresso", "Categoria": "Cocina", "Precio": "150 €", "Stock": "25" }
]

# Variables de configuración
nombre_fichero = 'productos.csv'  # Nombre del archivo CSV
delimitador = '.'                # Especificar el caracter usado como delimitador
copiar_cabecera = False          # Establecer a True para copiar la cabecera, False en caso contrario

# Abrir y escribir en el archivo CSV
with open(nombre_fichero, mode='w', newline='', encoding='utf-8') as fichero:
    # Definir los nombres de las columnas
    campos = ['Producto', 'Categoria', 'Precio' , 'Stock']
    
    # Crear el objeto escritor con el delimitador especificado
    escritor = csv.DictWriter(fichero, fieldnames=campos, delimiter=delimitador)
    
    # Escribir la cabecera si se ha especificado en la variable
    if copiar_cabecera:
        escritor.writeheader()
    
    # Escribir los registros en el archivo
    for registro in registros:
        escritor.writerow(registro)

print(f"Fichero '{nombre_fichero}' creado y registros insertados correctamente.")