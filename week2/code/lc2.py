"""
This script analyzes the average UK rainfall (in mm) for the year 1910 by month.

It performs the following tasks:
1. Uses a list comprehension to create a list of tuples (month, rainfall)
   where the rainfall was greater than 100 mm.
2. Uses a list comprehension to create a list of month names where the rainfall
   was less than 50 mm.
3. Re-implements tasks (1) and (2) using conventional loops for comparison.
"""
# Average UK Rainfall (mm) for 1910 by month
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
greater_than_100mm = [(month, amount) for month, amount in rainfall if amount > 100]
print(greater_than_100mm)
 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 
less_than_50mm = [(month, amount) for month, amount in rainfall if amount < 50]
print(less_than_50mm)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
greater_than_100mm = []
for month, amount in rainfall:
    if amount > 100:
        greater_than_100mm.append((month, amount))
print(greater_than_100mm)

# Step #2:
# Months and rainfall values when the amount of rain was less than 50mm:
less_than_50mm = []
for month, amount in rainfall:
    if amount < 50:
        less_than_50mm.append((month, amount))
print(less_than_50mm)
