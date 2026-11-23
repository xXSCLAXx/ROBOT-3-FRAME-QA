*** Settings ***
Documentation     Keywords de la seccion de Suscripcion (footer).
Library           SeleniumLibrary
Resource          common.robot
Resource          ../variables/config.robot
Resource          ../variables/locators.robot

*** Keywords ***
Abrir Pagina De Inicio
    [Documentation]    Navega a la pagina principal y valida el titulo.
    Ir A    ${BASE_URL}
    Title Should Be    ${TITLE_HOME}

Ir A La Seccion De Suscripcion
    [Documentation]    Hace scroll al footer y verifica la seccion SUBSCRIPTION.
    Scroll Element Into View    ${FOOTER}
    Element Should Be Visible    ${SUBSCRIBE_EMAIL_INPUT}
    Element Should Contain    ${FOOTER}    ${SUBSCRIPTION_TITLE}    ignore_case=True

Suscribirse Con Correo
    [Documentation]    Escribe el correo y pulsa el boton de suscripcion.
    [Arguments]    ${correo}
    Escribir Texto    ${SUBSCRIBE_EMAIL_INPUT}    ${correo}
    Hacer Click    ${SUBSCRIBE_BUTTON}

Validar Suscripcion Exitosa
    [Documentation]    Verifica que aparezca el mensaje de exito.
    [Arguments]    ${mensaje}
    Wait Until Element Is Visible    ${SUBSCRIBE_SUCCESS}
    Element Should Contain    ${SUBSCRIBE_SUCCESS}    ${mensaje}
    Page Should Contain    ${mensaje}
