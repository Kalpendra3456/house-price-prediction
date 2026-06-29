import pandas as pd
import random
from faker import Faker

fake = Faker("en_IN")

occupations = [
    "Engineer", "Doctor", "Teacher", "Business Owner",
    "Data Analyst", "Manager", "Architect",
    "Consultant", "Lawyer", "Government Employee"
]

ownership_types = [
    "Individual",
    "Joint Ownership",
    "Family Ownership"
]

data = []

for i in range(1, 2001):
    data.append({
        "OwnerID": f"O{i:05}",
        "OwnerName": fake.name(),
        "Gender": random.choice(["Male", "Female"]),
        "Age": random.randint(25, 70),
        "Occupation": random.choice(occupations),
        "AnnualIncome": random.randint(300000, 5000000),
        "MaritalStatus": random.choice(["Single", "Married"]),
        "City": fake.city(),
        "State": fake.state(),
        "Email": fake.email(),
        "PhoneNumber": fake.msisdn()[:10],
        "CreditScore": random.randint(600, 900),
        "OwnershipType": random.choice(ownership_types),
        "RegistrationDate": fake.date_between(
            start_date="-10y",
            end_date="today"
        )
    })

df = pd.DataFrame(data)

df.to_csv("Owners.csv", index=False)

print("Owners.csv created successfully with 2000 rows")