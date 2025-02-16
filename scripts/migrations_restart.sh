rm api-django/apps/**/migrations/00**
rm api-django/db.sqlite3
python api-django/manage.py makemigrations
python api-django/manage.py migrate