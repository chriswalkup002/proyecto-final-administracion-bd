@echo off
echo ========================================
echo Respaldando la base de datos biblioteca
echo ========================================

set FECHA=%DATE:~-4,4%%DATE:~-10,2%%DATE:~-7,2%
set HORA=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set NOMBRE=respaldo_%FECHA%_%HORA%.backup

pg_dump -U postgres -h localhost -F c -b -v -f C:\Users\PC\Desktop\%NOMBRE% biblioteca

echo ========================================
echo Respaldo completado: %NOMBRE%
echo ========================================
pause