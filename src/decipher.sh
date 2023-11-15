#!/bin/bash

# Encryption and decryption animation
function to_encrypt() {
    # Input length
    LEN=${#LINE}

    # Decryption time is faster when text is longer
    DECR_SLEEP=$(awk "BEGIN {print ($LEN)/($LEN*$LEN)}")

    # Encryption animation
    for RUN in {0..9}; do
        # Call the Perl encryption script and display the animation
        INIT=$(perl ~/.DeCipher/src/encrypter.pl "$LEN")
        echo -e -n "\r\033[0K$INIT"
        sleep 0.1
    done

    # Decryption animation
    TEMP=""
    for ((CHAR = 1; CHAR <= LEN; CHAR++)); do
        # Build the temporary string during decryption animation
        TEMP+=${LINE:CHAR - 1:1}
        # Call the Perl encryption script and display the animation
        INIT=$(perl ~/.DeCipher/src/encrypter.pl $((LEN - CHAR)))
        echo -e -n "\r\033[0K$TEMP$INIT"
        sleep "$DECR_SLEEP"
    done

    # Newline
    echo ""
}

# Save the current Internal Field Separator (IFS) value
OLD_IFS=$IFS

# Check the number of command-line arguments
if [[ $# -gt 1 ]]; then
    echo "Too many arguments"
    exit 1
fi

# Check if input is coming from a pipe
if [[ -p /dev/stdin ]]; then
    # Check for additional command-line arguments when using stdin
    if [[ $# -gt 0 ]]; then
        echo "Too many arguments"
        exit 1
    fi

    # Read input line by line and perform encryption/decryption
    while IFS= read -r LINE; do
        to_encrypt
    done < <(cat -)
else
    # If no is found, set IFS to an empty string
    IFS=''

    # Read input from command-line argument or stdin if no argument is provided
    LINE=${1:-$(< /dev/stdin)}

    # Perform encryption/decryption
    to_encrypt
fi

# Restore the original IFS value
IFS=$OLD_IFS

exit 0
