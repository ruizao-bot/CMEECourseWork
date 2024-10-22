import sys
import os

def read_fasta_file(file_path):
    """Read a single sequence from a FASTA file."""
    try:
        with open(file_path) as f:
            lines = f.readlines()
            sequence = "".join(line.strip() for line in lines if not line.startswith('>'))
        return sequence
    except FileNotFoundError:
        print(f"Error: '{file_path}' not found.")
        sys.exit(1)


def calculate_score(s1, s2, l1, l2, startpoint):
    """Compute alignment score starting from a given startpoint."""
    matched = ""  # To display the alignment
    score = 0

    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]:  # Match found
                matched += "*"
                score += 1
            else:
                matched += "-"

    # Display formatted alignment
    print("." * startpoint + matched)
    print("." * startpoint + s2)
    print(s1)
    print(f"Score: {score}\n")

    return score

def find_best_alignment(seq1, seq2):
    """Find the alignment with the highest score."""
    l1, l2 = len(seq1), len(seq2)
    if l1 >= l2:
        s1, s2 = seq1, seq2
    else:
        s1, s2 = seq2, seq1
        l1, l2 = l2, l1  # Swap lengths

    best_alignment = None
    best_score = -1

    for i in range(l1):
        score = calculate_score(s1, s2, l1, l2, i)
        if score > best_score:
            best_alignment = "." * i + s2
            best_score = score

    return best_alignment, s1, best_score

def save_alignment_to_file(output_file, alignment, s1, score):
    """Save the alignment results to a file."""
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
    # Default sequences in case no input is provided
    default_seq1 = "../data/seq1.fasta"
    default_seq2 = "../data/seq2.fasta"

    # Use command-line inputs if available
    if len(sys.argv) == 3:
        seq1_file = sys.argv[1]
        seq2_file = sys.argv[2]
    else:
        print("No input provided. Using default sequences.")
        seq1_file = default_seq1
        seq2_file = default_seq2

    # Read sequences from FASTA files
    seq1 = read_fasta_file(seq1_file)
    seq2 = read_fasta_file(seq2_file)

    # Perform the alignment
    best_alignment, s1, best_score = find_best_alignment(seq1, seq2)

    # Save the results to an output file
    output_file = "alignment_result.txt"
    save_alignment_to_file(output_file, best_alignment, s1, best_score)

    print("Alignment complete!")

if __name__ == "__main__":
    main()
