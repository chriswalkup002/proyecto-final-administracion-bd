# Respaldo y Restauración

## Respaldo
```
pg_dump -U postgres -h localhost -F c -b -v -f C:\Users\PC\Desktop\respaldo_biblioteca.backup biblioteca
```

## Restauración
```
pg_restore -U postgres -h localhost -d biblioteca_restaurada C:\Users\PC\Desktop\respaldo_biblioteca.backup
```

## Verificación
```
SELECT COUNT(*) FROM categorias;  -- 5
SELECT COUNT(*) FROM libros;      -- 10
SELECT COUNT(*) FROM socios;      -- 10
SELECT COUNT(*) FROM prestamos;   -- 5
```

## Resultado
_La restauración fue exitosa. Todos los datos coinciden con la base original._
