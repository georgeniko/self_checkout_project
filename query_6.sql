# 6. Get all products of specific cart
SELECT product.Image_Link, 
product.Price, 
product.Name,
chp.Quantity
FROM 
(SELECT *
FROM cart_has_product
WHERE cart_has_product.Cart_ID = 44)  AS chp
JOIN product ON chp.Barcode = product.Barcode;