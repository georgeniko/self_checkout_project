# 1. Check terminal's total
SELECT 
terminal.Terminal_ID AS ID,
terminal.Terminal_Total AS Total
FROM terminal
WHERE Store_ID = 11;