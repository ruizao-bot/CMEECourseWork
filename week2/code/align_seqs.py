import sys
import os


with open('../data/DNAtest.csv' ) as f:
    lines = f.readlines()
    seq1 = lines[0].strip() 
    seq2 = lines[1].strip()  

    l1 = len(seq1)
    l2 = len(seq2)
    if l1 >= l2:
        s1 = seq1
        s2 = seq2
    else:
        s1 = seq2
        s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

 
# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint):
    matched = "" # to hold string displaying alignements
    score = 0

    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)           
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score
def find_best_alignment(seq1, seq2):
    """Find the best alignment and score for two sequences."""
    l1, l2 = len(seq1), len(seq2)
    if l1 >= l2:
        s1, s2 = seq1, seq2
    else:
        s1, s2 = seq2, seq1
        l1, l2 = l2, l1  # Swap lengths
    # n now try to find the best match (highest score) for the two sequences

    my_best_align = None
    my_best_score = -1

    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > my_best_score:
            my_best_align = "." * i + s2 # think about what this is doing!
            my_best_score = z 

    return my_best_align, s1, my_best_score
# Save the results to the file
def save_alignment_to_file(output_file, alignment, s1, score):
    """Save the best alignment and score to a text file."""
    output_path = os.path.join('..', 'results', output_file)

    try:
        with open(output_path, 'w') as f:
            f.write(f"Best Alignment:\n{alignment}\n{s1}\n\n")
            f.write(f"Best Score: {score}\n")
        print(f"Results saved to: {output_path}")
    except Exception as e:
        print(f"Error: Could not save the alignment to '{output_path}'. {e}")
        sys.exit(1)

def main():
    input_file = "input_sequences.csv"  # Input file with two sequences
    output_file = "alignment_result.csv"  # Output file for the alignment

    # Find the best alignment and score
    best_alignment, s1, best_score = find_best_alignment(seq1, seq2)

    # Save the alignment and score to the output file
    save_alignment_to_file(output_file, best_alignment, s1, best_score)

    print(f"Alignment complete! Results saved to '{output_file}'.")

if __name__ == "__main__":
    main()