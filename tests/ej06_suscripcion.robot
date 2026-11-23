*** Settings ***
Documentation     Ejercicio 6 - Suscripcion.
...               Registra un correo en la seccion de suscripcion del footer
...               y valida el mensaje de exito.
Resource          ../keywords/common.robot
Resource          ../keywords/subscription_keywords.robot
Resource          ../variables/test_data.robot
Test Setup        Abrir Navegador En    ${BASE_URL}
Test Teardown     Cerrar Navegador
Test Tags         suscripcion

*** Test Cases ***
Suscripcion Con Correo Valido Muestra Mensaje De Exito
    [Documentation]    Valida titulo, seccion SUBSCRIPTION visible y mensaje de exito.
    Abrir Pagina De Inicio
    Ir A La Seccion De Suscripcion
    Tomar Evidencia    ej06_01_seccion_suscripcion
    ${correo}=    Generar Correo Unico
    Suscribirse Con Correo    ${correo}
    Validar Suscripcion Exitosa    ${SUBSCRIPTION_OK_MSG}
    Tomar Evidencia    ej06_02_suscripcion_exitosa
