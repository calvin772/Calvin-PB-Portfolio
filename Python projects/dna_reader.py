# def dna_string_conv():
#     sequence53 = input("Copy and paste sequence: ")
#     sequenceL = list(sequence53)
#     seqR = []
#     print(sequenceL)

#     for i in sequenceL:
#         if i == "A":
#             i = "T"
#         elif i == "T":
#             i = "A"
#         elif i == "C":
#             i = "G"
#         elif i == "G":
#             i = "C"
#         seqR.append(i)

#     return(seqR)

# print(dna_string_conv())



def dna_complement(sequence):
    # Convert to uppercase to handle mixed/lowercase input
    sequence = sequence.upper()

    # Define complement mapping
    complements = {"A": "T", "T": "A", "C": "G", "G": "C"}

    # Validate sequence
    if any(base not in complements for base in sequence):
        raise ValueError("Invalid DNA sequence: only A, T, C, and G are allowed.")

    # Build complementary strand
    complement_strand = ''.join(complements[base] for base in sequence)

    return complement_strand


# Example usage
if __name__ == "__main__":
    seq = input("Copy and paste sequence: ")
    print("Complementary sequence:", dna_complement(seq))

