#!/bin/bash

chars=(
    "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
    "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M"
    "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
    "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m"
    "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
    "\"" "#" "\$" "%" "&" "'" "(" ")" "{" "}" "[" "]" "+" "-" "*" "¬"
    "/" "\\" "." "," ":" ";" "<" "=" ">" "!" "?" "_" "|" "§" "~" " "
    "‖" "•" "‣" "※" "⁂" "⁋" "⁕" "₧" "₪" "₯" "ℇ" "ℋ" "ℌ" "ℒ" "ℜ" "℞"
    "Ω" "ℨ" "℩" "ℬ" "ℵ" "ℹ" "ℼ" "ℽ" "ℿ" "⅀" "⅌" "⅏" "⅐" "⅑" "⅔" "⅞"
    "←" "↑" "→" "↓" "↖" "↗" "↘" "↙" "⇒" "∂" "∅" "∇" "∈" "∎"
)

function encrypt {
    local out=""
    for ((i=1; i<=$1; i++)); do
        out+="\e[32m${chars[RANDOM % ${#chars[@]}]}"
    done
    echo -e "$out"
}

printf "%s" "$(encrypt $1)"