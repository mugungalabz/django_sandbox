#!/bin/bash

# Apply migrations
python manage.py migrate

python manage.py loaddata superuser_fixture.json
# Collect static files (if needed)
# python manage.py collectstatic --noinput

# Start the Django development server
python manage.py runserver 0.0.0.0:8000