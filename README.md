# DeCipher

Print output with a cool hacker-like effect.

## Install
1. Clone this repository
2. Run `./install.sh` from inside the repository
3. That's it!

## Usage
You can pass text through arguments or STDIN, like this:
1. `decp` (waits for input)
2. `decp "hello world"`
3. `echo "hello world" | decp`
4. `cat filename | decp`

*Note: Decryption speed is proportional to line length, and long lines may cause glitches.*
