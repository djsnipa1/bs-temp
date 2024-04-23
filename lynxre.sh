#!/usr/bin/env bash

function hmm {
	read -r foo
	echo "$foo"
}
hmm
echo "$foo"

if [ -p /dev/stdin ]; then
	echo "Something has been piped into the script"
else
	echo "Nothing has been piped into the script"
fi
# Change the url accordingly
URL=$1
CUSTOM=$2
API="https://lynx.re/api.php?url=$URL&custom=$CUSTOM"

# FILEPATH="$1"
# FILENAME=$(basename -- "$FILEPATH")
# EXTENSION="${FILENAME##*.}"

# RESPONSE=$(curl --data-binary @${FILEPATH:-/dev/stdin} --url $URL)
RESPONSE=$(curl "$API")
PASTELINK="$RESPONSE"

# [ -z "$EXTENSION" ] && \
#     echo "$PASTELINK" || \
#     echo "$PASTELINK.$EXTENSION"

echo "$PASTELINK"
# echo $PASTELINK | xsel
#echo $API

function checkPiped {
	# Check to see if a pipe exists on stdin.
	if [ -p /dev/stdin ]; then
		echo "Data was piped to this script!"
		# If we want to read the input line by line
		while IFS= read line; do
			echo "Line: ${line}"
		done
		# Or if we want to simply grab all the data, we can simply use cat instead
		# cat
	else
		echo "No input was found on stdin, skipping!"
		# Checking to ensure a filename was specified and that it exists
		if [ -f "$1" ]; then
			echo "Filename specified: ${1}"
			echo "Doing things now.."
		else
			echo "No input given!"
		fi
	fi
}
checkPiped "$1"
