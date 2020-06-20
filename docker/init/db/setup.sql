-- must change your name and databasename, passward.
CREATE ROLE bigquery_rails LOGIN PASSWORD 'bigquery_rails';
CREATE DATABASE bigquery_rails;
GRANT ALL PRIVILEGES ON DATABASE bigquery_rails TO bigquery_rails;
ALTER ROLE bigquery_rails WITH CREATEROLE CREATEDB;
