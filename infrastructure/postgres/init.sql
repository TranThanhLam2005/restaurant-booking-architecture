CREATE DATABASE identity_db;
CREATE DATABASE branch_db;
CREATE DATABASE order_db;

CREATE USER identity_user WITH PASSWORD 'identity_pass';
CREATE USER branch_user WITH PASSWORD 'branch_pass';
CREATE USER order_user WITH PASSWORD 'order_pass';

GRANT ALL PRIVILEGES ON DATABASE identity_db TO identity_user;
GRANT ALL PRIVILEGES ON DATABASE branch_db TO branch_user;
GRANT ALL PRIVILEGES ON DATABASE order_db TO order_user;
