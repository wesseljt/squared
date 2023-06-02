-- WAREHOUSE
USE ROLE SYSADMIN;

CREATE OR REPLACE WAREHOUSE <INSERT_NAME>
WAREHOUSE_SIZE=XSMALL
INITIALLY_SUSPENDED=TRUE
AUTO_SUSPEND=60
MAX_CLUSTER_COUNT=1;

-- ROLE/USER
USE ROLE USERADMIN;

CREATE ROLE <INSERT_NAME> ;
GRANT ROLE <INSERT_NAME> TO ROLE "SYSADMIN";

CREATE USER <INSERT_NAME>
LOGIN_NAME = <INSERT_NAME>
DISPLAY_NAME = <INSERT_NAME>
FIRST_NAME = <INSERT_NAME>
LAST_NAME = <INSERT_NAME>
DEFAULT_ROLE = <INSERT_NAME>
DEFAULT_WAREHOUSE = <INSERT_NAME>
MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE <INSERT_NAME> TO USER <INSERT_NAME>;

ALTER USER <INSERT_NAME> RESET PASSWORD;

-- DATABASES
USE ROLE SYSADMIN;

CREATE DATABASE <INSERT_NAME>_RAW;
GRANT OWNERSHIP ON DATABASE <INSERT_NAME>_RAW TO ROLE <INSERT_NAME>;
GRANT ALL PRIVILEGES ON DATABASE <INSERT_NAME>_RAW TO ROLE <INSERT_NAME>;
GRANT MONITOR, OPERATE, USAGE ON WAREHOUSE <INSERT_NAME> TO ROLE <INSERT_NAME>;

GRANT OWNERSHIP ON ALL SCHEMAS IN DATABASE <INSERT_NAME>_RAW TO ROLE <INSERT_NAME>;

-- FILE FORMAT
USE ROLE <INSERT_NAME>;

CREATE FILE FORMAT <INSERT_NAME>_RAW.PUBLIC.CSV
TYPE = 'CSV' ESCAPE='\\' FIELD_OPTIONALLY_ENCLOSED_BY='"';
