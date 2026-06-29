import pandas as pd
import random
from datetime import datetime, timedelta

num_sales = 15000

payment_methods = [
    "Cash", "Bank Transfer", "Home Loan",
    "Mortgage", "UPI"
]

sale_statuses = [
    "Completed",
    "Pending",
    "Cancelled"
]

data = []

start_date = datetime(2020, 1, 1)

for i in range(1, num_sales + 1):

    sale_price = random.randint(2500000, 50000000)
    loan_amount = random.randint(
        int(sale_price * 0.3),
        int(sale_price * 0.8)
    )

    down_payment = sale_price - loan_amount

    data.append({
        "SaleID": f"S{i:06}",
        "HouseID": f"H{random.randint(1,10000):05}",
        "OwnerID": f"O{random.randint(1,2000):05}",
        "SaleDate": (
            start_date +
            timedelta(days=random.randint(0, 2200))
        ).strftime("%Y-%m-%d"),
        "SalePrice": sale_price,
        "PaymentMethod": random.choice(payment_methods),
        "LoanAmount": loan_amount,
        "DownPayment": down_payment,
        "InterestRate": round(random.uniform(6.5, 12.0), 2),
        "LoanTermYears": random.choice([10, 15, 20, 25, 30]),
        "AgentID": f"A{random.randint(1,200):03}",
        "RegistrationFee": round(sale_price * 0.01),
        "TaxAmount": round(sale_price * 0.05),
        "DiscountAmount": random.randint(0, 500000),
        "SaleStatus": random.choice(sale_statuses)
    })

df = pd.DataFrame(data)

df.to_csv("Sales.csv", index=False)

print("Sales.csv created successfully!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")