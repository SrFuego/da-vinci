#!/bin/bash

python manage.py migrate

python manage.py loaddata apps/core/fixtures/*.json

# python api/manage.py behave

bash scripts/clean_reports.sh

coverage run --source=apps -m behave

coverage report 

coverage html

behave -f allure_behave.formatter:AllureFormatter -o allure-results features/

allure generate allure-results --clean -o allure-report

# nohup allure open -p 8050 &

nohup python3 -m http.server 8500 -d htmlcov/ &

nohup python3 -m http.server 8050 -d allure-report/ &

python manage.py runserver 0.0.0.0:8000