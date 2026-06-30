-- =========================================================
-- House Price Prediction Database
-- File: 07_views.sql
-- Description: Creates reusable SQL views for reporting
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- View: House Details
-- Description: Displays complete information about each house
-- =========================================================

CREATE VIEW vw_house_details AS

SELECT
    h.house_id,
    l.city,
    l.area,
    b.builder_name,
    p.property_type,
    o.owner_name,
    h.area_sqft,
    h.bedrooms,
    h.bathrooms,
    h.price,
    h.sale_status
FROM houses h
INNER JOIN locations l
ON h.location_id = l.location_id
INNER JOIN builders b
ON h.builder_id = b.builder_id
INNER JOIN property_types p
ON h.property_type_id = p.property_type_id
INNER JOIN owners o
ON h.owner_id = o.owner_id;

-- =========================================================
-- View: Sales Details
-- Description: Displays complete sales transaction details
-- =========================================================

CREATE VIEW vw_sales_details AS

SELECT
    s.sale_id,
    h.house_id,
    o.owner_name,
    a.agent_name,
    s.sale_date,
    s.sale_price,
    s.payment_method,
    s.loan_amount,
    s.down_payment,
    s.sale_status
FROM sales s
INNER JOIN houses h
ON s.house_id = h.house_id
INNER JOIN owners o
ON s.owner_id = o.owner_id
INNER JOIN agents a
ON s.agent_id = a.agent_id;

-- =========================================================
-- View: Builder Performance
-- Description: Displays builder performance summary
-- =========================================================

CREATE VIEW vw_builder_performance AS

SELECT
    b.builder_name,
    COUNT(h.house_id) AS total_houses,
    ROUND(AVG(h.price), 2) AS average_house_price,
    SUM(h.price) AS total_property_value,
    MAX(h.price) AS highest_priced_house,
    MIN(h.price) AS lowest_priced_house
FROM builders b
INNER JOIN houses h
ON b.builder_id = h.builder_id
GROUP BY b.builder_name;


| View                     | Purpose                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------- |
| `vw_house_details`       | Shows complete property information by joining houses, locations, builders, property types, and owners. |
| `vw_sales_details`       | Provides a ready-to-use sales report with house, owner, and agent information.                          |
| `vw_builder_performance` | Summarizes builder performance with house counts and pricing metrics.                                   |

