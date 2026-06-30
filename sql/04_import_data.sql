-- =========================================================
-- House Price Prediction Database
-- File: 04_import_data.sql
-- Description: Documents the data import process
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- Data Import Method
-- =========================================================
-- All CSV files were imported using
-- MySQL Workbench - Table Data Import Wizard.

-- =========================================================
-- Import Sequence
-- =========================================================
-- 1. locations.csv
-- 2. builders.csv
-- 3. property_types.csv
-- 4. owners.csv
-- 5. agents.csv
-- 6. amenities.csv
-- 7. houses.csv
-- 8. house_amenities.csv
-- 9. sales.csv

-- =========================================================
-- Notes
-- =========================================================
-- • The first row of each CSV file contains column headers.
-- • Each CSV file was mapped to its corresponding database table.
-- • Parent tables were imported before child tables to satisfy
--   foreign key constraints.
-- • Data import completed successfully using the MySQL Workbench
--   Table Data Import Wizard.