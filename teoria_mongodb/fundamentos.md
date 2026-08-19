# Sección teórica de MongoDB
---

## ¿Qué es una base de datos NO relacional y qué es MongoDB?
---
Una base de datos No Relacional o NoSQL es un tipo de base de datos que no organiza la información mediante tablas y relaciones. En vez de ello, utiliza documentos, pares clave-valor, columnas, etc.

MongoDB es un sistema de gestión de base de datos NoSQL orientado a documentos. Almacena la información principalmente como documentos muy similares a los JSON. Esto permite que la estructura de los datos sea flexible y que diferentes datos de una misma colección puedan tener campos distintos.

## ¿Qué es una colección, documento y campo?
---
Colección: son documentos relacionados. Es similar a las tablas de las bases de datos relacionales.<br>
Documento: es un registro individual almacenado en una colección. Su estructura es de pares clave-valor.<br>
Campo: es una propiedad dentro de un documento. Es similar a la columna en las tablas de las bases de datos relacionales.

## ¿Cuáles son las diferencias principales entre una tabla relacional y una colección de documentos?
---
### Bases de datos relacionales:
- Tablas.
- Registros o filas.
- Esquema definido.
- Las relaciones se establecen por llaves primarias y foráneas.
- Utiliza SQL para las consultas.
- Es común normalizar datos en varias tablas.

### MongoDB (NoSQL):
- Colecciones.
- Documentos.
- Esquema flexible.
- Puede almacenar datos relacionados dentro del mismo documento.
- Utiliza consultas propias de MongoDB.
- Es común incrustaar información relacionada cuando resulte conveniente.

## Dos ventajas y dos limitaciones de MongoDB
---
### Ventajas:
- Flexibilidad: el esquema de MongoDb permite modificar la estructura de los documentos con facilidad.
- Escalabilidad y rendimiento: está diseñado para manejar enormes cantidades de documentos y puede distribuir los datos entre diferentes servidores.

### Limitaciones:
- No siempre es la mejor opción para relaciones complejas: cuando existen varias relaciones entre entidades y se necesitan consultas relacionales complejas, parece mejor opción una base de datos relacional.
- Mayor responsabilidad en el diseño de datos: la flexibilidad del esquema puede provocar datos inconsistentes si no se establecen adecuadamente reglas de validación y estructura.

## ¿En qué situaciones conviene utilizar PostgreSQL y cuándo MongoDB?
---
PostgreSQL conviene cuando el sistema requiere manejar información altamente estructurada, relaciones múltiples, restricciones de integridad y transacciones complejas.

MongoDB conviene cuando los datos tienen una estructura variable, cuando se necesite almacenar grandes cantidades de documentos o cuando se rquiere de modificar con frecuencia la estructura de la información.

## Dentro del caso elegido, ¿qué información podría almacenarse en MongoDB y por qué?
---
Para nuestro sistema de biblioteca, podríamos utilizar MongoDB para almacenar información complementaria de los libros, datos que varíen entre diferentes ejemplares (etiquetas, reseñas, palabras clave, información editorial, metadatos, etc.). Mongo sería útil porque esa información puede tener diferentes características dependiendo del libro y no necesita estructurarse uniformemente.

## Ejemplo sencillo de cómo se vería un registro del proyecto como documento JSON.
---
```
{
    "_id": 1,
    "autor": "Anonimo",
    "anio_publicacion": 1200,
    "categoria": {
        "nombre": "Epica"
    },
    "disponible": true,
    "etiquetas": [
        "epica",
        "cantar de gesta",
        "reconquista
    ]
}
```
