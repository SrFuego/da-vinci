python api/manage.py migrate

python api/manage.py loaddata api/apps/core/fixtures/*.json

# python api/manage.py behave

coverage run api/manage.py behave

coverage html

allure generate --clean

nohup allure open -p 8050 &

python api/manage.py runserver 0.0.0.0:8000
