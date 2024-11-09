SELECT * FROM [dbo].[Customer];

--retrieve the total number of customers from each region.

SELECT Region, COUNT (CustomerID) AS Region_Customers
FROM [dbo].[Customer]
GROUP BY Region;

--find the most popular subscription type by the number of customers.

SELECT SubscriptionType, COUNT (CustomerID) AS Cust_Subscription FROM [dbo].[Customer]
GROUP BY SubscriptionType
ORDER BY Cust_Subscription DESC;

--find customers who canceled their subscription within 6 months.

SELECT *
FROM [dbo].[Customer]
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) <= 6;


--calculate the average subscription duration for all customers

SELECT AVG(DATEDIFF(Year, SubscriptionStart, SubscriptionEnd)) AS Average_Duration
FROM [dbo].[Customer];

--find customers with subscriptions longer than 12 months

SELECT CustomerID, SubscriptionType, SubscriptionStart, SubscriptionEnd
FROM [dbo].[Customer]
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) >12;

--calculate total revenue by subscription type

SELECT SubscriptionType, SUM(Revenue) AS Total_Revenue
FROM [dbo].[Customer]
GROUP BY SubscriptionType;

--find the top 3 regions by subscription cancellations.

SELECT Region, COUNT(*) AS Canceled_Sub
FROM [dbo].[Customer]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Canceled_Sub DESC;


SELECT Region, COUNT(*) AS Canceled_Sub
FROM [dbo].[Customer]
WHERE Canceled = 0
GROUP BY Region
ORDER BY Canceled_Sub DESC;

--find the total number of active and canceled subscriptions

SELECT Canceled, COUNT(*) AS Total_Subscriptions
FROM [dbo].[Customer]
GROUP BY Canceled;



