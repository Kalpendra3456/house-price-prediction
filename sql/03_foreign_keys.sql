-- =========================================================
-- House Price Prediction Database
-- File: 03_foreign_keys.sql
-- Description: Creates foreign key relationships between project tables
-- Author: Kalpendra Yadav
-- =========================================================

USE house_price_db;

-- =========================================================
-- Foreign Keys: houses
-- =========================================================

ALTER TABLE houses
ADD CONSTRAINT fk_houses_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id);

ALTER TABLE houses
ADD CONSTRAINT fk_houses_builders
FOREIGN KEY (builder_id)
REFERENCES builders(builder_id);

ALTER TABLE houses
ADD CONSTRAINT fk_houses_property_types
FOREIGN KEY (property_type_id)
REFERENCES property_types(property_type_id);

ALTER TABLE houses
ADD CONSTRAINT fk_houses_owners
FOREIGN KEY (owner_id)
REFERENCES owners(owner_id);

-- =========================================================
-- Foreign Keys: sales
-- =========================================================

ALTER TABLE sales
ADD CONSTRAINT fk_sales_houses
FOREIGN KEY (house_id)
REFERENCES houses(house_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_owners
FOREIGN KEY (owner_id)
REFERENCES owners(owner_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_agents
FOREIGN KEY (agent_id)
REFERENCES agents(agent_id);

-- =========================================================
-- Foreign Keys: house_amenities
-- =========================================================

ALTER TABLE house_amenities
ADD CONSTRAINT fk_house_amenities_houses
FOREIGN KEY (house_id)
REFERENCES houses(house_id);

ALTER TABLE house_amenities
ADD CONSTRAINT fk_house_amenities_amenities
FOREIGN KEY (amenity_id)
REFERENCES amenities(amenity_id);


| Child Table     | Foreign Key      | Parent Table   |
| --------------- | ---------------- | -------------- |
| houses          | location_id      | locations      |
| houses          | builder_id       | builders       |
| houses          | property_type_id | property_types |
| houses          | owner_id         | owners         |
| sales           | house_id         | houses         |
| sales           | owner_id         | owners         |
| sales           | agent_id         | agents         |
| house_amenities | house_id         | houses         |
| house_amenities | amenity_id       | amenities      |
