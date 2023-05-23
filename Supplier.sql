CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
  (1, 'Rajesh Retails', 'Delhi', '1234567890'),
  (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
  (3, 'Knome products', 'Banglore', '9785462315'),
  (4, 'Bansal Retails', 'Kochi', '8975463285'),
  (5, 'Mittal Ltd.', 'Lucknow', '7898456532');
SELECT supplier.*
FROM supplier
INNER JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier.SUPP_ID
HAVING COUNT(DISTINCT supplier_pricing.PRO_ID) > 1;
