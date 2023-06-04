#!/bin/bash

# Apply migrations
python manage.py migrate

python manage.py loaddata sandbox/fixtures/superuser_fixture.json

# Collect static files (if needed)
python manage.py collectstatic --noinput

# Start the Django development server
python3 /usr/local/lib/python3.11/site-packages/gunicorn/app/wsgiapp.py sandbox.wsgi:application  --bind :8000 --reload --workers 2