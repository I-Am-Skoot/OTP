#!/bin/bash
function GetSeq(){
	# Build Randon Sequence for Encoding
	Chars=""
	LastChar="a"
	while [ ${#Chars} -lt 25 ]
	do
          Char=`echo {W..Z} | tr '   ' "\n" | shuf -n 1| xargs | tr -d ' '`
          if [ $Char !=  $LastChar ] 
	  then
	    Chars+=$Char
	    LastChar=$Char
          fi
	done
	echo $Chars
}

SEQA=$(GetSeq)
SEQB=$(GetSeq)

# Get Random Character list x4
CodeA=`sort --random-sort chars.list | tr -d '\n'`
CodeB=`sort --random-sort chars.list | tr -d '\n'`
CodeC=`sort --random-sort chars.list | tr -d '\n'`
CodeD=`sort --random-sort chars.list | tr -d '\n'`

# Create Validation string for use in Encoder and Decoder
key="$SEQA$SEQB$CodeA$CodeB$CodeC$CodeD"
keyhash=`sha1sum <<< $key`
keyhash=${keyhash^^}
keyhash=${keyhash:0:40}
Page="${keyhash:0:1}${keyhash:4:1}${keyhash:8:1}${keyhash:12:1}${keyhash:6:1}${keyhash:15:1}"

#  Create and format Code Page
CodeBook="|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|"$'\n'
CodeBook+="| W || A | B | C | D | E |        | X || F | G | H | I | J |"$'\n'
CodeBook+="|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|"$'\n'
CodeBook+="| 1 || ${CodeA:0:1} | ${CodeA:1:1} | ${CodeA:2:1} | ${CodeA:3:1} | ${CodeA:4:1} |        | 1 || ${CodeB:0:1} | ${CodeB:1:1} | ${CodeB:2:1} | ${CodeB:3:1} | ${CodeB:4:1} |"$'\n'
CodeBook+="| 2 || ${CodeA:5:1} | ${CodeA:6:1} | ${CodeA:7:1} | ${CodeA:8:1} | ${CodeA:9:1} |        | 2 || ${CodeB:5:1} | ${CodeB:5:1} | ${CodeB:6:1} | ${CodeB:8:1} | ${CodeB:9:1} |"$'\n'
CodeBook+="| 3 || ${CodeA:10:1} | ${CodeA:11:1} | ${CodeA:12:1} | ${CodeA:13:1} | ${CodeA:14:1} |        | 3 || ${CodeB:10:1} | ${CodeB:11:1} | ${CodeB:12:1} | ${CodeB:13:1} | ${CodeB:14:1} |"$'\n'
CodeBook+="| 4 || ${CodeA:15:1} | ${CodeA:16:1} | ${CodeA:17:1} | ${CodeA:18:1} | ${CodeA:19:1} |        | 4 || ${CodeB:15:1} | ${CodeB:16:1} | ${CodeB:17:1} | ${CodeB:18:1} | ${CodeB:19:1} |"$'\n'
CodeBook+="| 5 || ${CodeA:20:1} | ${CodeA:21:1} | ${CodeA:22:1} | ${CodeA:23:1} | ${CodeA:24:1} |        | 5 || ${CodeB:20:1} | ${CodeB:21:1} | ${CodeB:22:1} | ${CodeB:23:1} | ${CodeB:24:1} |"$'\n'
CodeBook+="| 6 || ${CodeA:25:1} | ${CodeA:26:1} | ${CodeA:27:1} | ${CodeA:28:1} | ${CodeA:29:1} |        | 6 || ${CodeB:25:1} | ${CodeB:26:1} | ${CodeB:27:1} | ${CodeB:28:1} | ${CodeB:29:1} |"$'\n'
CodeBook+="| 7 || ${CodeA:30:1} | ${CodeA:31:1} | ${CodeA:32:1} | ${CodeA:33:1} | ${CodeA:34:1} |        | 7 || ${CodeB:30:1} | ${CodeB:31:1} | ${CodeB:32:1} | ${CodeB:33:1} | ${CodeB:34:1} |"$'\n'
CodeBook+="| 8 || ${CodeA:35:1} | ${CodeA:36:1} | ${CodeA:37:1} | ${CodeA:38:1} | ${CodeA:39:1} |        | 8 || ${CodeB:35:1} | ${CodeB:36:1} | ${CodeB:37:1} | ${CodeB:38:1} | ${CodeB:39:1} |"$'\n'
CodeBook+="|===||===|===|===|===|===|        |===||===|===|===|===|===|"$'\n'
CodeBook+="                         |========|"$'\n'
CodeBook+="$SEQA| $Page |$SEQB"$'\n'
CodeBook+="                         |========|"$'\n'
CodeBook+="|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|"$'\n'
CodeBook+="| Y || K | L | M | N | O |        | Z || P | Q | R | S | T |"$'\n'
CodeBook+="|≡≡≡||===|===|===|===|===|        |≡≡≡||===|===|===|===|===|"$'\n'
CodeBook+="| 1 || ${CodeC:0:1} | ${CodeC:1:1} | ${CodeC:2:1} | ${CodeC:3:1} | ${CodeC:4:1} |        | 1 || ${CodeD:0:1} | ${CodeD:1:1} | ${CodeD:2:1} | ${CodeD:3:1} | ${CodeD:4:1} |"$'\n'
CodeBook+="| 2 || ${CodeC:5:1} | ${CodeC:6:1} | ${CodeC:7:1} | ${CodeC:8:1} | ${CodeC:9:1} |        | 2 || ${CodeD:5:1} | ${CodeD:6:1} | ${CodeD:7:1} | ${CodeD:8:1} | ${CodeD:9:1} |"$'\n'
CodeBook+="| 3 || ${CodeC:10:1} | ${CodeC:11:1} | ${CodeC:12:1} | ${CodeC:13:1} | ${CodeC:14:1} |        | 3 || ${CodeD:10:1} | ${CodeD:11:1} | ${CodeD:12:1} | ${CodeD:13:1} | ${CodeD:14:1} |"$'\n'
CodeBook+="| 4 || ${CodeC:15:1} | ${CodeC:16:1} | ${CodeC:17:1} | ${CodeC:18:1} | ${CodeC:19:1} |        | 4 || ${CodeD:15:1} | ${CodeD:16:1} | ${CodeD:17:1} | ${CodeD:18:1} | ${CodeD:19:1} |"$'\n'
CodeBook+="| 5 || ${CodeC:20:1} | ${CodeC:21:1} | ${CodeC:22:1} | ${CodeC:23:1} | ${CodeC:24:1} |        | 5 || ${CodeD:20:1} | ${CodeD:21:1} | ${CodeD:22:1} | ${CodeD:23:1} | ${CodeD:24:1} |"$'\n'
CodeBook+="| 6 || ${CodeC:25:1} | ${CodeC:26:1} | ${CodeC:27:1} | ${CodeC:28:1} | ${CodeC:29:1} |        | 6 || ${CodeD:25:1} | ${CodeD:26:1} | ${CodeD:27:1} | ${CodeD:28:1} | ${CodeD:29:1} |"$'\n'
CodeBook+="| 7 || ${CodeC:30:1} | ${CodeC:31:1} | ${CodeC:32:1} | ${CodeC:33:1} | ${CodeC:34:1} |        | 7 || ${CodeD:30:1} | ${CodeD:31:1} | ${CodeD:32:1} | ${CodeD:33:1} | ${CodeD:34:1} |"$'\n'
CodeBook+="| 8 || ${CodeC:35:1} | ${CodeC:36:1} | ${CodeC:37:1} | ${CodeC:38:1} | ${CodeC:39:1} |        | 8 || ${CodeD:35:1} | ${CodeD:36:1} | ${CodeD:37:1} | ${CodeD:38:1} | ${CodeD:39:1} |"$'\n'
CodeBook+="|===||===|===|===|===|===|        |===||===|===|===|===|===|"$'\n'

# Display Codepage
echo "$CodeBook"$'\n'$'\n'

# Send Code string to stderr
echo "$Page$key$keyhash" >&2
