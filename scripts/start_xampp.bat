@echo off
:: Démarrer Apache
echo Démarrage d'Apache...
cd /d C:\xampp
start "" "C:\xampp\apache_start.bat"

:: Démarrer MySQL
echo Démarrage de MySQL...
start "" "C:\xampp\mysql\bin\mysqld.exe" --console

echo Les services Apache et MySQL ont été démarrés.
pause
s