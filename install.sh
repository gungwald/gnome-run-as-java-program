#!/bin/sh

targetDir=$HOME/.local/share/nautilus/scripts

for script in Run*
do
	install -Dpv "$script" "$targetDir"
done
