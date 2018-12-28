#!/bin/bash
set -e

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED

    echo "-- First container startup --"

    echo "-> Load migrations"
    python3 manage.py migrate
    echo "-> Load initial user (admin/123123)"
    python3 manage.py loaddata initial_user --traceback
    echo "-> Load initial project_templates (scrum/kanban)"
    python3 manage.py loaddata initial_project_templates --traceback
    echo "-> Generate sample data"
    python3 manage.py sample_data --traceback
    echo "-> Rebuilding timeline"
    python3 manage.py rebuild_timeline --purge
fi

python3 manage.py runserver 0.0.0.0:8000
