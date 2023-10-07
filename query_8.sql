#8. Find out with which products a specific product is bought
SELECT cart_has_product.Barcode
FROM cart_has_product
JOIN 
(SELECT cart_has_product.Cart_ID
FROM cart_has_product
WHERE cart_has_product.Barcode = "5201673001034") AS csp
ON csp.Cart_ID = cart_has_product.Cart_ID
WHERE cart_has_product.Barcode != "5201673001034";