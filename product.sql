	CREATE TABLE product (
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
  PRO_DESC VARCHAR(60),
  CAT_ID INT,
  FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
  (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
  (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
  (4, 'OATS', 'Highly Nutritious from Nestle', 3),
  (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
  (6, 'MILK', '1L Toned Milk', 3),
  (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
  (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
  (9, 'Project IGI', 'compatible with Windows 7 and above', 2),
  (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
  (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
  (12, 'Train Your Brain', 'By Shireen Stephen', 1);
SELECT product.PRO_ID, product.PRO_NAME
FROM product
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
INNER JOIN order_table ON supplier_pricing.PRICING_ID = order_table.PRICING_ID
WHERE order_table.ORD_DATE > '2021-10-05';
