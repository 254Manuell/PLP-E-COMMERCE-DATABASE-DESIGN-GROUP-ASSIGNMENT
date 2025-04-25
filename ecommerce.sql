-- This SQL script creates the database schema for an e-commerce platform.

-- CREATE DATABASE ecommerce_db;
CREATE DATABASE ecommerce_db;

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
    product_id INTEGER REFERENCES product(product_id) 
    ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    alt_text VARCHAR(255)
);

-- 5. product_item table
CREATE TABLE product_item (
    item_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(product_id) 
    ON DELETE CASCADE,
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
    item_id INTEGER REFERENCES product_item(item_id) 
    ON DELETE CASCADE,
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

show tables;

-- Insert into brand
INSERT INTO brand (name, description, logo_url) VALUES
('Nike', 'Just Do It - Athletic apparel and footwear', 'https://example.com/logos/nike.png'),
('Adidas', 'Impossible is Nothing - Sportswear manufacturer', 'https://example.com/logos/adidas.png'),
('Apple', 'Think Different - Technology products', 'https://example.com/logos/apple.png'),
('Samsung', 'Do What You Can''t - Electronics manufacturer', 'https://example.com/logos/samsung.png'),
('Levi''s', 'Quality jeans and apparel since 1853', 'https://example.com/logos/levis.png'),
('Sony', 'Make.Believe - Electronics and entertainment', 'https://example.com/logos/sony.png'),
('Dell', 'Innovation that stops at nothing', 'https://example.com/logos/dell.png'),
('Puma', 'Forever Faster - Sports company', 'https://example.com/logos/puma.png'),
('Under Armour', 'Protect This House - Performance apparel', 'https://example.com/logos/underarmour.png'),
('HP', 'Keep Reinventing - Technology company', 'https://example.com/logos/hp.png');

-- Insert into product_category
INSERT INTO product_category (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel and fashion items'),
('Footwear', 'Shoes and boots'),
('Accessories', 'Watches, bags, etc.'),
('Computers', 'Laptops, desktops, tablets'),
('Sports Equipment', 'Gear for various sports'),
('Home Appliances', 'Household electronic devices'),
('Jewelry', 'Necklaces, rings, bracelets'),
('Books', 'Physical and digital books'),
('Toys', 'Children''s toys and games');

-- Insert into product
INSERT INTO product (name, description, base_price, brand_id, category_id) VALUES
('Air Max 90', 'Classic running shoes', 120.00, 1, 3),
('iPhone 15', 'Latest smartphone', 999.00, 3, 1),
('Galaxy S23', 'Android flagship phone', 799.99, 4, 1),
('501 Original Fit Jeans', 'Classic blue jeans', 59.50, 5, 2),
('PlayStation 5', 'Gaming console', 499.99, 6, 5),
('XPS 13', 'Premium laptop', 1299.00, 7, 5),
('RS-Fast Sneakers', 'Running shoes', 89.99, 8, 3),
('Curry 10', 'Basketball shoes', 160.00, 9, 3),
('Spectre x360', 'Convertible laptop', 1199.00, 10, 5),
('Tech Fleece Joggers', 'Comfortable sweatpants', 75.00, 1, 2);

-- Insert into product_image
INSERT INTO product_image (product_id, image_url, alt_text) VALUES
(1, 'https://example.com/images/airmax90_1.jpg', 'Nike Air Max 90 side view'),
(1, 'https://example.com/images/airmax90_2.jpg', 'Nike Air Max 90 top view'),
(2, 'https://example.com/images/iphone15_1.jpg', 'iPhone 15 front view'),
(2, 'https://example.com/images/iphone15_2.jpg', 'iPhone 15 back view'),
(3, 'https://example.com/images/galaxys23_1.jpg', 'Galaxy S23 display'),
(4, 'https://example.com/images/levis501_1.jpg', 'Levi''s 501 jeans front'),
(5, 'https://example.com/images/ps5_1.jpg', 'PlayStation 5 console'),
(6, 'https://example.com/images/xps13_1.jpg', 'Dell XPS 13 open'),
(7, 'https://example.com/images/rsfast_1.jpg', 'Puma RS-Fast shoes'),
(8, 'https://example.com/images/curry10_1.jpg', 'Under Armour Curry 10');

-- Insert into product_item
INSERT INTO product_item (product_id, sku, price, stock_quantity) VALUES
(1, 'NIKE-AM90-001', 120.00, 100),
(1, 'NIKE-AM90-002', 120.00, 75),
(2, 'APPLE-IP15-128', 999.00, 50),
(2, 'APPLE-IP15-256', 1099.00, 40),
(3, 'SAMSUNG-GS23-128', 799.99, 60),
(4, 'LEVIS-501-32', 59.50, 200),
(5, 'SONY-PS5-DISC', 499.99, 30),
(6, 'DELL-XPS13-I7', 1299.00, 25),
(7, 'PUMA-RSFAST-10', 89.99, 80),
(8, 'UA-CURRY10-11', 160.00, 45);

-- Insert into color
INSERT INTO color (name, hex_code) VALUES
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Black', '#000000'),
('White', '#FFFFFF'),
('Green', '#00FF00'),
('Yellow', '#FFFF00'),
('Purple', '#800080'),
('Gray', '#808080'),
('Pink', '#FFC0CB'),
('Orange', '#FFA500');

-- Insert into size_category
INSERT INTO size_category (name) VALUES
('Clothing'),
('Footwear'),
('Electronics'),
('Jewelry'),
('Universal'),
('Kids Clothing'),
('Mens Footwear'),
('Womens Footwear'),
('Computer'),
('Phone');

-- Insert into size_option
INSERT INTO size_option (size_category_id, label, value) VALUES
(1, 'Small', 'S'),
(1, 'Medium', 'M'),
(1, 'Large', 'L'),
(2, 'US 7', '7'),
(2, 'US 8', '8'),
(2, 'US 9', '9'),
(7, 'US 10', '10'),
(7, 'US 11', '11'),
(8, 'US 6', '6W'),
(8, 'US 7', '7W');

-- Insert into product_variation
INSERT INTO product_variation (item_id, color_id, size_id) VALUES
(1, 3, 4),
(1, 4, 4),
(2, 3, 5),
(2, 4, 5),
(3, 3, NULL),
(3, 4, NULL),
(4, 3, NULL),
(5, 3, NULL),
(6, 3, 1),
(6, 3, 2);

-- Insert into attribute_category
INSERT INTO attribute_category (name) VALUES
('Material'),
('Technology'),
('Fit'),
('Features'),
('Connectivity'),
('Battery'),
('Display'),
('Processor'),
('Storage'),
('Camera');

-- Insert into attribute_type
INSERT INTO attribute_type (name) VALUES
('Text'),
('Number'),
('Boolean'),
('Color'),
('Size'),
('Weight'),
('Dimension'),
('Date'),
('Rating'),
('Capacity');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES
(1, 1, 1, 'Upper Material', 'Leather and mesh'),
(1, 3, 1, 'Fit Type', 'Regular fit'),
(2, 2, 3, 'Face ID', 'true'),
(2, 4, 1, 'Chip', 'A16 Bionic'),
(3, 7, 1, 'Screen', 'Dynamic AMOLED 2X'),
(4, 1, 1, 'Denim Type', 'Rigid'),
(5, 2, 1, 'GPU', 'AMD RDNA 2'),
(6, 8, 1, 'CPU', 'Intel Core i7'),
(7, 1, 1, 'Sole Material', 'Rubber'),
(8, 3, 1, 'Ankle Support', 'High');
