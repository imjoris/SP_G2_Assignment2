#!/bin/bash

file='report';

# rubber -d $target
 pdflatex "$file" > /dev/null
 pdflatex "$file" > /dev/null
 makeglossaries "${file%.*}" > /dev/null
 rubber -d "$file";

# backupDir='/home/joris/RugP22/SoftwarePatterns/pdfBackup/'
backupDir='../pdfBackup'
mkdir -p "$backupDir";

backupDir=$(cd "$backupDir"; pwd);

# echo $backupDir;

now=$(date +"%H-%M__%m-%d-%Y");
newFName="$bacupDir"'/report-'"$now"'.pdf';
# # mkdir -p "$backupDir";

cp "$file"'.pdf' "${backupDir}";
(cd "${backupDir}"; mv "${file}"'.pdf' "report-$now"'.pdf';)


