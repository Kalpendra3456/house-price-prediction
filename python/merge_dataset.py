import pandas as pd

houses = pd.read_csv("../data/Houses.csv")
locations = pd.read_csv("../data/Locations.csv")
builders = pd.read_csv("../data/Builders.csv")
owners = pd.read_csv("../data/Owners.csv")
property_types = pd.read_csv("../data/PropertyTypes.csv")

df = houses.merge(locations, on="LocationID", how="left")
df = df.merge(builders, on="BuilderID", how="left")
df = df.merge(owners, on="OwnerID", how="left")
df = df.merge(property_types, on="PropertyTypeID", how="left")

df.to_csv("../outputs/merged_house_data.csv", index=False)

print("Merged dataset created successfully!")
print(df.shape)