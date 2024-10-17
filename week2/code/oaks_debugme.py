import csv
import sys
def is_an_oak(name):
    """ Returns True if name is exactly with 'quercus' """
    return name.lower() =='quercus'

def main(argv):
    with open('../data/TestOaksData.csv', 'r') as f, open('../results/JustOaksData.csv', 'w', newline='') as g:
        taxa = csv.reader(f)
        csvwrite = csv.writer(g)
        csvwrite.writerow(["Genus", "species"])

        next(taxa)
        for row in taxa:
            print(row)
            print("The genus is:")
            print(row[0] + '\n')
            if is_an_oak(row[0]):
                print('FOUND AN OAK!\n')
                csvwrite.writerow([row[0], row[1]])  

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)