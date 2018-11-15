#!/bin/bash
totalNumberOflines=0
folderName=""
totalFileNum=0

function check {
    for file in $1/*
    do
    if [ -d "$file" ]
    then
            folderName=$file
            check $file
						folderName=""
    else
           ##check for the file
          if [ "${file##*.}" == "md" ]
          then
					  wordCount=$(textutil -convert txt -stdout $file | wc -l)
					  fileName=${file##*/}
					  echo "$wordCount, $fileName, $folderName"
					  totalNumberOflines=`expr $totalNumberOflines + $wordCount`
					  totalFileNum=`expr $totalFileNum + 1`
					fi
    fi
    done
}
domain=/Users/ymmtny/Documents/GitHub/making_visual_sotrytelling_app_with_kwik/en/
check $domain

echo "Total number of lines: $totalNumberOflines, number of files: $totalFileNum"