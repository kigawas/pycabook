#!/bin/bash

rm -fR manuscript/*

for i in src/*.mau;
do
    chapter=$(basename ${i/.mau/} | sed -r -e s,"^[0-9]+_",, -e s,"_"," ",g)
    output=manuscript/$(basename ${i/.mau/.md})
    mau -i ${i} -o ${output} -f markua --verbose
    sed -i 1s/^/"# ${chapter}\n\n"/ ${output}
done

ls -1 manuscript/*.md | xargs -n1 basename > manuscript/Book.txt

mkdir -p manuscript/images/pycabook
cp -R images/* manuscript/images/pycabook
