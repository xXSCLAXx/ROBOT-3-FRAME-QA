*** Settings ***
Documentation     Datos de prueba usados por los escenarios.

*** Variables ***
# Ejercicio 2 - Login incorrecto
${INVALID_EMAIL}            usuario.invalido.qa@example.com
${INVALID_PASSWORD}         ClaveIncorrecta123
${LOGIN_ERROR_MSG}          Your email or password is incorrect!

# Ejercicio 3 - Busqueda de productos
${SEARCH_TERM}              Tshirt
${SEARCH_RESULTS_TITLE}     Searched Products

# Ejercicio 6 - Suscripcion
${SUBSCRIPTION_TITLE}       SUBSCRIPTION
${SUBSCRIPTION_OK_MSG}      You have been successfully subscribed!
