#viwes all columns in table
SELECT * FROM project1.`e-commerce dataset`;

#Count total transactions?
SELECT COUNT(*) AS total_transactions
FROM project1.`e-commerce dataset`;

#Show distinct categories
SELECT DISTINCT Category
FROM project1.`e-commerce dataset`;

#WHERE FILTERING
#Purchases with discount above 30%?
SELECT *
FROM project1.`e-commerce dataset`
WHERE `Discount (%)` > 30;

#Payments made using Credit Card
SELECT *
FROM project1.`e-commerce dataset`
WHERE Payment_Method = 'Credit Card';

#Products priced above Rs. 300
SELECT *
FROM project1.`e-commerce dataset`
WHERE `Price (Rs.)` > 300;

#ORDER BY
#Sort purchases by final price (high to low)
SELECT *
FROM project1.`e-commerce dataset`
ORDER BY `Final_Price(Rs.)` DESC;

#AGGREGATION (GROUP BY)
#Total revenue
SELECT SUM(`Final_Price(Rs.)`) AS total_revenue
FROM project1.`e-commerce dataset`;

#Revenue by category
SELECT Category,
       SUM(`Final_Price(Rs.)`) AS category_revenue
FROM project1.`e-commerce dataset`
GROUP BY Category;

#Average discount per category
SELECT Category,
       AVG(`Discount (%)`) AS avg_discount
FROM project1.`e-commerce dataset`
GROUP BY Category;

#HAVING (Post-Aggregation Filter)
#Categories with revenue above Rs. 1,00,000
SELECT Category,
       SUM(`Final_Price(Rs.)`) AS revenue
FROM project1.`e-commerce dataset`
GROUP BY Category
HAVING revenue > 100000;

#Payment methods used more than 20 times
SELECT Payment_Method,
       COUNT(*) AS usage_count
FROM project1.`e-commerce dataset`
GROUP BY Payment_Method
HAVING usage_count > 20;

#Monthly revenue
SELECT MONTH(Purchase_Date) AS month,
       SUM(`Final_Price(Rs.)`) AS revenue
FROM project1.`e-commerce dataset`
GROUP BY month;

#CASE STATEMENT
#Categorize discount level
SELECT Product_ID,
       `Discount (%)`,
       CASE
           WHEN `Discount (%)` >= 40 THEN 'High Discount'
           WHEN `Discount (%)` >= 20 THEN 'Medium Discount'
           ELSE 'Low Discount'
       END AS discount_level
FROM project1.`e-commerce dataset`;


#SUBQUERIES
#Products priced above average price
SELECT *
FROM project1.`e-commerce dataset`
WHERE `Price (Rs.)` >
      (SELECT AVG(`Price (Rs.)`)
       FROM project1.`e-commerce dataset`);
       
#WINDOW FUNCTIONS (ADVANCED)
#Rank purchases by final price
SELECT Product_ID,
       `Final_Price(Rs.)`,
       RANK() OVER (ORDER BY `Final_Price(Rs.)` DESC) AS price_rank
FROM project1.`e-commerce dataset`;











