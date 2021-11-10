#!/bin/bash

if [[ $(ls -al ~ | grep -c ".DeCipher") -eq 0 ]]; then
    mkdir ~/.DeCipher
fi

cp -r ./src ~/.DeCipher

if [[ $(cat ~/.bashrc | grep -c "decipher.sh") -ne 0 ]]; then
    echo "Alias 'decp' already exists, no need to re-open the terminal."
else
    echo "alias decp='bash ~/.DeCipher/src/decipher.sh'" >> ~/.bashrc
    echo "Close this terminal and open a new one to complete the installation process."
fi

exit 0
