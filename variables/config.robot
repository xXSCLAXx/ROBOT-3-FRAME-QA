*** Settings ***
Documentation     Variables globales reutilizables: URLs, navegador, tiempos y rutas.

*** Variables ***
${BASE_URL}             https://automationexercise.com
${LOGIN_URL}            ${BASE_URL}/login
${PRODUCTS_URL}         ${BASE_URL}/products
${BROWSER}              chrome
${TIMEOUT}              15s
${SCREENSHOT_DIR}       ${EXECDIR}${/}screenshots

# Titulos esperados de las paginas
${TITLE_HOME}           Automation Exercise
${TITLE_LOGIN}          Automation Exercise - Signup / Login
${TITLE_PRODUCTS}       Automation Exercise - All Products
