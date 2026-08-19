-- ============================================
-- PROYECTO FINAL - BIBLIOTECA
-- Script 04: Creación de usuarios y permisos
-- ============================================

-- 1. Crear usuarios
CREATE USER usuario_consulta WITH PASSWORD 'consulta123';
CREATE USER usuario_captura WITH PASSWORD 'captura123';

-- 2. Asignar permisos

-- Usuario de consulta (SOLO LECTURA)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usuario_consulta;

-- Usuario de captura (LECTURA, INSERCIÓN, ACTUALIZACIÓN, ELIMINACIÓN)
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_captura;

-- Permisos sobre secuencias (para que los INSERT funcionen)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usuario_captura;