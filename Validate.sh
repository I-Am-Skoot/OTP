#!/bin/bash
errors=""
# Get Code
read -p "Enter Code base: " base
if [ ${#base} -eq 264 ] || [ ${#base} -eq 263 ]; then 
	echo "Code Accepted"
	sleep 1
else 
	errors="$errors - Invalid Code Base ${#base}"
fi

# Set Code Variables
Page=${base:0:6}
SEQ=${base:7:49}
W=${base:56:40}
X=${base:96:40}
Y=${base:136:40}
Z=${base:176:40}
key=${base:0:216}
Testedkeyhash=`bc <<<ibase=16\;$(sha1sum <<< "$key"|tr a-z A-Z)0`
keyhash=${base:216:48}

# Validate Code hasn't been changed
if [ "$Testedkeyhash" != "$keyhash" ]; then errors="$errors - Has Mismatch"
else echo "Code Verified"
  sleep 1
fi

# Show values
echo "Page=$Page"
echo "SEQ=$SEQ"
echo "W=$W"
echo "X=$X"
echo "Y=$Y"
echo "Z=$Z"
echo "Testedkeyhash=$Testedkeyhash"
echo "keyhash=$keyhash"
echo "Errors=$errors"


