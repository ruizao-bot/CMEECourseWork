import csv

"""
This script demonstrates how to read from a CSV file and write to another CSV file using the `csv` module.

The script performs the following tasks:
1. Reads the contents of a CSV file and stores each row as a tuple in a list.
2. Prints each row and a specific species from the first column.
3. Reads the CSV file again and writes specific columns to a new CSV file.
"""

with open('../data/testcsv.csv','r') as f:

    csvread = csv.reader(f)
    temp = []
    for row in csvread:
        temp.append(tuple(row))
        print(row)
        print("The species is", row[0])

with open('../data/testcsv.csv','r') as f:
    with open('../data/testcsv.csv','w') as g:
        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow[row[0], row[4]]