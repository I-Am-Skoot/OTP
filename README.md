# OTP
One time Pad Tools

This is a set of tools I built to generate One Time use Pads for sending and recieving secure messages.
Each code page should only be used once.  Never re-use the code page.

To use:

./Gen.sh   Will generate a code page like this.
```
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| W || A | B | C | D | E |        | X || F | G | H | I | J |
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| 1 || F | X | Z | 1 | T |        | 1 || 8 |   | D | Y | 0 |
| 2 || O | A | J | L | G |        | 2 || 4 | 4 | K | 6 | Q |
| 3 ||   | H | P | C | U |        | 3 || B | P | 7 | U | M |
| 4 || B | 3 | - | 6 | 7 |        | 4 || F | O | T | V | S |
| 5 || V | E | N | 4 | 8 |        | 5 || 5 | N | , | W | G |
| 6 || , | S | I | . | D |        | 6 || H | - | I | 9 | J |
| 7 || Q | Y | 5 | R | 9 |        | 7 || A | . | E | Z | R |
| 8 || 2 | W | K | 0 | M |        | 8 || C | X | 2 | 1 | L |
|===||===|===|===|===|===|        |===||===|===|===|===|===|
                         |========|
YZWXWZWZYZXZWXZXYWZWXZYWX| C715E3 |ZWYWYXYWYXZYZXZXWXYXWZXYZ
                         |========|
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| Y || K | L | M | N | O |        | Z || P | Q | R | S | T |
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| 1 || - | 1 | D | O | 2 |        | 1 || U |   | Z | Y | G |
| 2 || E | 7 | F | K | H |        | 2 || V | , | E | Q | H |
| 3 || A | 8 | L | . | B |        | 3 || A | P | B | T | L |
| 4 || Y | 0 | M | Z | X |        | 4 || . | 7 | D | 6 | W |
| 5 || 4 | U | 9 | V | G |        | 5 || S | O | R | 5 | 0 |
| 6 || , | 5 | C | P | N |        | 6 || K | 3 | I | 4 | M |
| 7 || 3 |   | S | Q | W |        | 7 || J | - | 2 | X | 1 |
| 8 || T | 6 | I | R | J |        | 8 || F | 8 | 9 | N | C |
|===||===|===|===|===|===|        |===||===|===|===|===|===|
```
#**DO NOT USE THIS EXAMPLE EXCEPT FOR TESTING**

It will also send a code the the stderr to use in the Encoder, Decoder, and validation tools.   these are extra tools not needed for this process.

The Code Page has 
- 4 Encoding tables labeled, W, X, Y, and Z
- a Page ID in the middle of the Code Page
- an Encoding sequence on both sides of the Page ID

To Use, print two copies of the table.    Give one to your partner.

Using the Encoding sequence, you will identify which table will be used for each character in your message.

In this example, the encoding sequence is YZWXWZWZYZXZWXZXYWZWXZYWXZWYWYXYWYXZYZXZXWXYXWZXYZ  (50 Chars Long)  if your message is longer than 50 chars, you will need to repeat (This is not as secure, we advise to keep messages under 50 chacters long).

A test message would look like:
```
Plaintext: This is a test Message.
Encoded: K8T2C6J4A3R6B6Q1K3Q1H4R2B6H4Q1J3K2B6P5B2J5R2N3
```

To allow your partner to be able to decode it, Add the Page ID to the start of the string you send them.
Example: C715E3K8T2C6J4A3R6B6Q1K3Q1H4R2B6H4Q1J3K2B6P5B2J5R2N3

To Decode, you furst match the Page ID, then for each code, Find the character in the proper table
```
K8 T2 C6 J4 A3 R6 B6 Q1 K3 Q1 H4 R2 B6 H4 Q1 J3 K2 B6 P5 B2 J5 R2 N3
T  H  I  S     I  S     A     T  E  S  T     M  E  S  S  A  G  E  .
```
Notice that having 4 tables makes it les likely that the same charater will be detected as a repeating character.




