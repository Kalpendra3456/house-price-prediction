import pandas as pd
import random

builder_names = [
    "DLF Ltd","Godrej Properties","Prestige Group","Sobha Ltd",
    "Lodha Group","Brigade Group","Hiranandani Group",
    "ATS Infrastructure","Tata Housing","Mahindra Lifespaces",
    "Puravankara","Oberoi Realty","Phoenix Mills","Runwal Group",
    "Rustomjee","Raheja Developers","Kolte Patil","Supertech",
    "Paras Buildtech","Shapoorji Pallonji"
]

cities = ["Delhi","Mumbai","Bangalore","Hyderabad","Pune",
          "Chennai","Noida","Gurgaon","Ahmedabad","Kolkata"]

states = ["Delhi","Maharashtra","Karnataka","Telangana",
          "Tamil Nadu","Uttar Pradesh","Gujarat","West Bengal"]

types = ["Luxury","Premium","Mid-Range"]
specializations = ["Residential","Commercial","Mixed Use","Township"]

data = []

for i in range(1, 51):
    founded = random.randint(1980, 2018)

    data.append({
        "BuilderID": f"B{i:03}",
        "BuilderName": random.choice(builder_names),
        "BuilderType": random.choice(types),
        "FoundedYear": founded,
        "ExperienceYears": 2026 - founded,
        "ProjectsCompleted": random.randint(20, 200),
        "HeadquartersCity": random.choice(cities),
        "State": random.choice(states),
        "BuilderRating": round(random.uniform(3.5, 5.0), 1),
        "TotalUnitsDelivered": random.randint(1000, 50000),
        "Specialization": random.choice(specializations),
        "AverageProjectCost": random.randint(50000000, 500000000),
        "ActiveProjects": random.randint(2, 30),
        "EmployeeCount": random.randint(100, 10000)
    })

df = pd.DataFrame(data)

df.to_csv("Builders.csv", index=False)

print("Builders.csv created successfully with 50 rows and 14 columns")