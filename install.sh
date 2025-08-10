#!/bin/sh

# All of these should probably be installed in case desktops that are not
# installed now are installed in the future. That will prevent the user
# from having to go back and run this installer again.

targetDir=$HOME/.local/share/nautilus/scripts

for script in Run*
do
	install -Dpv "$script" "$targetDir"
done

# Setup KDE menu
# Target directory can be determined with: qtpaths --locate-dirs GenericDataLocation kio/servicemenus
kdeTargetDir="$HOME"/.local/share/kservices5/ServiceMenus
kdeTargetDir="$HOME"/.local/share/kio/servicemenus
kdeSourceFile=run-as-java-for-kde-menu.desktop
install -Dpv "$kdeSourceFile" "$kdeTargetDir"

# Xfce setup (Thunar File Manager)
# Has to be edited somehow
# Try the merge option to possibly add a separate file
# just for this, without having to edit the main file
xfceTarget=~/.config/menus/xfce-applications.menu
# Search: add file type to xfce menu thunar file manager programmatically no GUI

# Lxde setup (PCMan File Manager)
# https://docs.google.com/document/d/1FQNJBSPJ1HVfL2Vj1hTljj6Nk9ta_Q3Ue7zf6P16oUk/edit?usp=sharing
