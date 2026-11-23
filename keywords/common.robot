*** Settings ***
Documentation     Keywords generales reutilizables por todos los escenarios.
Library           SeleniumLibrary
Library           String
Resource          ../variables/config.robot

*** Keywords ***
Abrir Navegador En
    [Documentation]    Abre el navegador en la URL indicada y configura tiempos y capturas.
    [Arguments]    ${url}=${BASE_URL}
    Open Browser    ${url}    ${BROWSER}
    ...    options=add_argument("--disable-notifications");add_argument("--window-size=1366,900")
    Set Selenium Timeout    ${TIMEOUT}
    Set Screenshot Directory    ${SCREENSHOT_DIR}
    Aceptar Consentimiento Si Aparece

Cerrar Navegador
    [Documentation]    Toma captura si la prueba fallo y cierra el navegador.
    Run Keyword If Test Failed    Tomar Evidencia    FALLO_${TEST NAME}
    Close All Browsers

Aceptar Consentimiento Si Aparece
    [Documentation]    Cierra el popup de cookies/consentimiento si el sitio lo muestra.
    ${cantidad}=    Get Element Count    css:button.fc-cta-consent
    IF    ${cantidad} > 0    Click Element    css:button.fc-cta-consent

Ir A
    [Documentation]    Navega a una URL y espera a que cargue la pagina.
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Page Contains Element    css:body

Escribir Texto
    [Documentation]    Espera a que el campo sea visible y escribe el texto.
    [Arguments]    ${locator}    ${texto}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${texto}

Hacer Click
    [Documentation]    Hace scroll al elemento y lo pulsa con JavaScript
    ...                (evita que la publicidad del sitio intercepte el click).
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    ${elem}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].scrollIntoView({block:'center'}); arguments[0].click();
    ...    ARGUMENTS    ${elem}

Tomar Evidencia
    [Documentation]    Guarda una captura en screenshots/ con un nombre descriptivo.
    [Arguments]    ${nombre}
    ${limpio}=    Replace String Using Regexp    ${nombre}    [^A-Za-z0-9_-]    _
    Capture Page Screenshot    ${limpio}.png

Generar Correo Unico
    [Documentation]    Devuelve un correo aleatorio para no repetir datos entre ejecuciones.
    ${sufijo}=    Generate Random String    8    [LOWER][NUMBERS]
    RETURN    qa.robot.${sufijo}@example.com
