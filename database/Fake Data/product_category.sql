-- Catégories parentes
INSERT INTO product_category (id, parent_category_id, category_name)
VALUES (1, NULL, 'Électronique'),
    (2, NULL, 'Vêtements'),
    (3, NULL, 'Maison et jardin');
-- Catégories enfants pour Électronique
INSERT INTO product_category (id, parent_category_id, category_name)
VALUES (4, 1, 'Smartphones'),
    (5, 1, 'Ordinateurs portables'),
    (6, 1, 'Téléviseurs');
-- Catégories enfants pour Vêtements
INSERT INTO product_category (id, parent_category_id, category_name)
VALUES (7, 2, 'T-shirts'),
    (8, 2, 'Jeans'),
    (9, 2, 'Vestes');
-- Catégories enfants pour Maison et jardin
INSERT INTO product_category (id, parent_category_id, category_name)
VALUES (10, 3, 'Meubles'),
    (11, 3, 'Décoration'),
    (12, 3, 'Outils de jardinage');