#!/bin/bash

file_name="file"
while true; do
	uncompressed_file=$(7z l $file_name | grep Name -A 2 | tail -n 1 | awk 'NF{print $NF}')
	7z x $file_name > /dev/null 2>&1

	if [ "$(echo $?)" == "0" ]; then
		file_name=$uncompressed_file
	else
		break
	fi
done
echo -n "[*] Passsword: $(cat password.txt)"
rm file~ pas*
