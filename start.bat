@ECHO OFF

SETLOCAL
SET args="%*"
SET PWD=%cd%

docker-compose -f %~dp0/docker-compose.yml up
