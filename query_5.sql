# 5. Get the store clerks of a specific store
SELECT store_clerk.Full_Name, store_clerk.Contact_Number, store_clerk.Work_Schedule
FROM store_clerk
WHERE store_clerk.Store_ID = 11;