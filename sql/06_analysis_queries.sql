-- =========================================================
-- House Price Prediction Database
-- File: 06_analysis_queries.sql
-- Description: Business analysis queries and SQL concepts
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- Section 1: Basic Queries
-- =========================================================

-- 1. Display all house records

SELECT *
FROM houses;

-- 2. Display all available properties

SELECT *
FROM houses
WHERE sale_status = 'Available';

-- 3. Display houses with more than 3 bedrooms

SELECT *
FROM houses
WHERE bedrooms > 3;

-- 4. Display houses priced above ₹1 Crore

SELECT house_id,
       price
FROM houses
WHERE price > 10000000;

-- 5. Display houses between 1000 and 2000 square feet

SELECT house_id,
       area_sqft
FROM houses
WHERE area_sqft BETWEEN 1000 AND 2000;

-- 6. Display houses facing East

SELECT house_id,
       facing_direction
FROM houses
WHERE facing_direction = 'East';

-- 7. Display all unique property types

SELECT DISTINCT property_type
FROM property_types;

-- 8. Display top 10 most expensive houses

SELECT house_id,
       price
FROM houses
ORDER BY price DESC
LIMIT 10;

-- 9. Display top 10 cheapest houses

SELECT house_id,
       price
FROM houses
ORDER BY price
LIMIT 10;

-- 10. Display houses listed after January 1, 2024

SELECT house_id,
       listing_date
FROM houses
WHERE listing_date >= '2024-01-01';

-- =========================================================
-- Section 2: Aggregate Functions
-- =========================================================

-- 11. Total number of houses

SELECT COUNT(*) AS total_houses
FROM houses;

-- 12. Total number of property sales

SELECT COUNT(*) AS total_sales
FROM sales;

-- 13. Average house price

SELECT ROUND(AVG(price),2) AS average_house_price
FROM houses;

-- 14. Highest house price

SELECT MAX(price) AS highest_house_price
FROM houses;

-- 15. Lowest house price

SELECT MIN(price) AS lowest_house_price
FROM houses;

-- 16. Total market value of all listed houses

SELECT SUM(price) AS total_market_value
FROM houses;

-- 17. Average house area

SELECT ROUND(AVG(area_sqft),2) AS average_area_sqft
FROM houses;

-- 18. Average property age

SELECT ROUND(AVG(property_age),2) AS average_property_age
FROM houses;

-- 19. Total loan amount issued

SELECT SUM(loan_amount) AS total_loan_amount
FROM sales;

-- 20. Average loan amount

SELECT ROUND(AVG(loan_amount),2) AS average_loan_amount
FROM sales;

-- =========================================================
-- Section 3: JOIN Queries
-- =========================================================

-- 21. Display houses with their location details

SELECT
    h.house_id,
    l.city,
    l.area,
    l.state,
    h.price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id;

-- 22. Display houses with builder information

SELECT
    h.house_id,
    b.builder_name,
    b.builder_type,
    b.builder_rating,
    h.price
FROM houses h
INNER JOIN builders b
ON h.builder_id = b.builder_id;

-- 23. Display houses with property type details

SELECT
    h.house_id,
    p.property_type,
    p.category,
    h.area_sqft,
    h.price
FROM houses h
INNER JOIN property_types p
ON h.property_type_id = p.property_type_id;

-- 24. Display houses with current owner details

SELECT
    h.house_id,
    o.owner_name,
    o.city,
    o.occupation,
    h.price
FROM houses h
INNER JOIN owners o
ON h.owner_id = o.owner_id;

-- 25. Display sales with house details

SELECT
    s.sale_id,
    h.house_id,
    h.area_sqft,
    h.bedrooms,
    s.sale_price,
    s.sale_date
FROM sales s
INNER JOIN houses h
ON s.house_id = h.house_id;

-- 26. Display sales with owner details

SELECT
    s.sale_id,
    o.owner_name,
    o.phone_number,
    s.sale_price,
    s.sale_date
FROM sales s
INNER JOIN owners o
ON s.owner_id = o.owner_id;

-- 27. Display sales with agent details

SELECT
    s.sale_id,
    a.agent_name,
    a.rating,
    s.sale_price,
    s.sale_date
FROM sales s
INNER JOIN agents a
ON s.agent_id = a.agent_id;

-- 28. Display houses with builder and location information

SELECT
    h.house_id,
    b.builder_name,
    l.city,
    h.price
FROM houses h
INNER JOIN builders b
ON h.builder_id = b.builder_id
INNER JOIN locations l
ON h.location_id = l.location_id;

-- 29. Display complete property information

SELECT
    h.house_id,
    l.city,
    b.builder_name,
    p.property_type,
    o.owner_name,
    h.price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id
INNER JOIN builders b
ON h.builder_id = b.builder_id
INNER JOIN property_types p
ON h.property_type_id = p.property_type_id
INNER JOIN owners o
ON h.owner_id = o.owner_id;

-- 30. Display houses with available amenities

SELECT
    h.house_id,
    a.amenity_name
FROM house_amenities ha
INNER JOIN houses h
ON ha.house_id = h.house_id
INNER JOIN amenities a
ON ha.amenity_id = a.amenity_id;

-- 31. Count amenities available for each house

SELECT
    h.house_id,
    COUNT(ha.amenity_id) AS total_amenities
FROM houses h
INNER JOIN house_amenities ha
ON h.house_id = ha.house_id
GROUP BY h.house_id
ORDER BY total_amenities DESC;

-- 32. Display builder-wise total houses

SELECT
    b.builder_name,
    COUNT(h.house_id) AS total_houses
FROM builders b
INNER JOIN houses h
ON b.builder_id = h.builder_id
GROUP BY b.builder_name
ORDER BY total_houses DESC;

-- 33. Display city-wise total houses

SELECT
    l.city,
    COUNT(h.house_id) AS total_houses
FROM locations l
INNER JOIN houses h
ON l.location_id = h.location_id
GROUP BY l.city
ORDER BY total_houses DESC;

-- 34. Display owner-wise total properties

SELECT
    o.owner_name,
    COUNT(h.house_id) AS total_properties
FROM owners o
INNER JOIN houses h
ON o.owner_id = h.owner_id
GROUP BY o.owner_name
ORDER BY total_properties DESC;

-- 35. Display agent-wise total sales

SELECT
    a.agent_name,
    COUNT(s.sale_id) AS total_sales
FROM agents a
INNER JOIN sales s
ON a.agent_id = s.agent_id
GROUP BY a.agent_name
ORDER BY total_sales DESC;

-- =========================================================
-- Section 4: GROUP BY & HAVING
-- =========================================================

-- 36. Display total houses available in each city

SELECT
    l.city,
    COUNT(h.house_id) AS total_houses
FROM locations l
INNER JOIN houses h
ON l.location_id = h.location_id
GROUP BY l.city
ORDER BY total_houses DESC;

-- 37. Display average house price by city

SELECT
    l.city,
    ROUND(AVG(h.price), 2) AS average_price
FROM locations l
INNER JOIN houses h
ON l.location_id = h.location_id
GROUP BY l.city
ORDER BY average_price DESC;

-- 38. Display total houses developed by each builder

SELECT
    b.builder_name,
    COUNT(h.house_id) AS total_houses
FROM builders b
INNER JOIN houses h
ON b.builder_id = h.builder_id
GROUP BY b.builder_name
ORDER BY total_houses DESC;

-- 39. Display average property price by property type

SELECT
    p.property_type,
    ROUND(AVG(h.price), 2) AS average_price
FROM property_types p
INNER JOIN houses h
ON p.property_type_id = h.property_type_id
GROUP BY p.property_type
ORDER BY average_price DESC;

-- 40. Display total sales handled by each agent

SELECT
    a.agent_name,
    COUNT(s.sale_id) AS total_sales
FROM agents a
INNER JOIN sales s
ON a.agent_id = s.agent_id
GROUP BY a.agent_name
ORDER BY total_sales DESC;

-- 41. Display total revenue generated by each agent

SELECT
    a.agent_name,
    SUM(s.sale_price) AS total_revenue
FROM agents a
INNER JOIN sales s
ON a.agent_id = s.agent_id
GROUP BY a.agent_name
ORDER BY total_revenue DESC;

-- 42. Display cities having more than 100 houses

SELECT
    l.city,
    COUNT(h.house_id) AS total_houses
FROM locations l
INNER JOIN houses h
ON l.location_id = h.location_id
GROUP BY l.city
HAVING COUNT(h.house_id) > 100
ORDER BY total_houses DESC;

-- 43. Display builders having an average property price above ₹80,00,000

SELECT
    b.builder_name,
    ROUND(AVG(h.price), 2) AS average_price
FROM builders b
INNER JOIN houses h
ON b.builder_id = h.builder_id
GROUP BY b.builder_name
HAVING AVG(h.price) > 8000000
ORDER BY average_price DESC;

-- 44. Display owners who own more than one property

SELECT
    o.owner_name,
    COUNT(h.house_id) AS total_properties
FROM owners o
INNER JOIN houses h
ON o.owner_id = h.owner_id
GROUP BY o.owner_name
HAVING COUNT(h.house_id) > 1
ORDER BY total_properties DESC;

-- 45. Display amenities available in more than 50 houses

SELECT
    a.amenity_name,
    COUNT(ha.house_id) AS total_houses
FROM amenities a
INNER JOIN house_amenities ha
ON a.amenity_id = ha.amenity_id
GROUP BY a.amenity_name
HAVING COUNT(ha.house_id) > 50
ORDER BY total_houses DESC; 

-- =========================================================
-- Section 5: Subqueries
-- =========================================================

-- 46. Display houses priced above the average house price

SELECT
    house_id,
    price
FROM houses
WHERE price >
(
    SELECT AVG(price)
    FROM houses
);

-- 47. Display houses priced below the average house price

SELECT
    house_id,
    price
FROM houses
WHERE price <
(
    SELECT AVG(price)
    FROM houses
);

-- 48. Display the most expensive house in each city

SELECT
    l.city,
    h.house_id,
    h.price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id
WHERE h.price =
(
    SELECT MAX(h2.price)
    FROM houses h2
    WHERE h2.location_id = h.location_id
);

-- 49. Display builders whose average house price is above the overall average

SELECT
    builder_name
FROM builders
WHERE builder_id IN
(
    SELECT builder_id
    FROM houses
    GROUP BY builder_id
    HAVING AVG(price) >
    (
        SELECT AVG(price)
        FROM houses
    )
);

-- 50. Display owners who own the highest-priced property

SELECT
    owner_name
FROM owners
WHERE owner_id =
(
    SELECT owner_id
    FROM houses
    WHERE price =
    (
        SELECT MAX(price)
        FROM houses
    )
);

-- 51. Display the agent who handled the highest sale

SELECT
    agent_name
FROM agents
WHERE agent_id =
(
    SELECT agent_id
    FROM sales
    WHERE sale_price =
    (
        SELECT MAX(sale_price)
        FROM sales
    )
);

-- 52. Display houses having more amenities than the average

SELECT
    house_id
FROM house_amenities
GROUP BY house_id
HAVING COUNT(*) >
(
    SELECT AVG(total_amenities)
    FROM
    (
        SELECT COUNT(*) AS total_amenities
        FROM house_amenities
        GROUP BY house_id
    ) AS amenity_count
);

-- 53. Display cities where the average house price is greater than the overall average

SELECT
    city
FROM locations
WHERE location_id IN
(
    SELECT location_id
    FROM houses
    GROUP BY location_id
    HAVING AVG(price) >
    (
        SELECT AVG(price)
        FROM houses
    )
);

-- 54. Display houses sold above the average sale price

SELECT
    house_id,
    sale_price
FROM sales
WHERE sale_price >
(
    SELECT AVG(sale_price)
    FROM sales
);

-- 55. Display builders who have developed more houses than the average builder

SELECT
    builder_name
FROM builders
WHERE builder_id IN
(
    SELECT builder_id
    FROM houses
    GROUP BY builder_id
    HAVING COUNT(*) >
    (
        SELECT AVG(total_houses)
        FROM
        (
            SELECT COUNT(*) AS total_houses
            FROM houses
            GROUP BY builder_id
        ) AS builder_count
    )
);

-- =========================================================
-- Section 6: Common Table Expressions (CTEs)
-- =========================================================

-- 56. Display houses priced above the average house price using a CTE

WITH average_price AS
(
    SELECT AVG(price) AS avg_price
    FROM houses
)

SELECT
    house_id,
    price
FROM houses
WHERE price >
(
    SELECT avg_price
    FROM average_price
);

-- 57. Display builders with the total number of houses developed

WITH builder_summary AS
(
    SELECT
        builder_id,
        COUNT(*) AS total_houses
    FROM houses
    GROUP BY builder_id
)

SELECT
    b.builder_name,
    bs.total_houses
FROM builder_summary bs
INNER JOIN builders b
ON bs.builder_id = b.builder_id
ORDER BY bs.total_houses DESC;

-- 58. Display city-wise average house price

WITH city_price AS
(
    SELECT
        location_id,
        ROUND(AVG(price), 2) AS average_price
    FROM houses
    GROUP BY location_id
)

SELECT
    l.city,
    cp.average_price
FROM city_price cp
INNER JOIN locations l
ON cp.location_id = l.location_id
ORDER BY cp.average_price DESC;

-- 59. Display owners who own more than one property

WITH owner_properties AS
(
    SELECT
        owner_id,
        COUNT(*) AS total_properties
    FROM houses
    GROUP BY owner_id
)

SELECT
    o.owner_name,
    op.total_properties
FROM owner_properties op
INNER JOIN owners o
ON op.owner_id = o.owner_id
WHERE op.total_properties > 1
ORDER BY op.total_properties DESC;

-- 60. Display the total sales revenue generated by each agent

WITH agent_sales AS
(
    SELECT
        agent_id,
        SUM(sale_price) AS total_revenue
    FROM sales
    GROUP BY agent_id
)

SELECT
    a.agent_name,
    ag.total_revenue
FROM agent_sales ag
INNER JOIN agents a
ON ag.agent_id = a.agent_id
ORDER BY ag.total_revenue DESC;

-- 61. Display houses having more than three amenities

WITH amenity_count AS
(
    SELECT
        house_id,
        COUNT(*) AS total_amenities
    FROM house_amenities
    GROUP BY house_id
)

SELECT
    h.house_id,
    ac.total_amenities
FROM amenity_count ac
INNER JOIN houses h
ON ac.house_id = h.house_id
WHERE ac.total_amenities > 3
ORDER BY ac.total_amenities DESC;

-- 62. Display the highest-priced house in each city

WITH city_max_price AS
(
    SELECT
        location_id,
        MAX(price) AS highest_price
    FROM houses
    GROUP BY location_id
)

SELECT
    l.city,
    h.house_id,
    h.price
FROM houses h
INNER JOIN city_max_price cp
ON h.location_id = cp.location_id
AND h.price = cp.highest_price
INNER JOIN locations l
ON h.location_id = l.location_id;

-- 63. Display property types with average price greater than ₹80,00,000

WITH property_summary AS
(
    SELECT
        property_type_id,
        AVG(price) AS average_price
    FROM houses
    GROUP BY property_type_id
)

SELECT
    p.property_type,
    ROUND(ps.average_price,2) AS average_price
FROM property_summary ps
INNER JOIN property_types p
ON ps.property_type_id = p.property_type_id
WHERE ps.average_price > 8000000;

-- 64. Display monthly sales revenue

WITH monthly_sales AS
(
    SELECT
        MONTH(sale_date) AS sale_month,
        SUM(sale_price) AS total_revenue
    FROM sales
    GROUP BY MONTH(sale_date)
)

SELECT *
FROM monthly_sales
ORDER BY sale_month;

-- 65. Display cities where the average property area is above 2000 sq.ft.

WITH city_area AS
(
    SELECT
        location_id,
        AVG(area_sqft) AS average_area
    FROM houses
    GROUP BY location_id
)

SELECT
    l.city,
    ROUND(ca.average_area,2) AS average_area
FROM city_area ca
INNER JOIN locations l
ON ca.location_id = l.location_id
WHERE ca.average_area > 2000
ORDER BY average_area DESC;

-- =========================================================
-- Section 7: Window Functions
-- =========================================================

-- 66. Assign row numbers based on house price

SELECT
    house_id,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_number
FROM houses;

-- 67. Rank houses by price

SELECT
    house_id,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM houses;

-- 68. Assign dense rank based on house price

SELECT
    house_id,
    price,
    DENSE_RANK() OVER (ORDER BY price DESC) AS dense_rank
FROM houses;

-- 69. Display the previous sale price using LAG()

SELECT
    sale_id,
    sale_date,
    sale_price,
    LAG(sale_price) OVER (ORDER BY sale_date) AS previous_sale_price
FROM sales;

-- 70. Display the next sale price using LEAD()

SELECT
    sale_id,
    sale_date,
    sale_price,
    LEAD(sale_price) OVER (ORDER BY sale_date) AS next_sale_price
FROM sales;

-- 71. Display the highest house price in each city

SELECT
    l.city,
    h.house_id,
    h.price,
    FIRST_VALUE(h.price) OVER (
        PARTITION BY l.city
        ORDER BY h.price DESC
    ) AS highest_price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id;

-- 72. Display the lowest house price in each city

SELECT
    l.city,
    h.house_id,
    h.price,
    FIRST_VALUE(h.price) OVER (
        PARTITION BY l.city
        ORDER BY h.price
    ) AS lowest_price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id;

-- 73. Calculate running total of sales revenue

SELECT
    sale_date,
    sale_price,
    SUM(sale_price) OVER (
        ORDER BY sale_date
    ) AS running_total
FROM sales;

-- 74. Calculate moving average of sale prices

SELECT
    sale_date,
    sale_price,
    ROUND(
        AVG(sale_price) OVER (
            ORDER BY sale_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),2
    ) AS moving_average
FROM sales;

-- 75. Rank agents based on total sales revenue

SELECT
    a.agent_name,
    SUM(s.sale_price) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(s.sale_price) DESC
    ) AS revenue_rank
FROM agents a
INNER JOIN sales s
ON a.agent_id = s.agent_id
GROUP BY a.agent_name;

-- =========================================================
-- Section 8: Date & Time Functions
-- =========================================================

-- 76. Display sales made in the year 2024

SELECT
    sale_id,
    sale_date,
    sale_price
FROM sales
WHERE YEAR(sale_date) = 2024;

-- 77. Display monthly sales count

SELECT
    MONTH(sale_date) AS sale_month,
    COUNT(*) AS total_sales
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY sale_month;

-- 78. Display monthly sales revenue

SELECT
    MONTHNAME(sale_date) AS sale_month,
    SUM(sale_price) AS total_revenue
FROM sales
GROUP BY MONTHNAME(sale_date), MONTH(sale_date)
ORDER BY MONTH(sale_date);

-- 79. Display yearly sales revenue

SELECT
    YEAR(sale_date) AS sale_year,
    SUM(sale_price) AS total_revenue
FROM sales
GROUP BY YEAR(sale_date)
ORDER BY sale_year;

-- 80. Display quarterly sales revenue

SELECT
    QUARTER(sale_date) AS quarter,
    SUM(sale_price) AS total_revenue
FROM sales
GROUP BY QUARTER(sale_date)
ORDER BY quarter;

-- 81. Display houses listed each year

SELECT
    YEAR(listing_date) AS listing_year,
    COUNT(*) AS total_houses
FROM houses
GROUP BY YEAR(listing_date)
ORDER BY listing_year;

-- 82. Display houses listed each month

SELECT
    MONTHNAME(listing_date) AS listing_month,
    COUNT(*) AS total_houses
FROM houses
GROUP BY MONTHNAME(listing_date), MONTH(listing_date)
ORDER BY MONTH(listing_date);

-- 83. Display average sale price by year

SELECT
    YEAR(sale_date) AS sale_year,
    ROUND(AVG(sale_price),2) AS average_sale_price
FROM sales
GROUP BY YEAR(sale_date)
ORDER BY sale_year;

-- 84. Display total registrations by year

SELECT
    YEAR(registration_date) AS registration_year,
    COUNT(*) AS total_owners
FROM owners
GROUP BY YEAR(registration_date)
ORDER BY registration_year;

-- 85. Display the latest 10 property sales

SELECT
    sale_id,
    sale_date,
    sale_price
FROM sales
ORDER BY sale_date DESC
LIMIT 10;

-- =========================================================
-- Section 9: Business Insight Queries
-- =========================================================

-- 86. Top 10 most expensive houses

SELECT
    house_id,
    price
FROM houses
ORDER BY price DESC
LIMIT 10;

-- 87. Top 10 cheapest houses

SELECT
    house_id,
    price
FROM houses
ORDER BY price
LIMIT 10;

-- 88. Top 5 cities with the highest average property price

SELECT
    l.city,
    ROUND(AVG(h.price),2) AS average_price
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id
GROUP BY l.city
ORDER BY average_price DESC
LIMIT 5;

-- 89. Builder with the highest total property value

SELECT
    b.builder_name,
    SUM(h.price) AS total_property_value
FROM builders b
INNER JOIN houses h
ON b.builder_id = h.builder_id
GROUP BY b.builder_name
ORDER BY total_property_value DESC
LIMIT 1;

-- 90. Top 5 agents by total sales revenue

SELECT
    a.agent_name,
    SUM(s.sale_price) AS total_revenue
FROM agents a
INNER JOIN sales s
ON a.agent_id = s.agent_id
GROUP BY a.agent_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 91. Cities generating the highest sales revenue

SELECT
    l.city,
    SUM(s.sale_price) AS total_revenue
FROM sales s
INNER JOIN houses h
ON s.house_id = h.house_id
INNER JOIN locations l
ON h.location_id = l.location_id
GROUP BY l.city
ORDER BY total_revenue DESC;

-- 92. Most popular amenities

SELECT
    a.amenity_name,
    COUNT(ha.house_id) AS total_houses
FROM amenities a
INNER JOIN house_amenities ha
ON a.amenity_id = ha.amenity_id
GROUP BY a.amenity_name
ORDER BY total_houses DESC;

-- 93. Owners with multiple properties

SELECT
    o.owner_name,
    COUNT(h.house_id) AS total_properties
FROM owners o
INNER JOIN houses h
ON o.owner_id = h.owner_id
GROUP BY o.owner_name
HAVING COUNT(h.house_id) > 1
ORDER BY total_properties DESC;

-- 94. Average sale price by property type

SELECT
    p.property_type,
    ROUND(AVG(s.sale_price),2) AS average_sale_price
FROM sales s
INNER JOIN houses h
ON s.house_id = h.house_id
INNER JOIN property_types p
ON h.property_type_id = p.property_type_id
GROUP BY p.property_type
ORDER BY average_sale_price DESC;

-- 95. Builders with the highest average property rating

SELECT
    builder_name,
    builder_rating
FROM builders
ORDER BY builder_rating DESC
LIMIT 10;

-- 96. Average property age by city

SELECT
    l.city,
    ROUND(AVG(h.property_age),2) AS average_property_age
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id
GROUP BY l.city
ORDER BY average_property_age DESC;

-- 97. Payment method distribution

SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- 98. Top luxury properties

SELECT
    house_id,
    price,
    area_sqft,
    bedrooms
FROM houses
WHERE price > 15000000
ORDER BY price DESC;

-- 99. Houses sold above the average sale price

SELECT
    sale_id,
    house_id,
    sale_price
FROM sales
WHERE sale_price >
(
    SELECT AVG(sale_price)
    FROM sales
)
ORDER BY sale_price DESC;

-- 100. Executive Summary KPIs

SELECT
    COUNT(DISTINCT house_id) AS total_houses,
    COUNT(DISTINCT owner_id) AS total_owners,
    COUNT(DISTINCT agent_id) AS total_agents,
    ROUND(AVG(sale_price),2) AS average_sale_price,
    SUM(sale_price) AS total_sales_revenue
FROM sales;