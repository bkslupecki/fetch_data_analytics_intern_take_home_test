SELECT TOP 1
  USER_ID, 
  SUM(TOTAL_SPENT) AS total_spent 
FROM 
  receipts 
WHERE 
  MONTH(PURCHASE_DATE) = 8 
GROUP BY 
  USER_ID 
ORDER BY 
  total_spent DESC
