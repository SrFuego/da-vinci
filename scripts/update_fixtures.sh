#!/bin/bash

# Script to update fixtures

# - [x] Actualiza los fixtures
# - [x] Nueva DB:
#     - [x] Crea un backup de la DB actual
#     - [x] Genera una nueva DB cuando levanta el docker

declare -a entidad_fixture_list

entidad_fixture_list[0]='Universidad:universidad'
entidad_fixture_list[1]='Area:area'
entidad_fixture_list[2]='ProcesoDeAdmision:proceso_de_admision'
entidad_fixture_list[3]='Carrera:carrera'
entidad_fixture_list[4]='ExamenDeAdmision:examen_de_admision'
entidad_fixture_list[5]='Curso:curso'
entidad_fixture_list[6]='Tema:tema'
entidad_fixture_list[7]='PreguntasPorCurso:preguntas_por_curso'
entidad_fixture_list[8]='Lectura:lectura'
entidad_fixture_list[9]='Pregunta:pregunta'
entidad_fixture_list[10]='Alternativa:alternativa'
entidad_fixture_list[11]='Solucion:solucion'
# entidad_fixture_list[11]='auth.User:usuarios_del_sistema'

for entidad_fixture in ${!entidad_fixture_list[@]}; do
    entidad_fixture=${entidad_fixture_list[$entidad_fixture]}
    # echo "Entidad y nombre del fixture: ${entidad_fixture}"
    IFS=":" read -r -a arr <<<"${entidad_fixture}"
    entidad="${arr[0]}"
    fixture_filename="${arr[1]}"
    echo "entidad: ${entidad}"
    echo "fixture_filename: ${fixture_filename}"
    echo "command: python api/manage.py dumpdata core.${entidad} --format json --indent 4 -o api/apps/core/fixtures/${fixture_filename}.json"
    python api/manage.py dumpdata core.${entidad} --format json --indent 4 -o api/apps/core/fixtures/${fixture_filename}.json
done

mv api/db.sqlite3 api/db_backup.sqlite3
