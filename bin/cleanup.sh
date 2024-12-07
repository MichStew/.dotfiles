#!/bin/bash

if [[ -f "$HOME/.nanorc" ]]; then
	rm "$HOME/.nanorc"
	echo "Removed .nanorc file."
fi 
if grep -q "source ~/.dotfiles/etc/bashrc_custom" "$HOME/.bashrc"; then
	sed -i 's#source ~/.dotfiles/etc/bashrc_custom##' "$HOME/.bashrc"
	echo "Removed source command from .bashrc."
fi
if [[ -d "$HOME/.TRASH" ]]; then 
	rm -rf "$HOME/.TRASH"
	echo "Removed .TRASH directory"
fi 
