#!/usr/bin/env bash

file="sans-isc_suspiciousdomains-high_2020-04-08.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> sans-isc_suspiciousdomains-high_2020-04-08.qd.txt
done < "$file"

file="sans-isc_suspiciousdomains-medium_2020-04-08.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> sans-isc_suspiciousdomains-medium_2020-04-08.qd.txt
done < "$file"

file="sans-isc_suspiciousdomains-low_2020-04-08.txt"
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    echo "${line} A" >> sans-isc_suspiciousdomains-low_2020-04-08.qd.txt
done < "$file"
