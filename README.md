# Proyecto final Administración de Bases de Datos

## Proyecto: "Base de datos para una biblioteca"

## Integrantes:
- Marco Gonzalez
- Cristopher Walkup

## Descripción
Se implementa una base de datos para una biblioteca para la correcta gestión de los libros, socios y préstamos realizados.


## Requisitos para ejecutar el proyecto
- Tener PostgreSQL instalado.
- Tener pgAdmin 4 instalado (para mejor gestión y visualización de las consultas).
- Tener nociones básicas de manejo de Bases de Datos relacionales.

## Orden de ejecución de los scripts SQL
1. Ejecutar `01_creacion.sql` para crear la base de datos con sus tablas y relaciones.
2. Ejecutar `02_datos.sql` para insertar los datos a la base de datos.
3. Ejecutar `03_consultas.sql` para realizar las consultas deseadas.
4. Ejecutar `04_usuarios_permisos.sql` para crear los usuarios y asignar permisos.
5. Ejecutar `05_calidad_monitoreo.sql` para verificar la calidad de los datos.

## Procedimientos de respaldo, restauración, importación, exportación y automatización

### Respaldo y restauración
Para generar un respaldo de la base de datos `biblioteca` se utilizó el siguiente comando:
pg_dump -U postgres -h localhost -F c -b -v -f C:\Users\PC\Desktop\respaldo_biblioteca.backup biblioteca

Para restaurar el respaldo en una nueva base llamada `biblioteca_restaurada`:
pg_restore -U postgres -h localhost -d biblioteca_restaurada C:\Users\PC\Desktop\respaldo_biblioteca.backup

### Importación y exportación CSV
Para exportar la tabla `libros` a un archivo CSV:
psql -U postgres -d biblioteca -c "\COPY libros TO 'C:\Users\PC\Desktop\libros_exportados.csv' DELIMITER ',' CSV HEADER;"

Para importar nuevos libros desde un archivo CSV:
psql -U postgres -d biblioteca -c "\COPY libros (titulo, autor, año_publicacion, genero, ejemplares_disponibles, ejemplares_totales, editorial, id_categoria) FROM 'C:\Users\PC\Desktop\nuevos_libros.csv' DELIMITER ',' CSV HEADER;"

### Automatización
Se creó un script `respaldo_automatico.bat` que genera un respaldo con la fecha y hora actual en el nombre del archivo. Al ejecutarlo, se conecta a PostgreSQL y guarda un respaldo en el Escritorio sin necesidad de escribir manualmente el comando.

## Explicación de las pruebas de usuarios y calidad

### Pruebas de usuarios
Se crearon dos usuarios con diferentes niveles de permiso:

- **usuario_consulta**: Solo puede leer datos (SELECT). Se comprobó que no puede insertar, modificar ni eliminar registros.
- **usuario_captura**: Puede leer, insertar, modificar y eliminar datos (SELECT, INSERT, UPDATE, DELETE).

Las pruebas confirmaron que los permisos funcionan correctamente y que cada usuario solo puede realizar las acciones asignadas.

### Pruebas de calidad
Se ejecutaron consultas para verificar la integridad de los datos:

- **Valores nulos**: Se verificó que los campos obligatorios (título, autor, email) no estén vacíos.
- **Duplicados**: Se comprobó que no haya correos electrónicos duplicados en la tabla `socios`.
- **Formatos inválidos**: Se revisó que los correos electrónicos tengan un formato válido (contengan '@' y '.').
- **Relaciones incorrectas**: Se verificó que todos los préstamos estén asociados a libros y socios existentes.

Todas las consultas devolvieron 0 resultados, lo que confirma que los datos son consistentes y no presentan problemas de calidad.

## Enlace a la sección teórica de MongoDB

La sección teórica de MongoDB se encuentra en el siguiente archivo:
[teoria_mongodb/fundamentos.md](https://github.com/chriswalkup002/proyecto-final-administracion-bd/blob/main/teoria_mongodb/fundamentos.md)

## Conclusiones

El desarrollo de este proyecto nos permitió aplicar los conceptos fundamentales de la administración de bases de datos en un caso práctico real. Logramos implementar una base de datos funcional en PostgreSQL, gestionar usuarios y permisos, realizar respaldos y restauraciones, automatizar tareas repetitivas, manejar datos en formato CSV y verificar la calidad de la información.

Además, exploramos las diferencias entre bases de datos relacionales y NoSQL a través del estudio de MongoDB, comprendiendo sus ventajas, limitaciones y casos de uso adecuados.

El uso de GitHub como herramienta de control de versiones facilitó el trabajo colaborativo y permitió mantener un registro ordenado de todos los scripts, documentación y evidencias del proyecto.

## Fuentes consultadas
- PostgreSQL Global Development Group. (2026). Constraints. PostgreSQL Documentation. Recuperado el 16/08/2026. https://www.postgresql.org/docs/current/ddl-constraints.html
- PostgreSQL Global Development Group. (2026). CREATE TABLE. PostgreSQL Documentation. Recuperado el 16/08/2026. https://www.postgresql.org/docs/current/sql-createtable.html
- PostgreSQL Global Development Group. (2026). SELECT. PostgreSQL Documentation. Recuperado el 16/08/2026. https://www.postgresql.org/docs/current/sql-select.html
- PostgreSQL Global Development Group. (2026). COPY. PostgreSQL Documentation. Recuperado el 16/08/2026. https://www.postgresql.org/docs/current/sql-copy.html

Se ha hecho uso de la Inteligencia Artificial como herramienta auxiliar en la consulta de dudas específicas en el proceso de desarrollo de ciertas partes del proyecto.