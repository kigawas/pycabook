#!/bin/bash

rm -fR manuscript/*

for i in src/*.mau;
do
    mau -i ${i} -o manuscript/$(basename ${i/.mau/.md}) -f markua --verbose
done

ls -1 manuscript/*.md > manuscript/Book.txt

mkdir manuscript/resources
cp -R images/* manuscript/resources/
