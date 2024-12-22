#!/bin/bash

psql --username "$POSTGRES_USER" --dbname "btodo" <<-EOSQL
    CREATE ROLE service_roles;
    GRANT CONNECT ON DATABASE btodo TO service_roles;
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO service_roles;
    GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO service_roles;
    GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_roles;

    CREATE USER $DB_ACCOUNT_USERNAME WITH PASSWORD '$DB_ACCOUNT_PASSWORD';
    GRANT service_roles TO $DB_ACCOUNT_USERNAME;
EOSQL
