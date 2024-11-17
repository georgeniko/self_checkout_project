# 1.Check terminal's total
SELECT 
terminal.Terminal_ID AS ID,
terminal.Terminal_Total AS Total
FROM terminal
WHERE Store_ID = 11;

# 2. Get carts bought by registered customers
SELECT * 
FROM cart
WHERE cart.Card_Number IS NOT null;

# 3.
SELECT 
term.Store_ID, 
term.Terminal_ID, 
term.Terminal_Total,
st.Location
FROM
(SELECT 
terminal.Store_ID, 
terminal.Terminal_ID, 
terminal.Terminal_Total
FROM terminal) AS term
JOIN
(SELECT store.Store_ID, store.Location
FROM store
WHERE store.Location = "Agias Sofias 3, Thessaloniki") AS st
ON st.Store_ID = term.Store_ID;

# 4. Total of day of specific store
SELECT cart.Cart_ID, cart.Value, cart.Payment_Method
FROM cart
WHERE cart.Store_ID = 17 AND DATE(cart.Date_Time) = '2021-03-12';

# 5. Get the store clerks of a specific store
SELECT store_clerk.Full_Name, store_clerk.Contact_Number, store_clerk.Work_Schedule
FROM store_clerk
WHERE store_clerk.Store_ID = 11;

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

#7. Get customers with carts above a certain price
SELECT customer.Card_Number, customer.Full_Name, customer.Contact_Number
FROM customer
JOIN
(
SELECT cart.Card_Number
FROM cart
WHERE cart.Card_Number IS NOT null AND cart.Value > 10) AS cvr
ON cvr.Card_Number = customer.Card_Number;

#8. Find out with which products a specific product is bought
SELECT cart_has_product.Barcode
FROM cart_has_product
JOIN 
(SELECT cart_has_product.Cart_ID
FROM cart_has_product
WHERE cart_has_product.Barcode = "5201673001034") AS csp
ON csp.Cart_ID = cart_has_product.Cart_ID
WHERE cart_has_product.Barcode != "5201673001034";


