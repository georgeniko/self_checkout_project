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