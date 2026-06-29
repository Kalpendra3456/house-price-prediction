import pandas as pd
import random

amenities = [
    "Swimming Pool", "Gym", "Club House", "Children Play Area",
    "Jogging Track", "Garden", "Tennis Court", "Basketball Court",
    "Badminton Court", "Cricket Ground", "Library", "Spa",
    "Yoga Center", "Indoor Games", "Party Hall", "Amphitheater",
    "Power Backup", "24x7 Security", "CCTV Surveillance", "Lift",
    "Visitor Parking", "Covered Parking", "EV Charging Station",
    "WiFi", "Mini Theatre", "Shopping Complex", "ATM",
    "Medical Center", "Pet Park", "Business Center",
    "Conference Room", "Rooftop Lounge", "Sky Deck",
    "Rainwater Harvesting", "Solar Power", "Fire Safety",
    "Intercom", "Gated Community", "Banquet Hall", "Food Court"
]

categories = [
    "Sports", "Security", "Recreation",
    "Utility", "Lifestyle", "Green"
]

data = []

for i, amenity in enumerate(amenities, start=1):
    data.append({
        "AmenityID": f"A{i:03}",
        "AmenityName": amenity,
        "Category": random.choice(categories),
        "MonthlyMaintenanceCost": random.randint(100, 5000),
        "InstallationCost": random.randint(50000, 5000000),
        "PopularityScore": round(random.uniform(3.0, 5.0), 1),
        "IndoorOutdoor": random.choice(["Indoor", "Outdoor"]),
        "PremiumAmenity": random.choice(["Yes", "No"]),
        "UsageLevel": random.choice(["Low", "Medium", "High"]),
        "Status": "Available"
    })

df = pd.DataFrame(data)

df.to_csv("Amenities.csv", index=False)

print("Amenities.csv created successfully!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")