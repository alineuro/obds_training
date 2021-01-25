#!/usr/bin/env python
"""
documentation
"""

#For complemenatry base pairs
# Session 6 - Introduction to Python

# on local machine, go to devel/obds_training/python and open Spyder (python 3.8)
spyder

# save the code here, upload to github in my own repository
git status
git add .
git status
git commit -m "text"
git push

## 1. Write a function to return the complement of a DNA sequence
def complement_base(base):
    """Returns the Watson-Crick complement of a base."""
    if base == 'A':
       output = 'T'
    elif base == 'G':
        output = 'C'
    elif base == 'C':
        output = 'G'
    elif base == 'T':
        output = 'A'
    else:
        print("Unknown base")
    return output


## 2. Write a function to reverse a string
def reverse_string(sequ):
    last_position = len(sequ) - 1
    output = ""
    for i in range(last_position, -1, -1):
        output += sequ[i]
    return output

reverse_string("AAAAAGGGGGGTTTTT")

########
rev_nums = nums[::-1]
rev_nums = nums[10:0:-1]
########


## Function to reverse complement of a sequence
def reverse_complement(seq):
    """Compute reverse complement of a sequence."""

    # Initialize reverse complement
    rev_seq = ''

    # Loop through and populate list with reverse complement
    for base in reverse_string(seq):
        rev_seq += complement_base(base)

    return rev_seq

reverse_complement("AGCTGACTA")


## Display the template strand (from 5′ to 3′) above its reverse complement (from 3′ to 5′).
def display_complements(seq):
    """Print sequence above its reverse complement."""

    # Compute the reverse complement
    rev_comp = reverse_complement(seq)

    # Print template
    print(seq)

    # Print "base pairs"
    for base in seq:
        print('|', end='')

    # Print final newline character after base pairs
    print()

    # Print reverse complement
    for base in reverse_string(rev_comp):
        print(base, end='')

    # Print final newline character
    print()

seq = 'AGCTTTTTTTGGGC'
display_complements(seq)