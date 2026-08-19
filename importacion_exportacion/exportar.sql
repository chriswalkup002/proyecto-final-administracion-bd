-- Exportar la tabla libros a CSV, mediante psql para que funcione en otras maquinas

\copy libros TO './libros.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- Comando para poner en psql desde la carpeta

psql -U [usuario] -d biblioteca -f exportar.sql