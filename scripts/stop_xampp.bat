@echo off
:: Arrêter Apache
echo Arrêt d'Apache...
taskkill /IM httpd.exe /F

:: Attendre un moment pour s'assurer que Apache s'arrête correctement
timeout /t 3 /nobreak

:: Arrêter MySQL
echo Arrêt de MySQL...
taskkill /F /IM mysqld.exe

:: Message de confirmation
echo Les services Apache et MySQL ont été arrêtés.
pause
