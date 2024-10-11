-- Add foreign key constraints to the user_address table
-- to establish relationships with the site_user and address tables
ALTER TABLE user_address
ADD CONSTRAINT fk_user_address_site_user
FOREIGN KEY (user_id)
REFERENCES site_user(id)
ON DELETE CASCADE,  -- If a user is deleted, their associated addresses should also be removed
ADD CONSTRAINT fk_user_address_address
FOREIGN KEY (address_id)
REFERENCES address(id);  -- No cascade here because addresses can be reused by other users

-- Add foreign key constraint to the address table
-- to establish a relationship with the country table
ALTER TABLE address
ADD CONSTRAINT fk_address_country
FOREIGN KEY (country_id)
REFERENCES country(id);  -- No cascade here because country data is global and should not be deleted when addresses are removed

-- Add foreign key constraints to the user_payment_method table
-- to establish relationships with the site_user and payment_type tables
ALTER TABLE user_payment_method
ADD CONSTRAINT fk_upm_site_user
FOREIGN KEY (user_id)
REFERENCES site_user(id)
ON DELETE CASCADE,  -- If a user is deleted, their payment methods should also be removed
ADD CONSTRAINT fk_upm_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES payment_type(id);  -- No cascade here because payment types are global, not user-specific

-- Add foreign key constraint to the shopping_cart table
-- to establish a relationship with the site_user table
ALTER TABLE shopping_cart
ADD CONSTRAINT fk_shopping_cart_site_user
FOREIGN KEY (user_id)
REFERENCES site_user(id)
ON DELETE CASCADE;  -- If a user is deleted, their shopping cart should be removed as well

-- Add foreign key constraints to the shopping_cart_item table
-- to establish relationships with the shopping_cart and product_item tables
ALTER TABLE shopping_cart_item
ADD CONSTRAINT fk_sci_shopping_cart
FOREIGN KEY (cart_id)
REFERENCES shopping_cart(id)
ON DELETE CASCADE,  -- If a shopping cart is deleted, all its items should be deleted too
ADD CONSTRAINT fk_sci_product_item
FOREIGN KEY (product_item_id)
REFERENCES product_item(id);  -- No cascade here because products are not dependent on being in a cart

-- Add self-referential foreign key constraint to the product_category table
-- to establish a hierarchical relationship within the table
ALTER TABLE product_category
ADD CONSTRAINT fk_pc_pc
FOREIGN KEY (parent_category_id)
REFERENCES product_category(id);  -- No cascade because parent categories should not automatically delete subcategories

-- Add foreign key constraint to the product table
-- to establish a relationship with the product_category table
ALTER TABLE product
ADD CONSTRAINT fk_product_pc
FOREIGN KEY (category_id)
REFERENCES product_category(id);  -- No cascade because deleting a category should not automatically delete the products

-- Add foreign key constraint to the product_item table
-- to establish a relationship with the product table
ALTER TABLE product_item
ADD CONSTRAINT fk_product_item_product
FOREIGN KEY (product_id)
REFERENCES product(id)
ON DELETE CASCADE;  -- If a product is deleted, its associated product items should be deleted as well

-- Add foreign key constraints to the shop_order table
-- to establish relationships with the site_user, user_payment_method, address, 
-- shipping_method, and order_status tables
ALTER TABLE shop_order
ADD CONSTRAINT fk_shop_order_site_user
FOREIGN KEY (user_id)
REFERENCES site_user(id),  -- No cascade because order history should remain even if a user is deleted
ADD CONSTRAINT fk_shop_order_upm
FOREIGN KEY (payment_method_id)
REFERENCES user_payment_method(id),  -- No cascade because we may want to retain payment details even if the payment method is deleted
ADD CONSTRAINT fk_shop_order_address
FOREIGN KEY (shipping_address)
REFERENCES address(id),  -- No cascade because addresses can be reused or referenced elsewhere
ADD CONSTRAINT fk_shop_order_shipping_method
FOREIGN KEY (shipping_method)
REFERENCES shipping_method(id),  -- No cascade because shipping methods are global and not tied to a specific order
ADD CONSTRAINT fk_shop_order_order_status
FOREIGN KEY (order_status)
REFERENCES order_status(id);  -- No cascade because order statuses are globally defined

-- Add foreign key constraints to the order_line table
-- to establish relationships with the product_item and shop_order tables
ALTER TABLE order_line
ADD CONSTRAINT fk_order_line_product_item
FOREIGN KEY (product_item_id)
REFERENCES product_item(id),  -- No cascade because deleting a product item should not delete the entire order line
ADD CONSTRAINT fk_order_line_shop_order
FOREIGN KEY (order_id)
REFERENCES shop_order(id)
ON DELETE CASCADE;  -- If an order is deleted, its order lines should be deleted as well

-- Add foreign key constraint to the variation table
-- to establish a relationship with the product_category table
ALTER TABLE variation
ADD CONSTRAINT fk_variation_product_category
FOREIGN KEY (category_id)
REFERENCES product_category(id);  -- No cascade because deleting a category should not affect variations

-- Add foreign key constraint to the variation_option table
-- to establish a relationship with the variation table
ALTER TABLE variation_option
ADD CONSTRAINT fk_variation_option_variation
FOREIGN KEY (variation_id)
REFERENCES variation(id)
ON DELETE CASCADE;  -- If a variation is deleted, its options should also be deleted

-- Add foreign key constraints to the product_configuration table
-- to establish relationships with the product_item and variation_option tables
ALTER TABLE product_configuration
ADD CONSTRAINT fk_pc_product_item
FOREIGN KEY (product_item_id)
REFERENCES product_item(id)
ON DELETE CASCADE,  -- If a product item is deleted, its configuration should also be removed
ADD CONSTRAINT fk_pc_variation_option
FOREIGN KEY (variation_option_id)
REFERENCES variation_option(id)
ON DELETE CASCADE;  -- If a variation option is deleted, the product configuration should also be removed

-- Add foreign key constraints to the promotion_category table
-- to establish relationships with the promotion and product_category tables
ALTER TABLE promotion_category
ADD CONSTRAINT fk_promo_category_promotion
FOREIGN KEY (promotion_id)
REFERENCES promotion(id)
ON DELETE CASCADE,  -- If a promotion is deleted, the promotion-category relation should also be deleted
ADD CONSTRAINT fk_promo_category_product_category
FOREIGN KEY (category_id)
REFERENCES product_category(id);  -- No cascade because categories are global and should not be affected by promotions

-- Add foreign key constraints to the user_review table
-- to establish relationships with the site_user and order_line tables
ALTER TABLE user_review
ADD CONSTRAINT fk_user_review_site_user
FOREIGN KEY (user_id)
REFERENCES site_user(id)
ON DELETE CASCADE,  -- If a user is deleted, their reviews should also be removed
ADD CONSTRAINT fk_user_review_order_line
FOREIGN KEY (ordered_product_id)
REFERENCES order_line(id);  -- No cascade here because reviews should not be deleted if the order is deleted

-- Add foreign key constraints to the product_image table
-- to establish relationships with the product and product_item tables
ALTER TABLE product_image
ADD CONSTRAINT fk_product_image_product
FOREIGN KEY (product_id)
REFERENCES product(id)
ON DELETE CASCADE,  -- If a product is deleted, its associated images should also be deleted
ADD CONSTRAINT fk_product_image_product_item
FOREIGN KEY (product_item_id)
REFERENCES product_item(id)
ON DELETE CASCADE;  -- If a product item is deleted, its images should also be deleted