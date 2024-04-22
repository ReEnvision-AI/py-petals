@echo off

SETLOCAL
set url=https://desktop.docker.com/win/main/amd64/Docker%%20Desktop%%20Installer.exe?utm_location=module
set file=".\Docker Desktop Installer.exe"
echo %file%
echo %url%
curl.exe --output %file% --url %url%
%file% install --quiet --accept-license --no-windows-containers
del %file%
C:\Program Files\Docker\Docker\dockerd.exe
ENDLOCAL