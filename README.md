## ENCRYPTION AND DECRYPTION USING CAESER CIPHER

This mini-project is an implementation of encryption and decryption using Caeser Cipher.

# Input format
The user gives 4 inputs
* Encryption/Decryption (0/1)
* Caps Lock (On/Off)
* Alphabet (a-z or A-Z depending upon the Caps)
* Shift Amount (1-26)

# Output format

The string is taken as an input from the user character wise and then the encrypted/decrypted character is shown on the TTY Display.

# Functionality

STEP-1: Each alphabet (a-z) is assigned a number corresponding to it (a-0,b-1,c-2.....z-25). The number associated with the alphabet goes to a binary 	encoder and gets converted to its equivalent binary form. Similarly, the shift amount is also binary encoded.

STEP-2: Depending upon whether encryption or decryption has to occur, the two binary numbers get either added(encryption) or subtracted(decryption).

STEP-3: A comparator circuit is used to check if the sum exceeds 26 or the difference is negative.

STEP-4: If any of the conditions in Step-3 hold true, 26 is added or subtracted from the number accordingly.

STEP-4: Next, depending upon Caps On/Off, a constant is added up to the resultant, so as to convert the number into an ASCII code for the corresponding 	character to be displayed.

STEP-5: The ASCII code is sent to the TTY Display where the character gets displayed. This continues till the end of the string.
