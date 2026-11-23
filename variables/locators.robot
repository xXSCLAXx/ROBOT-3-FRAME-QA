*** Settings ***
Documentation     Localizadores de elementos de automationexercise.com.

*** Variables ***
# Login
${LOGIN_EMAIL_INPUT}        css:input[data-qa="login-email"]
${LOGIN_PASSWORD_INPUT}     css:input[data-qa="login-password"]
${LOGIN_BUTTON}             css:button[data-qa="login-button"]
${LOGIN_FORM}               css:div.login-form
${LOGIN_ERROR}              xpath://form[@action="/login"]//p[contains(.,"incorrect")]

# Productos
${SEARCH_INPUT}             id:search_product
${SEARCH_BUTTON}            id:submit_search
${PRODUCTS_TITLE}           css:div.features_items h2.title
${PRODUCT_ITEMS}            css:div.features_items div.productinfo
${PRODUCT_NAMES}            css:div.features_items div.productinfo p

# Suscripcion (footer)
${FOOTER}                   id:footer
${SUBSCRIBE_EMAIL_INPUT}    id:susbscribe_email
${SUBSCRIBE_BUTTON}         id:subscribe
${SUBSCRIBE_SUCCESS}        id:success-subscribe
