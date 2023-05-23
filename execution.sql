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
