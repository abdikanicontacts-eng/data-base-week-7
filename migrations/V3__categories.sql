CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name TEXT,
    parent_id INT REFERENCES categories(id)
);

INSERT INTO categories (name, parent_id)
SELECT 'Electronics', NULL
WHERE NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Electronics'
);

INSERT INTO categories (name, parent_id)
SELECT 'Computers',
       (SELECT id FROM categories WHERE name = 'Electronics' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Computers'
);

INSERT INTO categories (name, parent_id)
SELECT 'Laptops',
       (SELECT id FROM categories WHERE name = 'Computers' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Laptops'
);

INSERT INTO categories (name, parent_id)
SELECT 'Phones',
       (SELECT id FROM categories WHERE name = 'Electronics' LIMIT 1)
WHERE NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Phones'
);
