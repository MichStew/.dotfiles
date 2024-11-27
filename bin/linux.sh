#!/bin/bash

exec >> linuxsetup.log 2>&1

if [[$(uname) != "Linux"]]; then
	echo "Error: this script is only intende dfor Linux systems."
	exit 1
fi 

if [[ ! -d "$HOME/.TRASH" ]]; then
	mkdir "$HOME/.TRASH"
	echo "Created a .TRASH directory in HOME"
fi 

if [[ -f "$HOME/.nanorc"]]; then
	mv "$HOME/.nanorc" "$HOMD/.bup nanorc"
	echo "Renamed existing .nanorc to .bup nanorc."
fi
# Overwrite the contenct of etc/nanorc to ~/.nanorc
cp ~/.dotfiles/etc/nanorc "$HOME/.nanorc"
echo "Copied etc/nanorc to ~/.nanorc"
# Add sourcd command to bashrc
fi ! grep -q "source ~/.dotifiles/etx/bashrc_custom" "$HOME/.bashrc"; then
	echo "source ~/.dotfiles/etc/bashrc_custom" >> "$HOME/.bashrc"
	echo "Appended source command to .bashrc."
fi 

