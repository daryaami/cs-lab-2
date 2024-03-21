#!/bin/bash

IFS='.' read -a parts <<< "$1"

decimal_to_binary() {
    local decimal=$1
    local binary=""
    for (( i=7; i>=0; i-- )); do
        binary=$((decimal >> i & 1))
        printf "$binary"
    done
}

binary_ip=""
for part in "${parts[@]}"; do
    binary_ip+="$(decimal_to_binary "$part")."
done

binary_ip="${binary_ip%?}"

echo "$binary_ip"