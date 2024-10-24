--DB_customer--
CREATE ROLE DB_customer;
GRANT CONNECT ON DATABASE e_bookstore TO DB_customer;
GRANT USAGE ON SCHEMA app_e_bookstore TO DB_customer;
GRANT SELECT ON TABLE app_e_bookstore.book, app_e_bookstore.orders, app_e_bookstore.order_item TO DB_customer;
--DB_author--
CREATE ROLE DB_author;
GRANT CONNECT ON DATABASE e_bookstore TO DB_author;
GRANT USAGE ON SCHEMA app_e_bookstore TO DB_author;
GRANT SELECT ON TABLE app_e_bookstore.book, app_e_bookstore.order_item TO DB_author;
--DB_Publisher--
CREATE ROLE DB_Publisher;
GRANT CONNECT ON DATABASE e_bookstore TO DB_Publisher;
GRANT USAGE ON SCHEMA app_e_bookstore TO DB_Publisher;
GRANT SELECT ON TABLE app_e_bookstore.book, app_e_bookstore.author, app_e_bookstore.order_item TO DB_Publisher;
--DB_admin--
CREATE ROLE DB_admin;
GRANT CONNECT ON DATABASE e_bookstore TO DB_admin;
GRANT USAGE ON SCHEMA app_e_bookstore TO DB_admin;
GRANT SELECT, UPDATE ON ALL TABLES IN SCHEMA app_e_bookstore TO DB_admin; 
--DB_technical
CREATE ROLE DB_technical;
GRANT CONNECT ON DATABASE e_bookstore TO DB_technical;
GRANT ALL PRIVILEGES ON DATABASE e_bookstore TO DB_technical;
