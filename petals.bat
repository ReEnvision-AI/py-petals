@echo off
title Reenvision AI
:: Check to make sure docker is available
WHERE docker
IF %ERRORLEVEL% NEQ 0 (
    echo Install Docker please
    .\install_docker.bat
    echo Docker has been installed, start Docker Desktop, open a new shell and run this batch file again
) ELSE (
    .\check_docker.bat
    docker pull ghcr.io/reenvision-ai/petals:latest
    docker pull doomsuckle/johnos:v1
    docker run -p 31330:31330 -d --ipc host --gpus all --volume petals-cache:/cache --rm ghcr.io/reenvision-ai/petals python -m petals.cli.run_server petals-team/StableBeluga2 --port 31330
    docker run -p 8000:8000 -d doomsuckle/johnos:v1
)