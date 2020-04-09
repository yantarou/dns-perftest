#!/usr/bin/env bash

file="suspiciousdomains_High.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> suspiciousdomains_High.qd.txt
done < "$file"

file="suspiciousdomains_Medium.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> suspiciousdomains_Medium.qd.txt
done < "$file"

file="suspiciousdomains_Low.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> suspiciousdomains_Low.qd.txt
done < "$file"
