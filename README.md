Hardware Implementation of Advanced Encryption Standard Algorithm

Advenced Ecryption Standard (AES), a Federal Information Processing Standard (FIPS), is an approved cryptographic algoritm that can be used to protect eletronic data.

High-level description of the algorithm

    KeyExpansion – round keys are derived from the cipher key using the AES key schedule. AES requires a separate 128-bit round key block for each round plus one more.
    Initial round key addition:
        AddRoundKey – each byte of the state is combined with a byte of the round key using bitwise xor.
    9, 11 or 13 rounds:
        SubBytes – a non-linear substitution step where each byte is replaced with another according to a lookup table.
        ShiftRows – a transposition step where the last three rows of the state are shifted cyclically a certain number of steps.
        MixColumns – a linear mixing operation which operates on the columns of the state, combining the four bytes in each column.
        AddRoundKey
    Final round (making 10, 12 or 14 rounds in total):
        SubBytes
        ShiftRows
        AddRoundKey
        
The National Security Agency (NSA) reviewed all the AES finalists, including Rijndael, and stated that all of them were secure enough for U.S. Government non-classified data. In June 2003, the U.S. Government announced that AES could be used to protect classified information: 

The design and strength of all key lengths of the AES algorithm (i.e., 128, 192 and 256) are sufficient to protect classified 	information up to the SECRET level. TOP SECRET information will require use of either the 192 or 256 key lengths. The 		implementation of AES in products intended to protect national security systems and/or information must be reviewed and 		certified by NSA prior to their acquisition and use.

AES has 10 rounds for 128-bit keys, 12 rounds for 192-bit keys, and 14 rounds for 256-bit keys.

By 2006, the best known attacks were on 7 rounds for 128-bit keys, 8 rounds for 192-bit keys, and 9 rounds for 256-bit keys.
