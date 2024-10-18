import csv
import sys

def levenshtein_distance(s1, s2):
    """Calculates the Levenshtein distance between two strings."""
    if len(s1) < len(s2):
        return levenshtein_distance(s2, s1)

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
    Returns True if the name is 'quercus' or close enough within the max Levenshtein distance.

    Args:
        name (str): The genus name to be checked.
        max_distance (int): Maximum allowed edit distance (default is 2).

    Returns:
        bool: True if the name is 'quercus' or a close match, False otherwise.

    >>> is_an_oak('Quercus')
    True
    >>> is_an_oak('quercuss')
    True
    >>> is_an_oak('Quercas')
    True
    >>> is_an_oak('Fagus')
    False
    """
    return levenshtein_distance(name.lower(), 'quercus') <= max_distance

def main(argv): 
    with open('../data/TestOaksData.csv', 'r') as f, open('../results/JustOaksData.csv', 'w', newline='') as g:
        taxa = csv.reader(f)
        csvwrite = csv.writer(g)

        # Write the header row to the output file
        csvwrite.writerow(["Genus", "species"])

        # Skip the header row in the input file
        next(taxa, None)

        # Process the remaining rows
        for row in taxa:
            print(row)
            print("The genus is:")
            print(row[0] + '\n')
            if is_an_oak(row[0]):
                print('FOUND AN OAK!\n')
                csvwrite.writerow([row[0], row[1]])

    return 0

if __name__ == "__main__":
    status = main(sys.argv)
