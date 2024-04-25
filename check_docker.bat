@echo off
title Checking Docker status
tasklist /FI "IMAGENAME eq Docker Desktop.exe" /FI "STATUS eq RUNNING" /NH | findstr "Docker Desktop.exe"
if "%ERRORLEVEL%"=="0" (
    echo Docker Desktop is running
) else (
    echo Docker Desktop is not running, starting now
    "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    timeout /t 10
)
