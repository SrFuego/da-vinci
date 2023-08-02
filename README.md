# Da Vinci

## Descripción del proyecto

Es una App que le permite a los usuarios$^{(1)}$ practicar sus conocimientos generales resolviendo preguntas que vinieron en exámenes de admisión de la Universidad Nacional Mayor de San Marcos:
- Muestra la pregunta con sus alternativas
- Selecciona una alternativa
- Envía la respuesta
- El sistema evalúa y muestra:
  - Puntaje
  - Resolución
  - Teoría relacionada

$^{1}$ Especialmente útil para estudiantes pre-universitarios o escolares que busquen afinar sus conocimientos

Backoffice:
Para mostrar las preguntas de admisión, es necesario ingresarlas al sistema


## Levantar el proyecto

Debe tener instalado Docker:

https://docs.docker.com/engine/install/

Levantar el entorno de testing:

`docker compose -f src/dockerfiles/docker-compose.yml up --build`


## Levantar reporte de tests

Generar reporte de Allure (dentro de `features/`):

`behave -f allure_behave.formatter:AllureFormatter -o my_allure .`

Allure serve report:

`allure serve my_allure/`


## Conectarse al container de backend

`docker exec -it backend bash`


## Generar dependencias actualizadas

En el container:

`bash src/api/requirements/update_requirements.sh`


## Generar fixtures

En el container:

`bash src/api/apps/core/fixtures/update_fixtures.sh`

Para sólo un modelo:

`python src/api/manage.py dumpdata core.{Model} --format json --indent 4 -o src/api/apps/core/fixtures/{filename}.json`


## Correr tests de características

`python src/api/manage.py behave`


## Correr coverage de codigo

`coverage run src/api/manage.py behave`

`coverage html`


## Changelog


> Current version: v0.0.1

![Diagrama BPMN](docs/context/out/bpmn.png)

![Diagrama de Requests](docs/connections/out/Da%20Vinci.png)

> v0.0.2:

- Descripcion del proyecto:
  - [ ] FIX:
    - La descripción explica qué tiene el sistema pero no te describe el proyecto con una historia
  - [ ] Partir la descripcion del proyecto (?):
    - Experiencia ideal de usuario
    - Seccionamiento del sistema:
      - Explicacion de las partes
