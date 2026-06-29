import pandas as pd
import random

property_types = [
    "Apartment", "Villa", "Independent House", "Penthouse",
    "Studio Apartment", "Duplex", "Row House", "Farm House",
    "Builder Floor", "Residential Plot", "Commercial Office",
    "Retail Shop", "Warehouse", "Industrial Unit",
    "Co-working Space", "Luxury Villa", "Service Apartment",
    "Townhouse", "Condominium", "Mixed Use Property"
]

categories = ["Residential", "Commercial", "Industrial"]
furnishing = ["Unfurnished", "Semi-Furnished", "Fully Furnished"]
construction = ["RCC", "Brick", "Steel Frame", "Precast"]
demand = ["Low", "Medium", "High", "Very High"]

data = []

for i in range(1, 21):
    min_area = random.randint(400, 2000)

    data.append({
        "PropertyTypeID": f"PT{i:03}",
        "PropertyType": property_types[i-1],
        "Category": random.choice(categories),
        "MinAreaSqFt": min_area,
        "MaxAreaSqFt": min_area + random.randint(500, 5000),
        "Bedrooms": random.randint(1, 6),
        "Bathrooms": random.randint(1, 5),
        "ParkingSpaces": random.randint(0, 4),
        "FurnishingStatus": random.choice(furnishing),
        "ConstructionType": random.choice(construction),
        "AveragePricePerSqFt": random.randint(2500, 25000),
        "MaintenanceCost": random.randint(1000, 15000),
        "DemandLevel": random.choice(demand),
        "RentalYieldPercent": round(random.uniform(2.0, 8.5), 1)
    })

df = pd.DataFrame(data)

df.to_csv("PropertyTypes.csv", index=False)

print("PropertyTypes.csv created successfully!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")