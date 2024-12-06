"""
This script demonstrates the use of FOR and WHILE loops in Python.
It includes examples of iterating over a range, a list, and summing elements,
as well as using a WHILE loop for incremental operations.
"""


# Iterating over a range of numbers from 0 to 4
for i in range(5):
    print(i) 

# Iterating over a list containing mixed data types
my_list = [0, 2, "geronimo!", 3.0, True, False]
for k in my_list:
    print(k) 

# Calculating the cumulative sum of a list of numbers
total = 0  # Initialize total sum
summands = [0, 1, 11, 111, 1111]  # List of numbers to sum
for s in summands:
    total = total + s  # Add each element to the total
    print(total) 


# Incrementing a variable until it reaches 100
z = 0  # Initialize the counter
while z < 100:
    z = z + 1  # Increment by 1
    print(z)  # Prints the current value of z
