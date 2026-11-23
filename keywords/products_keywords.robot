*** Settings ***
Documentation     Keywords de la seccion de Productos.
Library           SeleniumLibrary
Resource          common.robot
Resource          ../variables/config.robot
Resource          ../variables/locators.robot

*** Keywords ***
Abrir Seccion De Productos
    [Documentation]    Navega a /products y verifica la pagina "ALL PRODUCTS".
    Ir A    ${PRODUCTS_URL}
    Title Should Be    ${TITLE_PRODUCTS}
    Element Should Be Visible    ${SEARCH_INPUT}
    Element Should Contain    ${PRODUCTS_TITLE}    All Products    ignore_case=True

Buscar Producto
    [Documentation]    Escribe el termino en el buscador y pulsa el boton de busqueda.
    [Arguments]    ${termino}
    Escribir Texto    ${SEARCH_INPUT}    ${termino}
    Hacer Click    ${SEARCH_BUTTON}
    Wait Until Location Contains    search=${termino}

Validar Titulo De Resultados
    [Documentation]    Verifica el encabezado de la pagina de resultados.
    [Arguments]    ${titulo}
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}
    Element Should Contain    ${PRODUCTS_TITLE}    ${titulo}    ignore_case=True

Validar Que Hay Resultados
    [Documentation]    Verifica que se muestre al menos un producto y devuelve la cantidad.
    Page Should Contain Element    ${PRODUCT_ITEMS}
    ${cantidad}=    Get Element Count    ${PRODUCT_ITEMS}
    Should Be True    ${cantidad} > 0    msg=No se encontraron productos
    Log    Productos encontrados: ${cantidad}
    RETURN    ${cantidad}

Mostrar Resultados En Pantalla
    [Documentation]    Desplaza la vista hasta el encabezado de resultados para la captura.
    Execute Javascript    document.querySelector('div.features_items').scrollIntoView({block:'start'});

Validar Que Todos Los Resultados Coinciden Con
    [Documentation]    Cada nombre de producto devuelto debe contener el termino buscado.
    ...                Se normaliza quitando guiones y espacios ("T-Shirt" == "Tshirt").
    [Arguments]    ${termino}
    ${elementos}=    Get WebElements    ${PRODUCT_NAMES}
    ${buscado}=    Evaluate    re.sub(r'[^a-z0-9]', '', $termino.lower())    modules=re
    FOR    ${el}    IN    @{elementos}
        ${nombre}=    Get Element Attribute    ${el}    textContent
        ${normal}=    Evaluate    re.sub(r'[^a-z0-9]', '', $nombre.lower())    modules=re
        Should Contain    ${normal}    ${buscado}
        ...    msg=El producto '${nombre}' no coincide con '${termino}'
        Log    OK: ${nombre}
    END
