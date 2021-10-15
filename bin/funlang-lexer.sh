#!/bin/bash

# unzip the files
IFS=$'\n'
for file in *.zip
do
   unzip $file 
done

# fix the java IDE stuff
java-depackage.sh

#list the files
ls


# compile the java classes
rm -f *.class
javac *.java

# find the name of the lexer class
lexer=$(ls *xer*class | head -1)
lexer=${lexer%.*}

# run the funlang lexer
java $lexer <<EOF
PROC
BEGIN
END
PRINT x,y
WHILE
WHILEY
WHIL
IF
ELSE
[]
()
NUMBER
CHARACTER
:=
:=:
=
~=
<
<=
>
>=
+
-
*
/
**
READ
123
123.2542
"hello"
'x'
"hello\tworld\n"
'a'
'b'
'\n'
'\''
EOF
