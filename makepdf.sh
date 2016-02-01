#!/bin/bash

file='report';

# rubber -d $target
 pdflatex "$file"
 pdflatex "$file"
 bibtex "$file";
 makeglossaries "${file%.*}"
 pdflatex "$file";
 # rubber -d "$file";

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


