-- =========================================================
-- House Price Prediction Database
-- File: 05_data_validation.sql
-- Description: Validates imported data and database integrity
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- Verify Current Database
-- =========================================================

SELECT DATABASE();

-- =========================================================
-- Display All Tables
-- =========================================================

SHOW TABLES;

-- =========================================================
-- Verify Table Structures
-- =========================================================

DESCRIBE locations;
DESCRIBE builders;
DESCRIBE property_types;
DESCRIBE owners;
DESCRIBE agents;
DESCRIBE amenities;
DESCRIBE houses;
DESCRIBE house_amenities;
DESCRIBE sales;

-- =========================================================
-- Verify Total Records
-- =========================================================

SELECT COUNT(*) AS total_locations FROM locations;
SELECT COUNT(*) AS total_builders FROM builders;
SELECT COUNT(*) AS total_property_types FROM property_types;
SELECT COUNT(*) AS total_owners FROM owners;
SELECT COUNT(*) AS total_agents FROM agents;
SELECT COUNT(*) AS total_amenities FROM amenities;
SELECT COUNT(*) AS total_houses FROM houses;
SELECT COUNT(*) AS total_house_amenities FROM house_amenities;
SELECT COUNT(*) AS total_sales FROM sales;

-- =========================================================
-- Preview Sample Records
-- =========================================================

SELECT * FROM locations LIMIT 5;
SELECT * FROM builders LIMIT 5;
SELECT * FROM property_types LIMIT 5;
SELECT * FROM owners LIMIT 5;
SELECT * FROM agents LIMIT 5;
SELECT * FROM amenities LIMIT 5;
SELECT * FROM houses LIMIT 5;
SELECT * FROM house_amenities LIMIT 5;
SELECT * FROM sales LIMIT 5;

-- =========================================================
-- Check for Duplicate Primary Keys
-- =========================================================

SELECT location_id, COUNT(*)
FROM locations
GROUP BY location_id
HAVING COUNT(*) > 1;

SELECT builder_id, COUNT(*)
FROM builders
GROUP BY builder_id
HAVING COUNT(*) > 1;

SELECT property_type_id, COUNT(*)
FROM property_types
GROUP BY property_type_id
HAVING COUNT(*) > 1;

SELECT owner_id, COUNT(*)
FROM owners
GROUP BY owner_id
HAVING COUNT(*) > 1;

SELECT agent_id, COUNT(*)
FROM agents
GROUP BY agent_id
HAVING COUNT(*) > 1;

SELECT amenity_id, COUNT(*)
FROM amenities
GROUP BY amenity_id
HAVING COUNT(*) > 1;

SELECT house_id, COUNT(*)
FROM houses
GROUP BY house_id
HAVING COUNT(*) > 1;

SELECT sale_id, COUNT(*)
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1;

-- =========================================================
-- Check for NULL Values
-- =========================================================

SELECT *
FROM houses
WHERE location_id IS NULL
   OR builder_id IS NULL
   OR property_type_id IS NULL
   OR owner_id IS NULL;

SELECT *
FROM sales
WHERE house_id IS NULL
   OR owner_id IS NULL
   OR agent_id IS NULL;

-- =========================================================
-- Validate Foreign Key Relationships
-- =========================================================

-- Houses → Locations

SELECT *
FROM houses h
LEFT JOIN locations l
ON h.location_id = l.location_id
WHERE l.location_id IS NULL;

-- Houses → Builders

SELECT *
FROM houses h
LEFT JOIN builders b
ON h.builder_id = b.builder_id
WHERE b.builder_id IS NULL;

-- Houses → Property Types

SELECT *
FROM houses h
LEFT JOIN property_types p
ON h.property_type_id = p.property_type_id
WHERE p.property_type_id IS NULL;

-- Houses → Owners

SELECT *
FROM houses h
LEFT JOIN owners o
ON h.owner_id = o.owner_id
WHERE o.owner_id IS NULL;

-- Sales → Houses

SELECT *
FROM sales s
LEFT JOIN houses h
ON s.house_id = h.house_id
WHERE h.house_id IS NULL;

-- Sales → Owners

SELECT *
FROM sales s
LEFT JOIN owners o
ON s.owner_id = o.owner_id
WHERE o.owner_id IS NULL;

-- Sales → Agents

SELECT *
FROM sales s
LEFT JOIN agents a
ON s.agent_id = a.agent_id
WHERE a.agent_id IS NULL;

-- House Amenities → Houses

SELECT *
FROM house_amenities ha
LEFT JOIN houses h
ON ha.house_id = h.house_id
WHERE h.house_id IS NULL;

-- House Amenities → Amenities

SELECT *
FROM house_amenities ha
LEFT JOIN amenities a
ON ha.amenity_id = a.amenity_id
WHERE a.amenity_id IS NULL;

-- =========================================================
-- Data Validation Completed Successfully
-- =========================================================