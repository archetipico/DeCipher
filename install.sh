#!/bin/bash

DECIPHER_DIR=~/.DeCipher

# Check if the .DeCipher directory exists, create it if not
if [[ ! -d "$DECIPHER_DIR" ]]; then
    mkdir "$DECIPHER_DIR"
fi

cp -r ./src "$DECIPHER_DIR"

# Add the 'decp' alias to .bashrc
echo "alias decp='bash $DECIPHER_DIR/src/decipher.sh'" >> ~/.bashrc
# Refresh .bashrc
source ~/.bashrc
echo "All good"
echo "If 'decp' does not work, open a new terminal"

exit 0
