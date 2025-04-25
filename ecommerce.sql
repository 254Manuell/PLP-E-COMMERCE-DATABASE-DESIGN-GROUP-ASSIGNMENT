-- This SQL script creates the database schema for an e-commerce platform.

-- CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- 1. brand table
CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    logo_url TEXT
);

-- 2. product_category table
CREATE TABLE product_category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 3. product table
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2),
    brand_id INTEGER REFERENCES brand(brand_id),
    category_id INTEGER REFERENCES product_category(category_id)
);

-- 4. product_image table
CREATE TABLE product_image (
    image_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(product_id) ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    alt_text VARCHAR(255)
);

-- 5. product_item table
CREATE TABLE product_item (
    item_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(product_id) ON DELETE CASCADE,
    sku VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2),
    stock_quantity INTEGER
);

-- 6. color table
CREATE TABLE color (
    color_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    hex_code CHAR(7)
);

-- 7. size_category table
CREATE TABLE size_category (
    size_category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 8. size_option table
CREATE TABLE size_option (
    size_id SERIAL PRIMARY KEY,
    size_category_id INTEGER REFERENCES size_category(size_category_id),
    label VARCHAR(50),
    value VARCHAR(20)
);

-- 9. product_variation table
CREATE TABLE product_variation (
    variation_id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES product_item(item_id) ON DELETE CASCADE,
    color_id INTEGER REFERENCES color(color_id),
    size_id INTEGER REFERENCES size_option(size_id)
);

-- 10. attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- 11. attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

-- 12. product_attribute table
CREATE TABLE product_attribute (
    attribute_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(product_id) ON DELETE CASCADE,
    attribute_category_id INTEGER REFERENCES attribute_category(attribute_category_id),
    attribute_type_id INTEGER REFERENCES attribute_type(attribute_type_id),
    name VARCHAR(100),
    value TEXT
);
