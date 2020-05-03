@ECHO OFF

SETLOCAL EnableDelayedExpansion 
SET args=
SET PWD=%cd%
for %%i in (%*) DO SET args=!args! '%%~i'
docker-compose -f %~dp0/docker-compose.yml up
