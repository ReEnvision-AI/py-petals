@ECHO off

:: Check to make sure docker is available
WHERE docker
IF %ERRORLEVEL% NEQ 0 (
    ECHO Install Docker please 
) ELSE (
    docker run -p 31330:31330 --ipc host --gpus all --volume petals-cache:/cache --rm ghcr.io/pgawestjones/petals python -m petals.cli.run_server petals-team/StableBeluga2 --port 31330
)