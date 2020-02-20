@ECHO OFF

SETLOCAL
SET first=%1
SET second=%2
SET PWD=%cd%

docker-compose -f %~dp0/docker-compose.yml up