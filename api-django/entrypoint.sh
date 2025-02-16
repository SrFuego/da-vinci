#!/bin/bash

python manage.py migrate

python manage.py loaddata apps/core/fixtures/*.json

# python api/manage.py behave

bash scripts/clean_reports.sh

coverage run manage.py behave

coverage html

allure generate --clean

nohup allure open -p 8050 &

python manage.py runserver 0.0.0.0:8000
