
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

df.to_csv("locations.csv", index=False)
print("Professional locations.csv created successfully!")