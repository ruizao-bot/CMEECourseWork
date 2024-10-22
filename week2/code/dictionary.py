"""
This script demonstrates two methods for creating this dictionary:
1. Using a loop to build the dictionary step by step.
2. Using a dictionary comprehension to achieve the same result.

"""

# List of taxa with species and their corresponding orders
taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.

# Initialize an empty dictionary
taxa_dic = {}

# Loop through the taxa and make a dictionary
for species, order in taxa:
    if order not in taxa_dic:
        taxa_dic[order] = set()
    taxa_dic[order].add(species)

# Print
for order, species in taxa_dic.items():
    print(f"'{order}': {species}")

# A list comprehension that does the same (including the printing after the dictionary has been created)  
taxa_dic = {order: {species for species, o in taxa if o == order} for species, order in taxa}

# Print
for order, species in taxa_dic.items():
    print(f"'{order}': {species}")