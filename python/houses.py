# import pandas as pd
# import numpy as np
# import random
# from datetime import datetime, timedelta

# # Number of records
# NUM_ROWS = 10000

# # Lookup values
# locations = [f"L{i:03d}" for i in range(1, 101)]
# builders = [f"B{i:03d}" for i in range(1, 51)]
# property_types = [f"PT{i:03d}" for i in range(1, 11)]

# furnishing_status = [
#     "Furnished",
#     "Semi-Furnished",
#     "Unfurnished"
# ]

# facing_directions = [
#     "North",
#     "South",
#     "East",
#     "West",
#     "North-East",
#     "North-West",
#     "South-East",
#     "South-West"
# ]

# sale_status = [
#     "Available",
#     "Sold",
#     "Reserved"
# ]

# rows = []

# for i in range(1, NUM_ROWS + 1):

#     area = random.randint(600, 5000)

#     bedrooms = min(max(area // 600, 1), 6)

#     bathrooms = random.randint(
#         max(1, bedrooms - 1),
#         min(5, bedrooms + 1)
#     )

#     age = random.randint(0, 20)

#     build_year = 2025 - age

#     base_price = area * random.randint(4500, 15000)

#     bedroom_bonus = bedrooms * 300000
#     bathroom_bonus = bathrooms * 150000

#     final_price = (
#         base_price +
#         bedroom_bonus +
#         bathroom_bonus +
#         random.randint(-500000, 500000)
#     )

#     listing_date = (
#         datetime(2024, 1, 1)
#         + timedelta(days=random.randint(0, 730))
#     )

#     rows.append([
#         f"H{i:05d}",
#         random.choice(locations),
#         random.choice(builders),
#         random.choice(property_types),
#         listing_date.strftime("%Y-%m-%d"),
#         area,
#         bedrooms,
#         bathrooms,
#         random.randint(1, 4),          # BalconyCount
#         random.randint(0, 4),          # ParkingSpaces
#         random.randint(0, 35),         # FloorNumber
#         random.randint(1, 40),         # TotalFloors
#         random.choice(furnishing_status),
#         age,
#         random.choice(facing_directions),
#         int(final_price),
#         random.choice(sale_status)
#     ])

# columns = [
#     "HouseID",
#     "LocationID",
#     "BuilderID",
#     "PropertyTypeID",
#     "ListingDate",
#     "AreaSqFt",
#     "Bedrooms",
#     "Bathrooms",
#     "BalconyCount",
#     "ParkingSpaces",
#     "FloorNumber",
#     "TotalFloors",
#     "FurnishingStatus",
#     "PropertyAge",
#     "FacingDirection",
#     "Price",
#     "SaleStatus"
# ]

# df = pd.DataFrame(rows, columns=columns)

# df.to_csv("Houses.csv", index=False)

# print("Houses.csv created successfully with 10,000 rows")       

import pandas as pd
import random

cities = [
    ("Bangalore", "Karnataka"),
    ("Mumbai", "Maharashtra"),
    ("Delhi", "Delhi"),
    ("Hyderabad", "Telangana"),
    ("Pune", "Maharashtra"),
    ("Chennai", "Tamil Nadu"),
    ("Noida", "Uttar Pradesh"),
    ("Gurugram", "Haryana"),
    ("Kolkata", "West Bengal"),
    ("Ahmedabad", "Gujarat")
]

areas = [
    "Whitefield", "Electronic City", "Hinjewadi", "Powai",
    "Dwarka", "Rohini", "Cyber City", "Gachibowli",
    "Hitech City", "New Town", "Sector 62", "OMR",
    "Velachery", "Wakad", "Andheri"
]

records = []

for location_id in range(1, 101):
    city, state = random.choice(cities)

    records.append({
        "location_id": location_id,
        "city": city,
        "area": random.choice(areas),
        "state": state,
        "pincode": random.randint(100000, 999999),
        "metro_distance_km": round(random.uniform(1, 25), 1),
        "school_rating": random.randint(5, 10),
        "hospital_rating": random.randint(5, 10),
        "crime_index": round(random.uniform(1, 10), 1),
        "air_quality_index": random.randint(30, 200),
        "employment_score": random.randint(50, 100),
        "public_transport_score": random.randint(50, 100),
        "location_tier": random.choice(["A", "B", "C"])
    })

df = pd.DataFrame(records)

df.to_csv("data/locations.csv", index=False)
print("Professional locations.csv created successfully!")