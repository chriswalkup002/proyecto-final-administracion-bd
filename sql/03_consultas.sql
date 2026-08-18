-- Consultar todos los libros disponibles
SELECT titulo, autor, genero, ejemplares_disponibles FROM libros WHERE ejemplares_disponibles > 0;

-- Consultar los socios registrados y su estado
SELECT id_socio, nombre, email, telefono, estado FROM socios WHERE estado = 'Activo';

-- Consultar los prestamos mostrando el nombre del socio y el titulo del libro, utilizando un JOIN
SELECT prestamos.id_prestamo, socios.nombre AS socio, libros.titulo AS libro, prestamos.fecha_prestamo, prestamos.fecha_devolucion_esperada, prestamos.fecha_devolucion_real, prestamos.estado_prestamo FROM prestamos JOIN socios ON prestamos.id_socio = socios.id_socio JOIN libros ON prestamos.id_libro = libros.id_libro;

-- Consultar los prestamos que estan vencidos
SELECT id_prestamo, id_libro, id_socio, fecha_prestamo, fecha_devolucion_esperada, estado_prestamo FROM prestamos WHERE estado_prestamo = 'Vencido';

--Contar cuantos libros hay en cada categoria
SELECT categorias.nombre_categoria AS categoria, COUNT(Libros.id_libro) AS cantidad_libros FROM categorias LEFT JOIN libros ON categorias.id_categoria = libros.id_categoria GROUP BY categorias.id_categoria, categorias.nombre_categoria ORDER BY cantidad_libros DESC;