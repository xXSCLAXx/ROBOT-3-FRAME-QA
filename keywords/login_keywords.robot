*** Settings ***
Documentation     Keywords de la pagina de Login.
Library           SeleniumLibrary
Resource          common.robot
Resource          ../variables/config.robot
Resource          ../variables/locators.robot

*** Keywords ***
Abrir Pagina De Login
    [Documentation]    Navega a /login y verifica que el formulario este disponible.
    Ir A    ${LOGIN_URL}
    Title Should Be    ${TITLE_LOGIN}
    Element Should Be Visible    ${LOGIN_FORM}

Iniciar Sesion Con
    [Documentation]    Completa el formulario de login y lo envia.
    [Arguments]    ${email}    ${password}
    Escribir Texto    ${LOGIN_EMAIL_INPUT}    ${email}
    Escribir Texto    ${LOGIN_PASSWORD_INPUT}    ${password}
    Hacer Click    ${LOGIN_BUTTON}

Validar Mensaje De Error De Login
    [Documentation]    Verifica que el mensaje de error sea visible y tenga el texto esperado.
    [Arguments]    ${mensaje}
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be    ${LOGIN_ERROR}    ${mensaje}
    Page Should Contain    ${mensaje}

Validar Que El Usuario No Inicio Sesion
    [Documentation]    Verifica que el usuario sigue en /login y no aparece "Logged in as".
    Title Should Be    ${TITLE_LOGIN}
    Location Should Contain    /login
    Page Should Not Contain    Logged in as
    Page Should Contain Element    ${LOGIN_BUTTON}
