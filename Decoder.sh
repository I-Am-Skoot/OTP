#!/bin/bash
read -p "Enter Code base: " base
if [ ${#base} -ne 256 ]; then echo "Invalid Code Base ${#base}";exit
else echo "Code Accepted"
  sleep 1
fi
# Set Code Variables
Page=${base:0:6}
SEQ=${base:7:49}
W=${base:56:40}
X=${base:96:40}
Y=${base:136:40}
Z=${base:176:40}
key="$SEQA$SEQB$CodeA$CodeB$CodeC$CodeD"
keyhash=${base:216:40}
Testedkeyhash=`sha1sum <<< $key`
Testedkeyhash=${keyhash^^}
Testedkeyhash=${keyhash:0:40}
# Set Grids
declare -a Wc=("A1" "B1" "C1" "D1" "E1" "A2" "B2" "C2" "D2" "E2" "A3" "B3" "C3" "D3" "E3" "A4" "B4" "C4" "D4" "E4" "A5" "B5" "C5" "D5" "E5" "A6" "B6" "C6" "D6" "E6" "A7" "B7" "C7" "D7" "E7" "A8" "B8" "C8" "D8" "E8")
declare -a Xc=("F1" "G1" "H1" "I1" "J1" "F2" "G2" "H2" "I2" "J2" "F3" "G3" "H3" "I3" "J3" "F4" "G4" "H4" "I4" "J4" "F5" "G5" "H5" "I5" "J5" "F6" "G6" "H6" "I6" "J6" "F7" "G7" "H7" "I7" "J7" "F8" "G8" "H8" "I8" "J8")
declare -a Yc=("K1" "L1" "M1" "N1" "O1" "K2" "L2" "M2" "N2" "O2" "K3" "L3" "M3" "N3" "O3" "K4" "L4" "M4" "N4" "O4" "K5" "L5" "M5" "N5" "O5" "K6" "L6" "M6" "N6" "O6" "K7" "L7" "M7" "N7" "O7" "K8" "L8" "M8" "N8" "O8")
declare -a Zc=("P1" "Q1" "R1" "S1" "T1" "P2" "Q2" "R2" "S2" "T2" "P3" "Q3" "R3" "S3" "T3" "P4" "Q4" "R4" "S4" "T4" "P5" "Q5" "R5" "S5" "T5" "P6" "Q6" "R6" "S6" "T6" "P7" "Q7" "R7" "S7" "T7" "P8" "Q8" "R8" "S8" "T8")

# Validate Code base is unchanged
if [ "$Testedkeyhash" != "$keyhash" ]; then echo "Corrupted ";exit
else echo "Code Verified"
  sleep 1
fi
output=""

Decode () {
  # Decode valide Message

  # Build Grids
  declare -A codetable
   for (( w=0; w<40; w++)); do
     codetable[${Wc[$w]}]=${W:$w:1}
     codetable[${Xc[$w]}]=${X:$w:1}
     codetable[${Yc[$w]}]=${Y:$w:1}
     codetable[${Zc[$w]}]=${Z:$w:1}
   done
  
 

  # Validate code page matches message
  mPage=${message:0:6}
  if [ "$mPage" != "$Page" ]; then 
	  echo "CodePage Mismatch "
	  exit
  else
	  echo "Codepage Match"
  fi
  
  #  Decode message
  out=""
  for (( i=6; i<${#message}; i++ )); do
    char=${message:$i:2}
    char=${char^^}
    out=$out${codetable[$char]}
    output=$out
  done  

}

read -p "Enter Message: " message
Decode
echo "Decoded message: $output"
