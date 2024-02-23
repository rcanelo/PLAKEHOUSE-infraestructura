#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE USER conduktor WITH PASSWORD 'some_password' ;
    CREATE DATABASE conduktorplatform OWNER conduktor;
    -- GRANT ALL PRIVILEGES ON DATABASE "conduktorplatform" TO conduktor;
    -- GRANT ALL ON ALL TABLES IN SCHEMA public TO conduktor;
    
    \c conduktorplatform;
EOSQL
