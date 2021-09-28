#!/bin/bash
# list and compile single file C programs. Then drop into a shell for
# testing.

IFS=$'\n'
for file in $1
do
    echo 
    echo
    echo
    echo $file
    echo ==========================
    cat -n "$file"
    prog="${file%.*}"
done
