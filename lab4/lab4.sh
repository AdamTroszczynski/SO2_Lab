#/bin/bash

$(./fakaping.sh > /dev/null | sort)
$(./fakaping.sh 2> /dev/null | sort -u > all.log)
cat all.log


awk -F ',' '$1 % 2 != 0 {print}' yolo.csv 1>&2
awk -F ',' '$6 ~ /^[0-9]\.[0-9]\./ {print $6}' yolo.csv 1>&2

for file in ./groovies/*
do
    sed -i 's/\$header\/&/\/temat\//g' "$file"
done