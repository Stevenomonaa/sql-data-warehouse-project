/*
================================================================
CREATE DATABASE & SCHEMAS (PostgreSQL)
================================================================

Script Purpose:
    This script resets a PostgreSQL database named 'datawarehouse'
    and creates three schemas: bronze, silver, and gold.

IMPORTANT EXECUTION NOTES:
    • This script CANNOT be run as a single script in pgAdmin or other GUI tools.
    • PostgreSQL does not allow switching databases within a SQL script.
    • The script must be executed in TWO SEPARATE STEPS using TWO CONNECTIONS.

WARNING:
    Running the DATABASE RESET step will permanently drop the entire
    'datawarehouse' database if it exists.
    ALL DATA IN THE DATABASE WILL BE LOST.
    Ensure proper backups exist before running this step.

EXECUTION REQUIREMENTS:
    Step 1 MUST be run while connected to the 'postgres' database
    Step 2 MUST be run while connected to the 'datawarehouse' database
*/

------ STEP 1
-- Terminate active connections to the 'datawarehouse' database
-- Avoid terminating the current connection
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse' AND pid <> pg_backend_pid(); 

-- Drop the database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Recreate the database
CREATE DATABASE datawarehouse;

------- STEP 2
-- Create Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
