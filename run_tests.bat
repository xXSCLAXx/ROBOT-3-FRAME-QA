@echo off
REM Ejecuta todos los escenarios y deja los reportes en reports/
cd /d %~dp0
set PYTHONIOENCODING=utf-8
python -m robot --outputdir reports --name "Practica 3 - Robot Framework" tests
