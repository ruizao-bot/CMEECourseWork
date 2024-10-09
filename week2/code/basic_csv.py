import csv
wtih open('../data/testcsv.csv','r') as f:

csvread = csv.reader(f)
temp = []
for row in csvread:
    temp.append(tuple(row))
    print(row)
    print("The species is", row[0])

wtih open('../data/testcsv.csv','r') as f:
    with open('../data/testcsv.csv','w') as g:
    