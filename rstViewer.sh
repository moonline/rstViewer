#!/usr/bin/bash

# get settings
path="$(dirname $0)"
settingsFile="$(eval echo ~${SUDO_USER})/.rstViewer/rstViewer.conf"
defaultSettingsFile="$path/rstViewer.conf"

if [ -f $settingsFile ]; then
	echo "use user settings $settingsFile"
	. $settingsFile
else
	echo "use default setting $defaultSettingsFile"
	. $defaultSettingsFile
fi



# input dialog
rstFile=$(yad --width=500 --height=150 --entry --title="RST Viewer" --image="$path/icon-rstViewer-128.png" --button="Build File" --button="File select Dialog" --text="Insert the path to your rst file or use the file select dialog.")

# file choosing dialog
if [ $? -ne 0 ]; then
	rstFile=$(yad --file ..title="Choose rst file" --width=800 --height=500 --window-icon="$path/icon-rstViewer-256.png" --center --file-filter=" | *.rst")
fi

if [ $rstFile ]; then
	#$editor $rstFile & #1>/dev/null 2>&1
	$editor $rstFile &
	rst2pdf "$rstFile" -o "$tempFile"

	#$pdfViewer $tempFile & #1>/dev/null 2>&1
	$pdfViewer $tempFile &
	processIdPdfViewer=$!

	# build file until pdf viewer is closed
	while [ "$(ps cax | grep $processIdPdfViewer)" ]; do
		rst2pdf "$rstFile" -o "$tempFile"
		sleep $refreshInterval
	done
fi