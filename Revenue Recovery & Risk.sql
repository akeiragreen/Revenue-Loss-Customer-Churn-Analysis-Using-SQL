-- looking to see what i have in my tables 

SELECT *
FROM orders;

SELECT *
FROM customers;

SELECT *
FROM support_tickets;

-- Project Goal: Uncover hidden revenue loss, customer friction points, and 
--   performance risks by analyzing customer behavior, orders, and support tickets.


-- -------------------------------------------------------------------

--         How much revenue has been lost due to returned orders and delivery issues?


SELECT SUM(`order_amount`) AS Total_revenue_lost
FROM orders
WHERE `is_returned` = 1 or `delivery_issue` = 1
;

-- Insight: The business has lost $750 in revenue due to product returns and delivery issues.
--   This represents a direct financial impact from operational challenges 
--      that need addressing to improve profitability.
-- Stakeholder Impact: Operations teams should prioritize reducing delivery errors and return rates to recapture lost revenue.
--    Customer experience teams can leverage this data to identify friction points causing returns.

-- -----------------------------------------------------------------

--       Which customer segment experiences the most revenue-impacting issues?


SELECT 
    c.customer_id,
    c.segment,
    SUM(o.order_amount) AS Revenue_lost
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
WHERE o.is_returned = 1 
  AND o.delivery_issue = 1
GROUP BY c.customer_id, c.segment
ORDER BY Revenue_lost DESC;


-- Insight: The Mid-Market and Small Business segments suffer 
--     the most revenue loss due to order returns and delivery problems.
--  These customer groups may require tailored solutions to improve satisfaction and retention.
-- Stakeholder Impact: Sales and account managers should engage more 
--     closely with these segments to understand and resolve pain points.
--  Product and logistics teams can focus improvement efforts on these key segments.

-- ---------------------------------------------

--     Which customers are at risk of churn due to multiple negative interactions (returns + tickets)?

SELECT 
    c.customer_id,
    c.name,
    c.segment,
    COUNT(DISTINCT o.order_id) AS return_count,
    COUNT(DISTINCT t.ticket_id) AS ticket_count,
    CASE 
        WHEN COUNT(DISTINCT o.order_id) >= 2 AND COUNT(DISTINCT t.ticket_id) >= 2 THEN 'High Risk'
        WHEN COUNT(DISTINCT o.order_id) >= 2 OR COUNT(DISTINCT t.ticket_id) >= 2 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS churn_risk
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id AND o.is_returned = 1
LEFT JOIN support_tickets AS t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.segment
HAVING 
    COUNT(DISTINCT o.order_id) >= 1 OR 
    COUNT(DISTINCT t.ticket_id) >= 1
ORDER BY churn_risk DESC, return_count DESC, ticket_count DESC;

-- Insight:Only Quantum Corp is identified as a Moderate Risk of churn 
--    based on multiple returns and support tickets.
-- The majority of customers are currently Low Risk, 
--    suggesting relatively healthy customer retention overall.
-- Stakeholder Impact:Customer success teams should proactively 
--    reach out to Quantum Corp to resolve outstanding issues and prevent churn.
-- This risk scoring framework can be embedded into regular reporting for ongoing churn prevention.



-- ---------------------------------------------------------------

--     What is the average ticket resolution time, and how does it vary by issue type and region?

SELECT
    t.issue_type,
    c.region,
   ROUND(AVG(t.resolution_time_days)) AS avg_resolution_time_days
FROM support_tickets t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.resolution_time_days IS NOT NULL
GROUP BY t.issue_type, c.region
ORDER BY c.region, avg_resolution_time_days DESC;

-- Insight:The East region experiences the longest average resolution times for 
--    failed delivery and product bag issues, indicating regional service delays.
-- Other regions show faster ticket resolution on average.
-- Stakeholder Impact:Customer support leadership can prioritize resource allocation 
--    or training in the East region to speed resolution.
-- Operations teams should investigate root causes of regional delivery failures.


-- -----------------------------------------------------------------------------------

--     What’s the net revenue impact of customers who required support after their order?


SELECT
    SUM(o.order_amount) AS net_revenue_impact
FROM orders o
JOIN support_tickets t ON o.customer_id = t.customer_id
WHERE t.open_date > o.order_date;

-- Insight:Customers who required post-order support contribute a net revenue of $5,350.
-- This segment represents a significant portion of revenue that 
--    also demands additional support investment.
-- Stakeholder Impact:Balancing revenue growth with support costs is crucial; 
--    targeted efforts to reduce support needs here could improve margins.
-- Customer service should develop specialized workflows to proactively address issues in this group.

































































