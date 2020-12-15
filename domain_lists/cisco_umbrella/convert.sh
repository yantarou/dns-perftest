#!/usr/bin/env bash

file="cisco-umbrella_top-1m_2020-12-14.csv"
dos2unix ${file}
while read -r line; do
    [[ "${line}" =~ ^#.*$ ]] && continue
    domain=$(echo ${line} | cut -d "," -f 2)
    echo "${domain} A" >> cisco-umbrella_top-1m_2020-12-14.qd.txt
done < "${file}"
