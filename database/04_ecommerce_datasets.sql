-- Insert into country
INSERT INTO country (id, country_name)
VALUES 
(1, 'United States'),
(2, 'Canada'),
(3, 'Mexico'),
(4, 'United Kingdom');

-- Insert into address
INSERT INTO address (id, unit_number, street_number, address_line1, address_line2, city, region, postal_code, country_id)
VALUES 
(1, 'A', '123', 'Main St', NULL, 'Cityville', 'Central', '12345', 1),
(2, NULL, '456', 'Second St', '', 'Townsville', 'North', '67890', 2),
(3, 'C', '789', 'Boulevard Ave', 'Floor 2', 'Metropolis', 'West', '54321', 1),
(4, 'D', '1010', 'Circle Rd', 'Building 5', 'Suburbia', 'East', '98765', 2);

-- Insert into site_user
INSERT INTO site_user (id, email_address, phone_number, password, role)
VALUES 
(1, 'john.doe@example.com', '1234567890', 'hashed_password1', 'CUSTOMER'),
(2, 'jane.smith@example.com', '0987654321', 'hashed_password2', 'CUSTOMER'),
(3, 'will.johnson@example.com', '1122334455', 'hashed_password3', 'ADMIN'),
(4, 'linda.brown@example.com', '6677889900', 'hashed_password4', 'CUSTOMER');

-- Insert into site_seller
INSERT INTO site_seller (id, user_id, business_name)
VALUES 
(1, 2, 'Jane''s Store'),  -- Jane Smith est une vendeuse
(2, 3, 'Will''s Electronics');  -- Will Johnson est un vendeur (et un admin)

-- Insert into user_address
INSERT INTO user_address (user_id, address_id, is_default)
VALUES 
(1, 1, TRUE),
(2, 2, FALSE),
(3, 3, TRUE),
(4, 4, FALSE);

-- Insert into payment_type
INSERT INTO payment_type (id, value)
VALUES 
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer'),
(4, 'Bitcoin');

-- Insert into user_payment_method
INSERT INTO user_payment_method (id, user_id, payment_type_id, account_number, provider, expiry_date, is_default)
VALUES 
(1, 1, 1, '1234567890', 'Visa', '2025-06-30', TRUE),
(2, 2, 2, 'user2@paypal.com', 'PayPal', '2024-12-31', FALSE),
(3, 3, 3, '9876543210', 'MasterCard', '2024-11-15', TRUE),
(4, 4, 4, '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa', 'Bitcoin', '2026-01-01', TRUE);

-- Insert into shopping_cart
INSERT INTO shopping_cart (id, user_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert into product_category
INSERT INTO product_category (id, parent_category_id, category_name)
VALUES 
(1, NULL, 'Electronics'),
(2, 1, 'Mobile Phones'),
(3, 1, 'Laptops'),
(4, 2, 'Smartphones'),
(5, NULL, 'Clothing'),
(6, 5, 'Men''s Clothing'),
(7, 5, 'Women''s Clothing'),
(8, 5, 'Children''s Clothing'),
(9, 5, 'Accessories');

-- Insert into product
INSERT INTO product (id, category_id, name, description)
VALUES 
(1, 1, 'Laptop Pro', 'High-performance laptop'),
(2, 2, 'Smartphone X', 'Latest smartphone with best features'),
(3, 3, 'Laptop Air', 'Lightweight laptop'),
(4, 4, 'Smartphone Y', NULL),  -- description NULL
(5, 6, 'Men''s Jacket', 'Stylish and warm jacket for men'),
(6, 7, 'Women''s Dress', 'Elegant evening dress'),
(7, 9, 'Leather Belt', 'High-quality leather belt');

-- Insert into product_item
INSERT INTO product_item (id, product_id, SKU, qty_in_stock, price)
VALUES 
(1, 1, 'SKU001', 100, 999.99),
(2, 2, 'SKU002', 50, 799.99),
(3, 3, NULL, 200, 699.99),  -- SKU NULL
(4, 4, 'SKU004', 150, 399.99),
(5, 5, 'SKU005', 300, 99.99),
(6, 6, 'SKU006', 200, 149.99),
(7, 7, 'SKU007', 500, 19.99);

-- Insert into product_image
INSERT INTO product_image (id, product_id, product_item_id, image_url, is_primary)
VALUES 
(1, 1, 1, 'https://example.com/images/laptop_pro_main.jpg', TRUE),  -- Image principale pour Laptop Pro item
(2, 1, 1, 'https://example.com/images/laptop_pro_side.jpg', FALSE),  -- Image secondaire pour Laptop Pro item
(3, 2, 2, 'https://example.com/images/smartphone_x_main.jpg', TRUE),  -- Image principale pour Smartphone X item
(4, 2, 2, 'https://example.com/images/smartphone_x_back.jpg', FALSE),  -- Image secondaire pour Smartphone X item
(5, 3, 3, 'https://example.com/images/laptop_air_main.jpg', TRUE),  -- Image principale pour Laptop Air item
(6, 3, 3, 'https://example.com/images/laptop_air_back.jpg', FALSE),  -- Image secondaire pour Laptop Air item
(7, 4, 4, 'https://example.com/images/smartphone_y_main.jpg', TRUE),  -- Image principale pour Smartphone Y item
(8, 4, 4, 'https://example.com/images/smartphone_y_side.jpg', FALSE),  -- Image secondaire pour Smartphone Y item
(9, 5, 5, 'https://example.com/images/mens_jacket_main.jpg', TRUE),  -- Image principale pour Men's Jacket item
(10, 5, 5, 'https://example.com/images/mens_jacket_back.jpg', FALSE),  -- Image secondaire pour Men's Jacket item
(11, 6, 6, 'https://example.com/images/womens_dress_main.jpg', TRUE),  -- Image principale pour Women's Dress item
(12, 6, 6, 'https://example.com/images/womens_dress_back.jpg', FALSE),  -- Image secondaire pour Women's Dress item
(13, 7, 7, 'https://example.com/images/belt_main.jpg', TRUE),  -- Image principale pour Leather Belt item
(14, 7, 7, 'https://example.com/images/belt_side.jpg', FALSE);  -- Image secondaire pour Leather Belt item

-- Insert into variation
INSERT INTO variation (id, category_id, name)
VALUES
(1, 5, 'Size'),
(2, 5, 'Color');

-- Insert into variation_option
INSERT INTO variation_option (id, variation_id, value)
VALUES
(1, 1, 'M'),
(2, 1, 'L'),
(3, 2, 'Red'),
(4, 2, 'Blue');

-- Insert into product_configuration
INSERT INTO product_configuration (product_item_id, variation_option_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert into promotion
INSERT INTO promotion (id, name, description, discount_rate, start_date, end_date)
VALUES 
(1, 'Black Friday Sale', 'Huge discounts on electronics', 30.00, '2023-11-25', '2023-11-30'),
(2, 'Holiday Deals', 'Special holiday discounts', 25.00, '2023-12-15', '2023-12-31'),
(3, 'Summer Sale', NULL, 15.00, '2024-06-01', '2024-06-15');  -- description NULL

-- Insert into promotion_category
INSERT INTO promotion_category (category_id, promotion_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Insert into shopping_cart_item
INSERT INTO shopping_cart_item (id, cart_id, product_item_id, qty)
VALUES 
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1);

-- Insert into order_status
INSERT INTO order_status (id, status)
VALUES 
(1, 'Processing'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Cancelled');

-- Insert into shipping_method
INSERT INTO shipping_method (id, name, price)
VALUES 
(1, 'Standard Shipping', 5.99),
(2, 'Express Shipping', 12.99),
(3, 'Same Day Delivery', 20.00),
(4, 'In-store Pickup', 0.00);

-- Insert into shop_order
INSERT INTO shop_order (id, user_id, order_date, payment_method_id, shipping_address, shipping_method, order_total, order_status)
VALUES 
(1, 1, '2023-10-01', 1, 1, 1, 1099.98, 1),
(2, 2, '2023-10-02', 2, 2, 2, 829.99, 2),
(3, 3, NULL, 3, 3, 3, 750.00, 3),  -- order_date NULL
(4, 4, '2023-10-04', 4, 4, 4, 399.99, 1);

-- Insert into order_line
INSERT INTO order_line (id, product_item_id, order_id, qty, price)
VALUES 
(1, 1, 1, 2, 999.99),
(2, 2, 2, 1, 799.99),
(3, 3, 3, 1, 699.99),
(4, 4, 4, 1, 399.99);

-- Insert into user_review
INSERT INTO user_review (id, user_id, ordered_product_id, rating_value, comment)
VALUES 
(1, 1, 1, 5, 'Amazing product, highly recommend!'),
(2, 2, 2, 4, 'Great product but a bit expensive'),
(3, 3, 3, 4, NULL),  -- comment NULL
(4, 4, 4, 3, 'Not as expected, could be better');