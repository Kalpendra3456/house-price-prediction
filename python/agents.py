import pandas as pd
import random
from faker import Faker

fake = Faker("en_IN")

cities = [
    "Mumbai", "Delhi", "Bangalore", "Hyderabad",
    "Pune", "Chennai", "Kolkata", "Noida",
    "Gurgaon", "Ahmedabad"
]

data = []

for i in range(1, 201):
    experience = random.randint(1, 20)

    data.append({
        "AgentID": f"A{i:03}",
        "AgentName": fake.name(),
        "Gender": random.choice(["Male", "Female"]),
        "Age": random.randint(23, 60),
        "ExperienceYears": experience,
        "Rating": round(random.uniform(3.5, 5.0), 1),
        "CommissionPercent": round(random.uniform(1.0, 5.0), 2),
        "PropertiesSold": random.randint(10, 500),
        "City": random.choice(cities),
        "PhoneNumber": fake.msisdn()[:10],
        "Email": fake.email(),
        "JoiningDate": fake.date_between(
            start_date="-15y",
            end_date="today"
        )
    })

df = pd.DataFrame(data)

df.to_csv("Agents.csv", index=False)

print("Agents.csv created successfully!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")