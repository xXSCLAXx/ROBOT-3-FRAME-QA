*** Settings ***
Documentation     Ejercicio 3 - Busqueda de Productos.
...               Ingresa a la seccion de productos, realiza una busqueda
...               y valida que los resultados sean correctos.
Resource          ../keywords/common.robot
Resource          ../keywords/products_keywords.robot
Resource          ../variables/test_data.robot
Test Setup        Abrir Navegador En    ${BASE_URL}
Test Teardown     Cerrar Navegador
Test Tags         productos    busqueda

*** Test Cases ***
Buscar Producto Muestra Resultados Correctos
    [Documentation]    Valida titulo de la pagina, encabezado "Searched Products",
    ...                que existan resultados y que todos coincidan con el termino.
    Abrir Seccion De Productos
    Tomar Evidencia    ej03_01_productos
    Buscar Producto    ${SEARCH_TERM}
    Validar Titulo De Resultados    ${SEARCH_RESULTS_TITLE}
    Validar Que Hay Resultados
    Validar Que Todos Los Resultados Coinciden Con    ${SEARCH_TERM}
    Mostrar Resultados En Pantalla
    Tomar Evidencia    ej03_02_resultados_busqueda
