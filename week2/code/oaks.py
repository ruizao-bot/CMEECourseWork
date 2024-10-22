"""
This module demonstrates how to identify and extract oak species (genus Quercus) from a list of taxa.
It provides two methods for identifying and manipulating oak species:
1. Using standard `for` loops.
2. Using list comprehensions.

"""

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
       ]

def is_an_oak(name):

    """
    Determines whether the given species name is an oak (genus Quercus).

    Parameters:
    name (str): The species name to check.

    Returns:
    bool: True if the species belongs to the genus Quercus, False otherwise.
    """

    return name.lower().startswith('quercus ')

##Using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

##Using list comprehensions   
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

##Get names in UPPER CASE using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

##Get names in UPPER CASE using list comprehensions
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)