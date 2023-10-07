# 2. Get carts bought by registered customers
SELECT * 
FROM cart
WHERE cart.Card_Number IS NOT null;