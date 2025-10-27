#!/bin/bash

. /etc/os-release || exit $?

if [ "$ID" = "debian" -o "$ID_LIKE" = "debian" ]
then
    ALT_CMD="update-alternatives --list java"
elif [  "$ID" = "fedora" -o "$ID_LIKE" = "fedora" ]
then
    ALT_CMD="alternatives --display java"
else
    echo Can\'t determine command to list java alternatives.
    exit 1
fi

unset ALT_JAVA
ALT_JAVA=$($ALT_CMD | grep --only-matching '^/[^ ]*' | zenity \
    --list \
    --title="Run as Java Program with Alterate Java" \
    --text="Select Java version to run:" \
    --width=600 --height=200 \
    --hide-header \
    --column Java 2> /dev/null)

if [ -z "$ALT_JAVA" ]
then
    exit 1
fi

# With terminal
# Enter arguments

export ALT_JAVA
sh -x "$(dirname "$0")/Run Jar File as Java Program.sh"

