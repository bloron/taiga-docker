#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE taiga LOGIN PASSWORD 'changeme';
    CREATE DATABASE taiga OWNER="taiga" ENCODING='utf-8';
EOSQL