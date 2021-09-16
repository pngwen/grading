#!/bin/bash
# list and compile single file C programs. Then drop into a shell for
# testing.

IFS=$'\n'
for file in *.c
do
    echo 
    echo
    echo
    echo $file
    echo ==========================
    cat -n "$file"
    prog="${file%.*}"
    echo
    echo Compiling...
    echo gcc -o "$prog" "$file"
    gcc -o "$prog" "$file"
done

bash
