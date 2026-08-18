-- 5 categorias
-- 10 libros
-- 10 socios
-- 5 prestamos

INSERT INTO categorias (nombre_categoria, descripcion)
VALUES
('Epica', 'Se presentan hechos legendarios o ficticios relativos a las hazanias de uno o mas heroes ficticios y a las luchas reales o imaginarias en las que estos han participado'),
('Cuento', 'Narracion breve creada por uno o varios autores, puede ser basada en hechos reales como ficticios, cuya trama es protagonizada por un grupo reducido de personajes y con un argumento relativamente sencillo'),
('Historia', 'Narracion de sucesos del pasado'),
('Novela', 'Narracion de una accion fingida en su totalidad o en parte'),
('Tecnologia', 'Libros sobre tecnologia o informatica');

INSERT INTO libros
(titulo, autor, año_publicacion, genero, ejemplares_disponibles, ejemplares_totales, editorial, id_categoria)
VALUES
('El Cantar de Mio Cid', 'Anonimo', 1200, 'Epica', 10, 20, 'Cervantes', 1),
('Las Mil y Una Noches', 'Varios autores', 1000, 'Cuento', 2, 10, 'Islamica', 2),
('Historia Verdadera de la Conquista de la Nueva Espania', 'Bernal Diaz del Castillo', 1632, 'Historia', 1, 2, 'Cervantes', 3),
('Don Quijote de la Mancha', 'Miguel de Cervantes Saavedra', 1605, 'Novela', 20, 22, 'Cervantes', 4),
('El Lenguaje de Programacion C++', 'Bjarne Stroustrup', 2002, 'Tecnologia', 1, 1, 'Addison-Wesley Pub Co', 5),
('La Odisea', 'Homero', NULL, 'Epica', 10, 20, 'Griegos', 1),
('Caperucita Roja', 'Charles Perrault', 1697, 'Cuento', 20, 50, 'Clasicos', 2),
('Aztecas', 'Eduardo Matos Moctezuma', 2002, 'Historia', 1, 5, 'INAH', 3),
('El Senior de los Anillos', 'J. R. R. Tolkien', 1954, 'Novela', 1, 2, 'George Allen & Unwin HarperCollins', 4),
('Fundamentos de los Microprocesadores', 'Roger L. Tokheim', 1990, 'Tecnologia', 2, 4, 'Planeta', 5);

INSERT INTO socios
(nombre, email, telefono, direccion)
VALUES
('Adrian Ramirez', 'adrian.ramirez@gmail.com', '6181234567', 'Luis Baca 606, Cerro del Mercado, Guadalupe, Durango'),
('Jorge Aviles', 'jorge.aviles@gmail.com', '6191234567', 'Trabajo Social 406, 16 de Septiembre, Durango'),
('Linette Cuellar', 'lunetta.cuellar@gmail.com', '6201234567', 'Mision de San Ignacio 202, Misiones Espania, Durango'),
('Stephany Castro', 'stephany.castro@gmail.com', '6211234567', 'Felipe Angeles 387, Carlos Luna, Durango'),
('Francisco Ibarra', 'francis.ibarra@gmail.com', '6221234567', 'Olga Arias Elenes 228, Santa Amelia, Durango'),
('Constantino Lopez', 'constantino.lopez@gmail.com', '6231234567', 'San Martin 31, San Juan, Durango'),
('Victoria Sanchez', 'victoria.sanchez@gmail.com', '6241234567', 'San Andres 113, San Jose, Durango'),
('Carlos Mariscal', 'carlos.mariscal@gmail.com', '6251234567', 'Calle Punta del Este 212, Guadalupe, Durango'),
('Xavier Romero', 'xavier.romero@gmail.com', '6261234567', 'Playa Roqueta 233, Las Playas, Durango'),
('Gisella Etxeberri', 'gis.etxa@gmail.com', '6271234567', 'General Leon 110, San Diego, Durango');

INSERT INTO prestamos
(id_libro, id_socio, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado_prestamo, observaciones)
VALUES
(1, 1, '2020-02-01', '2020-03-01', '2020-04-22', 'Devuelto', 'La pasta esta daniada'),
(4, 2, '2022-07-02', '2022-07-12', NULL, 'Vencido', 'No ha devuelto el libro'),
(6, 3, '2023-11-10', '2024-01-10', NULL, 'Vencido', 'No ha devuelto el libro'),
(8, 4, '2024-05-26', '2024-06-26', NULL, 'Activo', 'El prestamo sigue vigente'),
(9, 5, '2025-01-01', '2025-03-01', NULL, 'Vencido', 'No ha devuelto el libro');