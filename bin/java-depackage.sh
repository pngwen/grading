#!/bin/bash

export IFS=$'\n'
for file in `find . -name '*.java'`
do
  fname=`basename "$file"`
  cp "$file" .
  sed -i 's/^.*package/\/\/package/' "$fname"
done
