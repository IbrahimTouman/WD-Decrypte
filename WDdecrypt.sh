#!/bin/bash

# Author of this file: Ibrahim Touman [https://github.com/IbrahimTouman]
# Date of publication: 25 Dec 2020


set -e  # halts execution when an error is encountered
bash -n "${0#*/}"  # unless the entire script is syntactically correct, execution is canceled (if the e flag is set already)


if [[ -n "$SUDO_COMMAND" ]]; then
	printf "The required root privilege exists..\n\n"
else
	printf "The required root privilege does not exist,\n"
	printf "but not for much longer because we are going to acquire it now..\n\n"
	
	exec sudo "./${0#*/}" "$@"
fi


# 'plain' is a temporary file for storing the plaintext password momentarily.
plain=$(mktemp)  # this creates a file in the system's default temporal directory.

# for security reasons, we ensure that the temporary file (which stores the plaintext password)
# is removed before the end of this script file execution even in case of abnormal exit.

exec {plain_FDw}>"$plain"  # we create a File Descriptor (FD) for writing to the temporary file.
exec {plain_FDr}<"$plain"  # we create a File Descriptor (FD) for reading from the temporary file.

# despite the fact that we delete the temporary file, its file descriptors,
# namely 'plain_FDw' and 'plain_FDr', will continue to exist throughout this script.
rm -f "$plain"


printf "If you do not know the location of your encrypted WD drive, then please look\n"
printf "it up using 'dmesg | grep -i scsi' or 'lsblk' before proceeding any further\n\n"
read -p "Enter the location of your encrypted WD drive (e.g., /dev/sdb): " location


[[ -f /lib/cryptsetup/askpass ]] || apt-get install cryptsetup  # this installs the cryptsetup package if necessary
echo $(/lib/cryptsetup/askpass "Enter the password of your encrypted WD drive: ") >&$plain_FDw
printf "\n"


if [[ -f ./cookpw.py ]]; then
	if [[ -x ./cookpw.py ]]; then
		echo "The 'cookpw.py' python script is executable.."
	else
		echo "The 'cookpw.py' python script is inexecutable,"
		echo "but not for much longer because we will render it executable"
		chmod u+x ./cookpw.py
	fi
else
		msg="The 'cookpw.py' python script is missing from the current directory"
		echo $msg >&2  # the output of echo is redirected to the Standard Error (aka, stderr)
		exit 1
fi

printf "\n"


./cookpw.py $(cat <&$plain_FDr) | sg_raw -s 40 "$location" c1 e1 00 00 00 00 00 00 28 00
