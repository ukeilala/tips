#!/bin/bash

#terminal colors

CTAG_S="\x1b[1;33m"
CTAG_S_R="\x1b[1;31m"
CTAG_E="\x1b[0m"


echo -en "${CTAG_S}\n\n"


echo -en "${CTAG_S_R}\n\n"
result=$(diff ./a ./b)

if [ $? -eq 0 ]
then
	echo "Files are the same"
else
	echo "Files are different"
	echo "$result"
fi

echo -en "${CTAG_E}\n\n"
