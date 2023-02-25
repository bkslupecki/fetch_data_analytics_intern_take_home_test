SELECT TOP 1
  receipts.USER_ID,
  items.ORIGINAL_RECEIPT_ITEM_TEXT,
  items.TOTAL_FINAL_PRICE,
  items.QUANTITY_PURCHASED
FROM 
  receipt_items items 
  JOIN receipts ON items.REWARDS_RECEIPT_ID = receipts.ID
WHERE 
  items.TOTAL_FINAL_PRICE = (
    SELECT 
		MAX(TOTAL_FINAL_PRICE/NULLIF(QUANTITY_PURCHASED, 0)) --NULLIF used because I was getting a divide by zero error
    FROM 
      receipt_items
  )
