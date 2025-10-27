#!/bin/sh

# Bill Chatfield
# GPL 2.0

# View .jar File
# Script for Nautilus file manager in Gnome in Linux.
# Install into $HOME/.local/share/nautilus/scripts

message() 
{
    local msg="$*"
    zenity --info --text="$msg" --title="$0"
}

error() 
{
    local msg="$*"
    zenity --error --text="$msg" --width=300 --height=200 --title="$0 - Error"
}

showFileContents() 
{
    local fileName="$1"
    shift
    zenity --text-info --filename="$fileName" --width=850 --height=500 --title="$0 - Output from: $*"
}

processOneFile() 
(
    simpleName=`basename "$1"`
    jar -tvf "$1" | zenity --text-info --title="$simpleName" --width=900 --height=500 --font='DejaVu Sans Mono 8'
)

# Note on NAUTILUS_SCRIPT_SELECTED_FILE_PATHS variable provided as by 
# Nautilus:
#
# Spaces can separate file names and also be included in file names.
# The spaces that separate file names will be followed by a slash
# character because each file name is given in its absolute form.

# This loop builds up file names from their space-separated parts until it
# finds a combination that is actually a file that exists. This algorithm
# effectively determines whether the spaces are part of the file name or
# are separators between the file names.
unset FILE_NAME
for PART in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
do
    if [ -z "$FILE_NAME" ]
    then
        FILE_NAME=$PART
    else
        FILE_NAME="$FILE_NAME $PART"
    fi

    if [ -f "$FILE_NAME" ]
    then
        processOneFile "$FILE_NAME"
        unset FILE_NAME
    fi
done

if [ -n "$FILE_NAME" ]
then
    error Could not interpret file name: $FILE_NAME
fi

