#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE USER hive WITH PASSWORD 'hive' ;
    CREATE DATABASE metastore OWNER hive;
    -- GRANT ALL PRIVILEGES ON DATABASE "metastore" TO hive;
    -- GRANT ALL ON ALL TABLES IN SCHEMA public TO hive;
    \c metastore hive;
EOSQL
