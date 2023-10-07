# 4. Total of day of specific store
SELECT cart.Cart_ID, cart.Value, cart.Payment_Method
FROM cart
WHERE cart.Store_ID = 17 AND DATE(cart.Date_Time) = '2021-03-12';