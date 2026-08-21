-- Detectar al menos dos problemas e incluir una consulta de verificacion

-- Detectar valores nulos: comprobar que los libros tienen titulo y autor.
-- O que los socios no tengan nombre o email nulos
-- La tabla ya tiene NOT NULL, asi que la consulta es un chequeo doble

SELECT * FROM libros WHERE titulo IS NULL OR autor IS NULL;
SELECT * FROM socios WHERE nombre IS NULL OR email IS NULL;


-- Detectar duplicados: verificar que no existan valores duplicados en tabla socios, aunque la tabla ya tiene UNIQUE

SELECT email, COUNT(*) AS cantidad FROM socios GROUP BY email HAVING COUNT(*) > 1;


-- Detectar formatos invalidos: comprobar que los correos tienen un formato razonable

SELECT * FROM socios WHERE email NOT LIKE '%@%.%';

-- Detectar relaciones incorrectas: comprobar si existen prestamos cuyo socio no existe

SELECT p.* FROM prestamos p LEFT JOIN libros l ON p.id_libro = l.id_libro WHERE l.id_libro IS NULL;