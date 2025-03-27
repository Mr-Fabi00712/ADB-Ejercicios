import csv

# Definir los datos para los 10 registros
registros = [
    {"Tipo": "Calle", "Nombre": "Triana", "CP": "35002", "Municipio": "Las Palmas de Gran Canaria", "Isla": "Gran Canaria", "Provincia": "Las Palmas"},
    {"Tipo": "Avenida", "Nombre": "Marítima", "CP": "38800", "Municipio": "San Sebastián de La Gomera", "Isla": "La Gomera", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "de la Luz", "CP": "38400", "Municipio": "Puerto de la Cruz", "Isla": "Tenerife", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida", "Nombre": "de Los Majuelos", "CP": "38107", "Municipio": "La Laguna", "Isla": "Tenerife", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "León y Castillo", "CP": "35500", "Municipio": "Arrecife", "Isla": "Lanzarote", "Provincia": "Las Palmas"},
    {"Tipo": "Calle", "Nombre": "Real", "CP": "38760", "Municipio": "Los Llanos de Aridane", "Isla": "La Palma", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida", "Nombre": "Juan Carlos I", "CP": "35600", "Municipio": "Puerto del Rosario", "Isla": "Fuerteventura", "Provincia": "Las Palmas"},
    {"Tipo": "Calle", "Nombre": "de la Constitución", "CP": "38820", "Municipio": "Hermigua", "Isla": "La Gomera", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "de la Playa", "CP": "38914", "Municipio": "Valverde", "Isla": "El Hierro", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida", "Nombre": "de Las Playas", "CP": "35510", "Municipio": "Tías", "Isla": "Lanzarote", "Provincia": "Las Palmas"}
]

# Variables de configuración
nombre_fichero = 'direcciones.csv'  # Nombre del archivo CSV
delimitador = ';'                    # Especificar el caracter usado como delimitador
copiar_cabecera = True              # Establecer a True para copiar la cabecera, False en caso contrario

# Abrir y escribir en el archivo CSV
with open(nombre_fichero, mode='w', newline='', encoding='utf-8') as fichero:
    # Definir los nombres de las columnas
    campos = ['Tipo', 'Nombre', 'CP', 'Municipio', 'Isla', 'Provincia']
    
    # Crear el objeto escritor con el delimitador especificado
    escritor = csv.DictWriter(fichero, fieldnames=campos, delimiter=delimitador)
    
    # Escribir la cabecera si se ha especificado en la variable
    if copiar_cabecera:
        escritor.writeheader()
    
    # Escribir los registros en el archivo
    for registro in registros:
        escritor.writerow(registro)

print(f"Fichero '{nombre_fichero}' creado y registros insertados correctamente.")