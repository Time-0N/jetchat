-- Create the modul_223 user
CREATE USER modul_223 WITH PASSWORD 'postgres';

-- Grant privileges to the modul_223 user on the default database
GRANT ALL PRIVILEGES ON DATABASE modul_223_production TO modul_223;

-- Create additional databases required by Rails multi-database configuration
CREATE DATABASE modul_223_production_cache OWNER modul_223;
CREATE DATABASE modul_223_production_queue OWNER modul_223;
CREATE DATABASE modul_223_production_cable OWNER modul_223;

-- Grant all privileges to the modul_223 user on all databases
GRANT ALL PRIVILEGES ON DATABASE modul_223_production_cache TO modul_223;
GRANT ALL PRIVILEGES ON DATABASE modul_223_production_queue TO modul_223;
GRANT ALL PRIVILEGES ON DATABASE modul_223_production_cable TO modul_223;