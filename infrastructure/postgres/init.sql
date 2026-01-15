CREATE DATABASE identity_db;
CREATE DATABASE branch_db;
CREATE DATABASE order_db;
CREATE DATABASE menu_db;
CREATE DATABASE user_db;

CREATE USER identity_user WITH PASSWORD 'identity_pass';
CREATE USER branch_user WITH PASSWORD 'branch_pass';
CREATE USER order_user WITH PASSWORD 'order_pass';
CREATE USER menu_user WITH PASSWORD 'menu_pass';
CREATE USER user_user WITH PASSWORD 'user_pass';


GRANT ALL PRIVILEGES ON DATABASE identity_db TO identity_user;
GRANT ALL PRIVILEGES ON DATABASE branch_db TO branch_user;
GRANT ALL PRIVILEGES ON DATABASE order_db TO order_user;
GRANT ALL PRIVILEGES ON DATABASE menu_db TO menu_user;
GRANT ALL PRIVILEGES ON DATABASE user_db TO user_user;

-- Grant schema permissions (required in PostgreSQL 15+)
\c identity_db;
GRANT ALL ON SCHEMA public TO identity_user;
GRANT ALL ON ALL TABLES IN SCHEMA public TO identity_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO identity_user;

\c branch_db;
GRANT ALL ON SCHEMA public TO branch_user;
GRANT ALL ON ALL TABLES IN SCHEMA public TO branch_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO branch_user;

\c order_db;
GRANT ALL ON SCHEMA public TO order_user;
GRANT ALL ON ALL TABLES IN SCHEMA public TO order_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO order_user;

\c menu_db;
GRANT ALL ON SCHEMA public TO menu_user;
GRANT ALL ON ALL TABLES IN SCHEMA public TO menu_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO menu_user;

\c user_db;
GRANT ALL ON SCHEMA public TO user_user;
GRANT ALL ON ALL TABLES IN SCHEMA public TO user_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO user_user;