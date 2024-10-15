import csv
import sys

def levenshtein_distance(s1, s2):
    """
    Calculates the Levenshtein distance between two strings.

    Args:
        s1 (str): The first string.
        s2 (str): The second string.

    Returns:
        int: The Levenshtein distance between the two strings.

    >>> levenshtein_distance('quercus', 'quercuss')
    1
    >>> levenshtein_distance('quercus', 'Quercas')
    2
    >>> levenshtein_distance('quercus', 'Fagus')
    6
    """
    if len(s1) < len(s2):
        s1, s2 = s2, s1

    previous_row = range(len(s2) + 1)
    for i, c1 in enumerate(s1):
        current_row = [i + 1]
        for j, c2 in enumerate(s2):
            insertions = previous_row[j + 1] + 1
            deletions = current_row[j] + 1
            substitutions = previous_row[j] + (c1 != c2)
            current_row.append(min(insertions, deletions, substitutions))
        previous_row = current_row

    return previous_row[-1]

def is_an_oak(name, max_distance=2):
    """
    Returns True if the name is similar enough to 'quercus'.

    Args:
        name (str): The genus name to be checked.
        max_distance (int): The maximum allowable Levenshtein distance.

    Returns:
        bool: True if the name is 'quercus' or a close match, False otherwise.

    >>> is_an_oak('quercus')
    True
    >>> is_an_oak('quercuss')
    True
    >>> is_an_oak('quercas')
    True
    >>> is_an_oak('fagus')
    False
    """
    return levenshtein_distance(name.lower(), 'quercus') <= max_distance

def main(argv):
    with open('../data/TestOaksData1.csv', 'r') as f, open('../results/JustOaksData.csv', 'w', newline='') as g:
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