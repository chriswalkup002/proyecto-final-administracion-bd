-- ============================================
-- PROYECTO FINAL - BIBLIOTECA
-- Script 01: Creación de la base de datos y tablas
-- ============================================

-- 1. Crear la base de datos
CREATE DATABASE biblioteca;

-- 2. Conectarse a la base
\c biblioteca;

-- 3. Eliminar tablas si existen (por si ya están creadas)
DROP TABLE IF EXISTS prestamos CASCADE;
DROP TABLE IF EXISTS libros CASCADE;
DROP TABLE IF EXISTS socios CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;

-- 4. Crear tabla CATEGORIAS
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- 5. Crear tabla LIBROS
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    año_publicacion INTEGER CHECK (año_publicacion >= 1000 AND año_publicacion <= EXTRACT(YEAR FROM CURRENT_DATE)),
    genero VARCHAR(50),
    ejemplares_disponibles INTEGER DEFAULT 1 CHECK (ejemplares_disponibles >= 0),
    ejemplares_totales INTEGER DEFAULT 1 CHECK (ejemplares_totales >= ejemplares_disponibles),
    editorial VARCHAR(100),
    id_categoria INTEGER REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

-- 6. Crear tabla SOCIOS
CREATE TABLE socios (
    id_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    estado VARCHAR(20) DEFAULT 'Activo' CHECK (estado IN ('Activo', 'Inactivo', 'Sancionado'))
);

-- 7. Crear tabla PRESTAMOS
CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_libro INTEGER NOT NULL REFERENCES libros(id_libro) ON DELETE CASCADE,
    id_socio INTEGER NOT NULL REFERENCES socios(id_socio) ON DELETE CASCADE,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion_esperada DATE NOT NULL,
    fecha_devolucion_real DATE,
    estado_prestamo VARCHAR(20) DEFAULT 'Activo' CHECK (estado_prestamo IN ('Activo', 'Devuelto', 'Vencido')),
    observaciones TEXT,
    CONSTRAINT fecha_logica CHECK (
        (fecha_devolucion_real IS NULL) OR 
        (fecha_devolucion_real >= fecha_prestamo)
    ),
    CONSTRAINT fecha_esperada_logica CHECK (
        fecha_devolucion_esperada >= fecha_prestamo
    )
);

-- 8. Crear índices para mejorar rendimiento
CREATE INDEX idx_prestamos_socio ON prestamos(id_socio);
CREATE INDEX idx_prestamos_libro ON prestamos(id_libro);
CREATE INDEX idx_prestamos_fecha ON prestamos(fecha_prestamo);
CREATE INDEX idx_libros_categoria ON libros(id_categoria);
CREATE INDEX idx_libros_autor ON libros(autor);
CREATE INDEX idx_socios_email ON socios(email);

-- 9. Mensaje de confirmación
\echo 'Base de datos y tablas creadas exitosamente'