DROP DATABASE IF EXISTS northwind_db;
CREATE DATABASE northwind_db;
USE northwind_db;

CREATE TABLE categories (
    category_id smallint NOT NULL PRIMARY KEY,
    category_name CHAR(15) NOT NULL,
    description text,
    picture blob
);

CREATE TABLE customer_demographics (
    customer_type_id CHAR(1) NOT NULL PRIMARY KEY,
    customer_desc TEXT
);

CREATE TABLE customers (
    customer_id CHAR(10) NOT NULL PRIMARY KEY,
    company_name VARCHAR(40) NOT NULL,
    contact_name VARCHAR(30),
    contact_title VARCHAR(30),
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postal_code VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(24),
    fax VARCHAR(24)
);

CREATE TABLE customer_customer_demo (
    customer_id CHAR(10) NOT NULL,
    customer_type_id CHAR(1) NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    CONSTRAINT fk_customer_demo_customer_type
        FOREIGN KEY (customer_type_id) REFERENCES customer_demographics(customer_type_id),
    CONSTRAINT fk_customer_demo_customers
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
    employee_id smallint NOT NULL PRIMARY KEY,
    last_name CHAR(20) NOT NULL,
    first_name CHAR(10) NOT NULL,
    title CHAR(30),
    title_of_courtesy CHAR(25),
    birth_date date,
    hire_date date,
    address CHAR(60),
    city CHAR(15),
    region CHAR(15),
    postal_code CHAR(10),
    country CHAR(15),
    home_phone CHAR(24),
    extension CHAR(4),
    photo blob,
    notes text,
    reports_to smallint,
    photo_path CHAR(255),
	FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);

CREATE TABLE suppliers (
    supplier_id smallint NOT NULL PRIMARY KEY,
    company_name CHAR(40) NOT NULL,
    contact_name CHAR(30),
    contact_title CHAR(30),
    address CHAR(60),
    city CHAR(15),
    region CHAR(15),
    postal_code CHAR(10),
    country CHAR(15),
    phone CHAR(24),
    fax CHAR(24),
    homepage text
);

CREATE TABLE products (
    product_id smallint NOT NULL PRIMARY KEY,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(category_id),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE region (
    region_id smallint NOT NULL PRIMARY KEY,
    region_description CHAR(20) NOT NULL
);

CREATE TABLE shippers (
    shipper_id smallint NOT NULL PRIMARY KEY,
    company_name CHAR(40) NOT NULL,
    phone CHAR(24)
);

CREATE TABLE orders (
    order_id smallint NOT NULL PRIMARY KEY,
    customer_id CHAR(10),
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name CHAR(40),
    ship_address CHAR(60),
    ship_city CHAR(15),
    ship_region CHAR(15),
    ship_postal_code CHAR(10),
    ship_country CHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (ship_via) REFERENCES shippers(shipper_id)
);

CREATE TABLE territories (
    territory_id CHAR(20) NOT NULL PRIMARY KEY,
    territory_description CHAR(20) NOT NULL,
    region_id smallint NOT NULL,
	FOREIGN KEY (region_id) REFERENCES region(region_id)
);

CREATE TABLE employee_territories (
    employee_id smallint NOT NULL,
    territory_id CHAR(20) NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories(territory_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE us_states (
    state_id smallint NOT NULL PRIMARY KEY,
    state_name CHAR(100),
    state_abbr CHAR(2),
    state_region CHAR(50)
);