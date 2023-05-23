CREATE TABLE category (
  CAT_ID INT PRIMARY KEY,
  CAT_NAME VARCHAR(20) NOT NULL
);
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES
  (1, 'BOOKS'),
  (2, 'GAMES'),
  (3, 'GROCERIES'),
  (4, 'ELECTRONICS'),
  (5, 'CLOTHES');
SELECT category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE
FROM category
INNER JOIN product ON category.CAT_ID = product.CAT_ID
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
WHERE supplier_pricing.SUPP_PRICE = (
  SELECT MIN(SUPP_PRICE)
  FROM supplier_pricing
  WHERE supplier_pricing.PRO_ID = product.PRO_ID
)
ORDER BY category.CAT_ID;
