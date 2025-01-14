#!/bin/bash
#
# This script creates a C/C++ project template by reading an xml document.
#
DIR="cfg"

function xmlAnalizer {
    echo "Analizing ${1#*/} !"
    if [ -e $1 -a -s $1 ]; then
        RCTR=1
        while IFS= read -r row
        do
            if [ $RCTR -eq 1 ]; then
                if ! [[ $row =~ "<?xml version="+.+"?>"? ]]; then
                    echo "No XML declaration."
                    break
                fi
            else
                if ! [[ $row =~ "<!--"+.+"-->"? ]]; then
                    if [[ $row =~ "<project name="+'"'+.+'"'+.+">"? ]]; then
                        PRJDIR=${row#*'"'}
                        PRJDIR=${PRJDIR%'"'*}
                        if [ ! -e $PRJDIR ]; then
                            mkdir $PRJDIR
                            cd $PRJDIR
                        else
                            echo "Directory already exist."
                            break
                        fi
                    elif [[ $row =~ "<folder name="+'"'+.+'"'+.+">"? ]]; then
                        DIR=${row#*'"'}
                        DIR=${DIR%'"'*}
                        if [ ! -e $DIR ]; then
                            mkdir $DIR
                            cd $DIR
                        fi
                    elif [[ $row =~ "</folder>"? ]]; then
                        cd ..
                    elif [[ $row =~ "</project>"? ]]; then
                        cd ..
                    fi
                fi
            fi
            RCTR=$((RCTR+1))
        done < $1
        echo "Project generated"
    else
        echo "$1 document is empty!"
    fi
}

echo "Welcome to C/C++ project generator"
if [ -d $DIR ]; then
    if [ $# -eq 0 ]; then
        CTR=0
        for xmlfiles in $(ls $DIR/*.xml); do
             xmlAnalizer $xmlfiles
             CTR=$((CTR+1))
        done
        if [ $CTR -eq 0 ]; then
             echo "Required .xml file does not exist."
        fi
    else
        echo "No parameters are required."
    fi
else
        echo "Required cfg/ folder does not exist."
fi
