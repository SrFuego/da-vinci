python src/api/manage.py migrate

python src/api/manage.py loaddata src/api/apps/core/fixtures/*.json

python src/api/manage.py behave

allure generate --clean

nohup allure open -p 8050 &

python src/api/manage.py runserver 0.0.0.0:8000
