#!/bin/bash

# Redirect all output to linuxsetup.log
exec >> linuxsetup.log 2>&1

# Check if the system is Linux
if [[ $(uname) != "Linux" ]]; then
    echo "Error: This script is only intended for Linux systems."
    exit 1
fi

# Create the .TRASH directory in $HOME if it doesn't exist
if [[ ! -d "$HOME/.TRASH" ]]; then
    mkdir "$HOME/.TRASH"
    echo "Created .TRASH directory in $HOME"
else
    echo ".TRASH directory already exists in $HOME"
fi

# Rename .nanorc if it exists in $HOME
if [[ -f "$HOME/.nanorc" ]]; then
    mv "$HOME/.nanorc" "$HOME/.bup_nanorc"
    echo "Renamed existing .nanorc to .bup_nanorc."
else
    echo ".nanorc does not exist in $HOME."
fi

# Use absolute path for the .nanorc file inside .dotfiles
if [[ -f "$HOME/.dotfiles/etc/nanorc" ]]; then
    cp "$HOME/.dotfiles/etc/nanorc" "$HOME/.nanorc"
    echo "Copied $HOME/.dotfiles/etc/nanorc to $HOME/.nanorc"
else
    echo "Error: $HOME/.dotfiles/etc/nanorc file not found!"
fi

# Ensure .bashrc exists and create it if necessary
if [[ ! -f "$HOME/.bashrc" ]]; then
    touch "$HOME/.bashrc"
    echo "Created .bashrc file in $HOME"
fi

# Append the source line to .bashrc if it's not already present
if ! grep -q "source $HOME/.dotfiles/etc/bashrc_custom" "$HOME/.bashrc"; then
    echo "source $HOME/.dotfiles/etc/bashrc_custom" >> "$HOME/.bashrc"
    echo "Appended 'source ~/.dotfiles/etc/bashrc_custom' to .bashrc"
else
    echo "'source ~/.dotfiles/etc/bashrc_custom' already exists in .bashrc"
fi

