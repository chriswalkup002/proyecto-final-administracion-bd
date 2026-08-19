\# Automatización de Respaldo



\## Script de respaldo automático

El archivo `respaldo\_automatico.bat` genera un respaldo de la base de datos `biblioteca` con la fecha y hora en el nombre del archivo.



\## Cómo ejecutarlo

1\. Abre la carpeta `automatizacion/`

2\. Haz doble clic en `respaldo\_automatico.bat`

3\. Ingresa la contraseña de PostgreSQL cuando se solicite

4\. El respaldo se guardará en el Escritorio con el formato `respaldo\_YYYYMMDD\_HHMMSS.backup`



\## Comando utilizado

```bash

pg\_dump -U postgres -h localhost -F c -b -v -f C:\\Users\\PC\\Desktop\\respaldo\_%FECHA%\_%HORA%.backup biblioteca

