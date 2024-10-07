CREATE TABLE site_user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,       -- Identifiant unique pour chaque utilisateur
    email_address VARCHAR(255) NOT NULL,    -- Adresse email de l'utilisateur
    phone_number VARCHAR(50) NOT NULL,                -- Numéro de téléphone de l'utilisateur
    password VARCHAR(255) NOT NULL           -- Mot de passe de l'utilisateur
);

CREATE TABLE user_address (
    user_id INT NOT NULL,                         -- Clé étrangère pour l'utilisateur
    address_id INT NOT NULL,                           -- Clé étrangère pour l'adresse
    is_default BOOLEAN DEFAULT FALSE          -- Indicateur si l'adresse est l'adresse par défaut
);

CREATE TABLE address (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,       -- Identifiant unique pour chaque adresse
    unit_number VARCHAR(50),                 -- Numéro d'unité (si applicable)
    street_number VARCHAR(50) NOT NULL,      -- Numéro de rue
    address_line1 VARCHAR(255) NOT NULL,     -- Ligne d'adresse 1
    address_line2 VARCHAR(255),               -- Ligne d'adresse 2
    city VARCHAR(100) NOT NULL,               -- Ville
    region VARCHAR(100),                      -- Région
    postal_code VARCHAR(20) NOT NULL,                  -- Code postal
    country_id INT NOT NULL                          -- Clé étrangère pour le pays
);

CREATE TABLE country (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,      -- Identifiant unique pour chaque pays
    country_name VARCHAR(255) NOT NULL      -- Nom du pays
);

CREATE TABLE user_payment_method (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque méthode de paiement d'utilisateur
    user_id INT NOT NULL,                              -- Clé étrangère pour l'utilisateur
    payment_type_id INT NOT NULL,                      -- Clé étrangère pour le type de paiement
    account_number VARCHAR(255) NOT NULL,              -- Numéro de compte (pour paiement)
    provider VARCHAR(100) NOT NULL,                    -- Fournisseur du paiement (ex: Visa, Mastercard)
    expiry_date DATE NOT NULL,                         -- Date d'expiration
    is_default BOOLEAN DEFAULT FALSE         -- Indicateur si c'est la méthode de paiement par défaut
);

CREATE TABLE payment_type (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque type de paiement
    value VARCHAR(100) NOT NULL               -- Valeur du type de paiement (ex: carte de crédit, PayPal, etc.)
);

CREATE TABLE shopping_cart (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque panier
    user_id INT NOT NULL                              -- Clé étrangère pour l'utilisateur
);

CREATE TABLE shopping_cart_item (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque article dans le panier
    cart_id INT NOT NULL,                              -- Clé étrangère pour le panier
    product_item_id INT NOT NULL,                      -- Clé étrangère pour l'article produit
    qty INT NOT NULL                         -- Quantité de l'article
);

CREATE TABLE product_category (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque catégorie de produit
    parent_category_id INT,                   -- Clé étrangère pour la catégorie parente (si applicable)
    category_name VARCHAR(100) NOT NULL     -- Nom de la catégorie
);

CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque produit
    category_id INT NOT NULL,                          -- Clé étrangère pour la catégorie de produit
    name VARCHAR(255) NOT NULL,               -- Nom du produit
    description TEXT,                         -- Description du produit
    product_image VARCHAR(255) NOT NULL               -- Lien vers l'image du produit
);

CREATE TABLE product_item (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque article de produit
    product_id INT NOT NULL,                           -- Clé étrangère pour le produit
    SKU VARCHAR(100),                         -- Unité de gestion des stocks
    qty_in_stock INT NOT NULL,                         -- Quantité en stock
    product_image VARCHAR(255) NOT NULL,               -- Lien vers l'image de l'article
    price DECIMAL(10, 2) NOT NULL           -- Prix de l'article
);

CREATE TABLE shop_order (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque commande
    user_id INT NOT NULL,                              -- Clé étrangère pour l'utilisateur
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Date de la commande
    payment_method_id INT NOT NULL,                    -- Clé étrangère pour le type de paiement
    shipping_address INT NOT NULL,                     -- Clé étrangère pour l'adresse d'expédition
    shipping_method INT NOT NULL,                     -- Clé étrangère pour le moyen d'expédition
    order_total DECIMAL(10, 2) NOT NULL,     -- Montant total de la commande
    order_status INT NOT NULL                         -- Clé étrangère pour le statut de la commande
);

CREATE TABLE order_line (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque ligne de commande
    product_item_id INT NOT NULL,                      -- Clé étrangère pour l'article de produit
    order_id INT NOT NULL,                             -- Clé étrangère pour la commande
    qty INT NOT NULL,                         -- Quantité de l'article commandé
    price DECIMAL(10, 2) NOT NULL           -- Prix de l'article à ce moment
);

CREATE TABLE shipping_method (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque méthode d'expédition
    name VARCHAR(100) NOT NULL,               -- Nom de la méthode d'expédition
    price DECIMAL(10, 2) NOT NULL             -- Prix de la méthode d'expédition
);

CREATE TABLE order_status (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque statut de commande
    status VARCHAR(100) NOT NULL              -- Nom du statut (ex: en attente, expédié, livré)
);

CREATE TABLE variation (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque variation dans le panier
    category_id INT NOT NULL,                              -- Référence à la categorie
    name VARCHAR(100) NOT NULL                      -- Nom de la variation (par exemple, "Taille" ou "Couleur")
);

CREATE TABLE variation_option (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,        -- Identifiant unique pour chaque variation dans le panier
    variation_id INT NOT NULL,  						-- Référence à la table variation
    value VARCHAR(100) NOT NULL                      -- Valeur spécifique (par exemple, "M", "L", ou "Rouge")
);

CREATE TABLE product_configuration (
    product_item_id INT NOT NULL,   -- Référence au produit spécifique (de la table product_item)
    variation_option_id INT NOT NULL  -- Référence à une option de variation (de la table variation_option)
);








