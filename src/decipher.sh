#!/bin/bash

function to_encrypt() {
    LEN=${#LINE}

    # decription time is faster when text is longer
    DECR_SLEEP=$(awk "BEGIN {print ($LEN)/($LEN*$LEN) }")
    
    # whole encryption animation
    for RUN in {0..9}; do
        INIT=$(perl ~/.DeCipher/src/encrypter.pl $LEN)
        echo -e -n "\r\033[0K$INIT"
        sleep 0.1
    done

    # start decryption
    TEMP=""
    for (( CHAR=1; CHAR<=$LEN; CHAR++ )); do
        TEMP+=${LINE:CHAR-1:1}
        INIT=$(perl ~/.DeCipher/src/encrypter.pl $(($LEN - $CHAR)))
        echo -e -n "\r\033[0K$TEMP$INIT"
        sleep $DECR_SLEEP
    done

    echo ""
}

OLD_IFS=$IFS

if [[ $# -gt 1 ]]; then
    echo "Too many arguments"
    exit 1
fi

# if PIPE else using decp directly
if [[ -p /dev/stdin ]]; then
    if [[ $# -gt 0 ]]; then
        echo "Too many arguments"
        exit 1
    fi

    while IFS= read -r LINE; do
        to_encrypt
    done <<< $(cat -)
    IFS=$OLD_IFS
else
    IFS=''
    if [[ $# -eq 0 ]]; then
        read LINE
    else
        LINE=$1
    fi

    to_encrypt
    IFS=$OLD_IFS
fi

exit 0
