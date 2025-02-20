#!/bin/bash


cd api-django/

python manage.py migrate

python manage.py loaddata apps/core/fixtures/*.json

cd ..

rm -rf allure-*
rm -rf htmlcov
rm .coverage

python api-django/manage.py behave --tags=api_happy_path


# Generate coverage report
coverage report
coverage html

# Generate allure report
allure generate allure-results \
    --clean \
    -o allure-report \
    --clean

# Start servers for reports
nohup python3 -m http.server 8500 -d htmlcov/ &
nohup python3 -m http.server 8050 -d allure-report/ &

# Start Django server
python api-django/manage.py runserver 0.0.0.0:8000

