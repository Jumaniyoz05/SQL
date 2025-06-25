SELECT e.name
FROM Employee e
JOIN Employee d ON e.id = d.managerId
GROUP BY e.id, e.name
HAVING COUNT(d.id) >= 5;
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
WITH VendorOrders AS (
  SELECT CustomerID, Vendor, SUM([Count]) AS total_orders
  FROM Orders
  GROUP BY CustomerID, Vendor
),
RankedOrders AS (
  SELECT CustomerID, Vendor, total_orders,
         RANK() OVER (PARTITION BY CustomerID ORDER BY total_orders DESC) AS rnk
  FROM VendorOrders
)
SELECT CustomerID, Vendor
FROM RankedOrders
WHERE rnk = 1;
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;

WHILE @i * @i <= @Check_Prime
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @IsPrime = 0;
        BREAK;
    END
    SET @i = @i + 1;
END

SELECT CASE WHEN @IsPrime = 1 AND @Check_Prime > 1
            THEN 'This number is prime'
            ELSE 'This number is not prime'
       END AS Result;
WITH LocationCounts AS (
  SELECT Device_id, Locations, COUNT(*) AS signals
  FROM Device
  GROUP BY Device_id, Locations
),
MaxSignals AS (
  SELECT Device_id, MAX(signals) AS max_signals
  FROM LocationCounts
  GROUP BY Device_id
)
SELECT 
  l.Device_id,
  COUNT(DISTINCT l.Locations) AS no_of_location,
  MAX(CASE WHEN l.signals = m.max_signals THEN l.Locations END) AS max_signal_location,
  SUM(l.signals) AS no_of_signals
FROM LocationCounts l
JOIN MaxSignals m ON l.Device_id = m.Device_id
GROUP BY l.Device_id;
SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
  SELECT AVG(Salary)
  FROM Employee
  WHERE DeptID = e.DeptID
);
WITH WinningNumbers AS (
  SELECT Number FROM (VALUES (25), (45), (78)) AS w(Number)
),
TicketMatches AS (
  SELECT t.TicketID, COUNT(DISTINCT t.Number) AS matched_count
  FROM Tickets t
  JOIN WinningNumbers w ON t.Number = w.Number
  GROUP BY t.TicketID
),
TotalWinningNumbers AS (
  SELECT COUNT(*) AS cnt FROM WinningNumbers
)
SELECT SUM(
  CASE 
    WHEN tm.matched_count = twn.cnt THEN 100
    WHEN tm.matched_count > 0 THEN 10
    ELSE 0
  END
) AS Total_Winnings
FROM TicketMatches tm CROSS JOIN TotalWinningNumbers twn;
WITH UserPlatform AS (
  SELECT User_id, Spend_date,
    SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS Mobile_Amount,
    SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS Desktop_Amount
  FROM Spending
  GROUP BY User_id, Spend_date
),
PlatformSummary AS (
  SELECT Spend_date,
    SUM(CASE WHEN Mobile_Amount > 0 AND Desktop_Amount = 0 THEN Mobile_Amount ELSE 0 END) AS Mobile_Amount,
    COUNT(DISTINCT CASE WHEN Mobile_Amount > 0 AND Desktop_Amount = 0 THEN User_id END) AS Mobile_Users,
    SUM(CASE WHEN Desktop_Amount > 0 AND Mobile_Amount = 0 THEN Desktop_Amount ELSE 0 END) AS Desktop_Amount,
    COUNT(DISTINCT CASE WHEN Desktop_Amount > 0 AND Mobile_Amount = 0 THEN User_id END) AS Desktop_Users,
    SUM(CASE WHEN Desktop_Amount > 0 AND Mobile_Amount > 0 THEN Desktop_Amount + Mobile_Amount ELSE 0 END) AS Both_Amount,
    COUNT(DISTINCT CASE WHEN Desktop_Amount > 0 AND Mobile_Amount > 0 THEN User_id END) AS Both_Users
  FROM UserPlatform
  GROUP BY Spend_date
)
SELECT Spend_date, 'Mobile' AS Platform, Mobile_Amount AS Total_Amount, Mobile_Users AS Total_users
FROM PlatformSummary
UNION ALL
SELECT Spend_date, 'Desktop', Desktop_Amount, Desktop_Users
FROM PlatformSummary
UNION ALL
SELECT Spend_date, 'Both', Both_Amount, Both_Users
FROM PlatformSummary
ORDER BY Spend_date, Platform;
WITH Numbers AS (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
)
SELECT Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
ORDER BY Product;
