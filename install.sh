#!/bin/sh

# TODO - Finish XFCE
# TODO - Finish LXDE
# TODO - Determine what other desktops can be added
# TODO - Can Windows be done?

# All of these should be installed, because desktops that are not
# installed now, may be installed in the future. That will prevent
# the user from having to go back and run this installer again.

# Installs all files starting with "Run".
installIntoGnome()
(
    targetDir=$HOME/.local/share/nautilus/scripts
    mkdir -p "$targetDir"
    for script in Run* View*
    do
        install -Dpv "$script" "$targetDir"
    done
)

installIntoKde()
(
    # Target directory can be determined with:
    #     qtpaths --locate-dirs GenericDataLocation kio/servicemenus
    # But, it can't be run unless KDE is installed.

    kdeTargetDir="$HOME"/.local/share/kservices5/ServiceMenus
    kdeTargetDir="$HOME"/.local/share/kio/servicemenus
    kdeSourceFile=run-as-java-for-kde-menu.desktop
    mkdir -p "$kdeTargetDir"
    install -Dpv "$kdeSourceFile" "$kdeTargetDir"
)

# Not finished. Still figuring it out.
installIntoXfce()
(
    # Xfce setup (Thunar File Manager)
    # Has to be edited somehow
    # Try the merge option to possibly add a separate file
    # just for this, without having to edit the main file
    xfceTarget=~/.config/menus/xfce-applications.menu
    # Search: add file type to xfce menu thunar file manager programmatically no GUI
)

# Not finished. Still figuring it out.
#installIntoLxde()
#(
    # Lxde setup (PCMan File Manager)
    # https://docs.google.com/document/d/1FQNJBSPJ1HVfL2Vj1hTljj6Nk9ta_Q3Ue7zf6P16oUk/edit?usp=sharing
#)

installIntoGnome
installIntoKde

