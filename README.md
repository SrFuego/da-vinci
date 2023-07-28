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

`bash requirements/update_requirements.sh`


## Changelog


> Current version: v0.0.1

![Diagrama BPMN](docs/context/out/bpmn.png)

![Diagrama de Requests](docs/connections/out/Da%20Vinci.png)

> v0.0.2:

- Descripcion del proyecto:
  - [ ] FIX:
    - La descripcion explica que tiene el sistema pero no te describe el proyecto con una historia
  - [ ] Agregar **Backoffice**:
    - Admin para el staff desde donde agregar:
      - Preguntas
      - Examenes
      - Solucionarios
  - [ ] Partir la descripcion del proyecto (?):
    - Experiencia ideal de usuario
    - Seccionamiento del sistema:
      - Explicacion de las partes
