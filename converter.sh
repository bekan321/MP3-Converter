#!/usr/bin/env bash

#this is whole some

#Check if the argument is 2 if it's not it will guide you for the usage
if [ $# -ne 2 ]; then
echo "* The -d is for directory"
echo -e "[*] Usage ./converter.sh -d /home/user/\n"
echo "The -f is for single file"
echo "[*] Usage ./converter.sh -f example.mp4"

exit 1

fi

# Check if ffmpeg is installed or not and install it
if ! which ffmpeg &>/dev/null; then
echo "ffmpeg is not installed"
echo "[*] Installing ffmpeg please wait ..."
sudo apt update &>/dev/null
sudo apt install ffmpeg &>/dev/null
fi



if [[ $1 == "-d" && -d $2 ]]; then
	mkdir -p converted_mp3
	for i in $2/*.mp4; do
		if [ -e $i ]; then
			mp3_file="${i%.mp4}.mp3"
			ffmpeg -i $i -q:a 0 -map a $mp3_file
			mv $mp3_file converted_mp3
		else
			echo "There is no MP4 files on this Directory"
		fi
	done

elif [[ $1 == "-f" && -e $2 ]]; then
	mp3_file=${2%.mp4}.mp3
		ffmpeg -i $2 -q:a 0 -map a $mp3_file
	else
		echo "it's not a directory"
		

fi
		
