-- Create a table to store promotions
CREATE TABLE promotion (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each promotion
    name VARCHAR(255) NOT NULL,  -- Name of the promotion
    description TEXT,  -- Detailed description of the promotion
    discount_rate DECIMAL(5, 2) NOT NULL,  -- Discount rate applied to the promotion (e.g., 10.50 for 10.5%)
    start_date DATE NOT NULL,  -- Start date of the promotion
    end_date DATE NOT NULL  -- End date of the promotion
);

-- Create a many-to-many relationship table between promotions and categories
CREATE TABLE promotion_category (
    category_id INT NOT NULL,  -- Foreign key referencing the category table
    promotion_id INT NOT NULL  -- Foreign key referencing the promotion table
);