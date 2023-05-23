CREATE TABLE supplier_pricing (
  PRICING_ID INT PRIMARY KEY,
  PRO_ID INT,
  SUPP_ID INT,
  SUPP_PRICE INT DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID)
);
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES
  (1, 1, 2, 1500),
  (2, 3, 5, 30000),
  (3, 5, 1, 3000),
  (4, 2, 3, 2500),
  (5, 4, 1, 1000),
  (6, 12, 2, 780),
  (7, 12, 4, 789),
  (8, 3, 1, 31000),
  (9, 1, 5, 1450),
  (10, 4, 2, 999),
  (11, 7, 3, 549),
  (12, 7, 4, 529),
  (13, 6, 2, 105),
  (14, 6, 1, 99),
  (15, 2, 5, 2999),
  (16, 5, 2, 2999);
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
DELIMITER //
CREATE PROCEDURE GetSupplierRatings()
BEGIN
  SELECT
    supplier.SUPP_ID,
    supplier.SUPP_NAME,
    AVG(rating.RAT_RATSTARS) AS Rating,
    CASE
      WHEN AVG(rating.RAT_RATSTARS) = 5 THEN 'Excellent Service'
      WHEN AVG(rating.RAT_RATSTARS) > 4 THEN 'Good Service'
      WHEN AVG(rating.RAT_RATSTARS) > 2 THEN 'Average Service'
      ELSE 'Poor Service'
    END AS Type_of_Service
  FROM supplier
  INNER JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
  INNER JOIN order_table ON supplier_pricing.PRICING_ID = order_table.PRICING_ID
  INNER JOIN rating ON order_table.ORD_ID = rating.ORD_ID
  GROUP BY supplier.SUPP_ID;
END //
DELIMITER ;
