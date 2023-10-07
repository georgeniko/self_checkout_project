#7. Get customers with carts above a certain price
SELECT customer.Card_Number, customer.Full_Name, customer.Contact_Number
FROM customer
JOIN
(
SELECT cart.Card_Number
FROM cart
WHERE cart.Card_Number IS NOT null AND cart.Value > 10) AS cvr
ON cvr.Card_Number = customer.Card_Number;