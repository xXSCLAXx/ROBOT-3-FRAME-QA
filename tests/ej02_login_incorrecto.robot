*** Settings ***
Documentation     Ejercicio 2 - Login Incorrecto.
...               Automatiza un inicio de sesion con credenciales invalidas
...               y valida el mensaje de error mostrado por la aplicacion.
Resource          ../keywords/common.robot
Resource          ../keywords/login_keywords.robot
Resource          ../variables/test_data.robot
Test Setup        Abrir Navegador En    ${BASE_URL}
Test Teardown     Cerrar Navegador
Test Tags         login    negativo

*** Test Cases ***
Login Con Credenciales Invalidas Muestra Error
    [Documentation]    Valida titulo, mensaje de error y que el usuario no accede.
    Abrir Pagina De Login
    Tomar Evidencia    ej02_01_pagina_login
    Iniciar Sesion Con    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Validar Mensaje De Error De Login    ${LOGIN_ERROR_MSG}
    Validar Que El Usuario No Inicio Sesion
    Tomar Evidencia    ej02_02_error_login
