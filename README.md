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
| 1 || U | - | N | P | C |        | 1 || B |   | G | O | L |
| 2 || I | 0 | 4 | Q | H |        | 2 || Q | Q | W | K | M |
| 3 || , | W | Z | M | 1 |        | 3 || D | Z | R | A | S |
| 4 || 5 | 2 | D | J | O |        | 4 || E | 4 | , | 7 | I |
| 5 || 6 | 7 | X | T | . |        | 5 || 2 | T | 9 | 6 | 8 |
| 6 || B | Y | A | 3 | 8 |        | 6 || U | . | - | 3 | N |
| 7 || V | K | E | F | L |        | 7 || J | 1 | F | X | P |
| 8 || S | G | 9 | R |   |        | 8 || 0 | V | 5 | C | H |
|===||===|===|===|===|===|        |===||===|===|===|===|===|
                         |========|
ZYXZYZWYWZXYZWYXZXWYXZYWY| O4J8K5 |ZXWYWXYWXZYXWXZXWXZYWYZYX
                         |========|
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| Y || K | L | M | N | O |        | Z || P | Q | R | S | T |
|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|
| 1 || 0 | R | Q | P | L |        | 1 || I | , | . | A | H |
| 2 || 9 | , | 7 | N | 4 |        | 2 || Q | 5 | X | M | 7 |
| 3 || M | U | 3 | Y | W |        | 3 || Z | B | E | C | 1 |
| 4 || E | K | - | 2 | 1 |        | 4 || V | K | U | F | 2 |
| 5 || G | 6 | F | S | O |        | 5 || O | 4 | W | J | 9 |
| 6 || V | D | 8 | H | B |        | 6 || N | P | 0 | 8 | Y |
| 7 || C | 5 | A | T | . |        | 7 || S | R | T |   | D |
| 8 ||   | J | X | Z | I |        | 8 || 3 | L | - | 6 | G |
|===||===|===|===|===|===|        |===||===|===|===|===|===|
```

It will also send a code the the stderr to use in the Encoder, Decoder, and validation tools.   these are extra tools not needed for this process.

The Code Page has 
- 4 Encoding tables labeled, W, X, Y, and Z
- a Page ID in the middle of the Code Page
- an Encoding sequence on both sides of the Page ID

To Use, print two copies of the table.    Give one to your partner.

Using the Encoding sequence, you will identify which table will be used for each character in your message.

In this example, the encoding sequence is ZYXZYZWYWZXYZWYXZXWYXZYWYZXWYWXYWXZYXWXZXWXZYWYZYX  (50 Chars Long)  if your message is longer than 50 chars, you will need to repeat.

A test message would look like:
```
Plaintext: This is a test Message.
Encoded: N7J8P1N5S7A2N5E8S1G1N7R3A8N7G1S2F4A8N5I3T8K4E5
```

To allow your partner to be able to decode it, Add the Page ID to the start of the string you send them.
Example: O4J8K5N7J8P1N5S7A2N5E8S1G1N7R3A8N7G1S2F4A8N5I3T8K4E5

To Decode, you furst match the Page ID, then for each code, Find the character in the proper table
```
N7 J8 P1 N5 S7 A2 N5 E8 S1 G1 N7 R3 A8 N7 G1 S2 F4 A8 N5 I3 T8 K4 E5
T  H  I  S     I  S     A     T  E  S  T     M  E  S  S  A  G  E  .
```
Notice that having 4 tables makes it les likely that the same charater will be detected as a repeating character.




