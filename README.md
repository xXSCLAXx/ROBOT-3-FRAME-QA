# Práctica 3 - Robot Framework

Pruebas automatizadas sobre https://automationexercise.com con Robot Framework y SeleniumLibrary.

## Ejercicios seleccionados

| # | Ejercicio | Archivo |
|---|-----------|---------|
| 2 | Login Incorrecto | `tests/ej02_login_incorrecto.robot` |
| 3 | Búsqueda de Productos | `tests/ej03_busqueda_productos.robot` |
| 6 | Suscripción | `tests/ej06_suscripcion.robot` |

## Estructura

```
robot_project/
├── tests/          # Casos de prueba (.robot), uno por ejercicio
├── keywords/       # Keywords personalizadas (common + una por página)
├── variables/      # config (URLs, navegador), locators, test_data
├── screenshots/    # Capturas generadas en cada ejecución
├── reports/        # report.html, log.html, output.xml
├── docs/           # Documento PDF de entrega y evidencias
├── run_tests.bat   # Ejecuta toda la suite
└── requirements.txt
```

## Requisitos

- Python 3.10+
- Google Chrome (Selenium Manager descarga el driver automáticamente)

```
pip install -r requirements.txt
```

## Ejecución

```
run_tests.bat
```

o bien:

```
python -m robot --outputdir reports --name "Practica 3 - Robot Framework" tests
```

Ejecutar un solo ejercicio por tag: `python -m robot --outputdir reports --include login tests`

> Si aparece `LookupError: unknown encoding: utf-8:surrogateescape`, define
> `PYTHONIOENCODING=utf-8` antes de ejecutar (`run_tests.bat` ya lo hace).
