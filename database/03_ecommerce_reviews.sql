CREATE TABLE user_review (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each user review
    user_id INT NOT NULL,                              -- Foreign key referencing the user who made the review
    ordered_product_id INT NOT NULL,                      -- Foreign key referencing the product being reviewed
    rating_value TINYINT NOT NULL CHECK (rating_value BETWEEN 1 AND 5), -- Rating given by the user, constrained to be between 1 and 5
    comment TEXT  -- Optional comment left by the user
);