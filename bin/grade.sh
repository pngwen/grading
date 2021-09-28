#!/bin/bash
# Grading Script. Extract submissions.zip, make directories, and then
# run the specified command inside of each directory

# get the command to run in each directory 
if [ $# -lt 1 ]; then
  command=bash
else
  command=$@
fi

# unzip the submissions
unzip submissions.zip

# get the list of students
students=`ls *_* | cut -d_ -f1 | sort | uniq`

# go through each student 
for student in $students
do
    # make the directory if needed
    if [ ! -e $student ]; then
      mkdir $student
    fi

    # move the student's files into their directory
    mv ${student}_* $student/.

    # run filename
    runfile=${student}-run.pdf
    scriptfile=${student}-run.txt

    # don't grade the already graded
    if [ ! -e $student/$runfile ]; then 
        #enter dumb terminal mode
        export TERM=dumb
        pushd $student
        script -c "$command" $scriptfile
        text2pdf $scriptfile > $runfile
        popd 
    fi
done
