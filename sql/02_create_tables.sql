-- =========================================================
-- House Price Prediction Database
-- File: 02_create_tables.sql
-- Description: Creates all tables required for the project
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- Table: locations
-- Description: Stores location information for each property
-- =========================================================

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(100),
    area VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    metro_distance_km DECIMAL(5,2),
    school_rating INT,
    hospital_rating INT,
    crime_index DECIMAL(5,2),
    air_quality_index INT,
    employment_score INT,
    public_transport_score INT,
    location_tier VARCHAR(10)
);

-- =========================================================
-- Table: builders
-- Description: Stores builder company details
-- =========================================================

CREATE TABLE builders (
    builder_id INT PRIMARY KEY,
    builder_name VARCHAR(100),
    builder_type VARCHAR(50),
    founded_year INT,
    experience_years INT,
    projects_completed INT,
    headquarters_city VARCHAR(100),
    state VARCHAR(100),
    builder_rating DECIMAL(3,2),
    total_units_delivered INT,
    specialization VARCHAR(100),
    average_project_cost DECIMAL(15,2),
    active_projects INT,
    employee_count INT
);

-- =========================================================
-- Table: owners
-- Description: Stores property owner information
-- =========================================================

CREATE TABLE owners (
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    occupation VARCHAR(100),
    annual_income DECIMAL(15,2),
    marital_status VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    credit_score INT,
    ownership_type VARCHAR(50),
    registration_date DATE
);

-- =========================================================
-- Table: property_types
-- Description: Stores different property categories
-- =========================================================

CREATE TABLE property_types (
    property_type_id INT PRIMARY KEY,
    property_type VARCHAR(50),
    category VARCHAR(50),
    min_area_sqft INT,
    max_area_sqft INT,
    bedrooms INT,
    bathrooms INT,
    parking_spaces INT,
    furnishing_status VARCHAR(50),
    construction_type VARCHAR(50),
    average_price_per_sqft DECIMAL(10,2),
    maintenance_cost DECIMAL(12,2),
    demand_level VARCHAR(20),
    rental_yield_percent DECIMAL(5,2)
);

-- =========================================================
-- Table: amenities
-- Description: Stores amenities available for properties
-- =========================================================

CREATE TABLE amenities (
    amenity_id INT PRIMARY KEY,
    amenity_name VARCHAR(100),
    category VARCHAR(50),
    monthly_maintenance_cost DECIMAL(10,2),
    installation_cost DECIMAL(15,2),
    popularity_score DECIMAL(5,2),
    indoor_outdoor VARCHAR(20),
    premium_amenity BOOLEAN,
    usage_level VARCHAR(20),
    status VARCHAR(20)
);

-- =========================================================
-- Table: agents
-- Description: Stores real estate agent information
-- =========================================================

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    experience_years INT,
    rating DECIMAL(3,2),
    commission_percent DECIMAL(5,2),
    properties_sold INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    joining_date DATE
);

-- =========================================================
-- Table: houses
-- Description: Stores property listing details
-- =========================================================

CREATE TABLE houses (
    house_id INT PRIMARY KEY,
    location_id INT,
    builder_id INT,
    property_type_id INT,
    listing_date DATE,
    area_sqft INT,
    bedrooms INT,
    bathrooms INT,
    balcony_count INT,
    parking_spaces INT,
    floor_number INT,
    total_floors INT,
    furnishing_status VARCHAR(50),
    property_age INT,
    facing_direction VARCHAR(20),
    price DECIMAL(15,2),
    sale_status VARCHAR(50)
);

-- =========================================================
-- Table: sales
-- Description: Stores house sales transactions
-- =========================================================

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    house_id INT,
    owner_id INT,
    agent_id INT,
    sale_date DATE,
    sale_price DECIMAL(15,2),
    payment_method VARCHAR(50),
    loan_amount DECIMAL(15,2),
    down_payment DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    loan_term_years INT,
    registration_fee DECIMAL(12,2),
    tax_amount DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    sale_status VARCHAR(30)
);