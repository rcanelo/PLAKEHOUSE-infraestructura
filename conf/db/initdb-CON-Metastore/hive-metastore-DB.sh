#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE USER hive WITH PASSWORD 'password' ;
    CREATE DATABASE metastore_db OWNER hive;
    -- GRANT ALL PRIVILEGES ON DATABASE "metastore_db" TO hive;
    -- GRANT ALL ON ALL TABLES IN SCHEMA public TO hive;
    \c metastore_db hive;
EOSQL
