#!/bin/bash

# fileToSPlit='patterns.tex'
fileToSPlit='evaluation.tex'
newSplitFile='new-'"$fileToSPlit";

prevLine='';
prevFName='';
prevSec=''

(grep -nr 'subsection{' "$fileToSPlit" | 

while read -r i; do
    lineNum=$(echo "$i" | cut -d : -f 1);
    secLineLimit="$(( lineNum-1 ))";
    
    secName="${i#*\{}";
    secName="${secName%\}*}";
    
    #replace illegal chars

    # echo "section: $secName";

    
    if [[ ! -z $prevLine ]]; then
        echo '';
        echo '##############################'
        echo "$prevLine"'-'"$secLineLimit";
        fName=$(echo "$prevSec" | sed -e 's/[^A-Za-z0-9._-]/_/g')'.tex';
        sed -n "$prevLine"','"$secLineLimit"'p' "$fileToSPlit" > "$fName";
        echo '\input{6-evaluation/'"$fName"'}' >> "$newSplitFile";
        
        

    # else
        # sed -n '^,'"$secLineLimit"'p' "$fileToSplit" > "$newSplitFile";

    fi

        prevSec="$secName";
        prevLine="$lineNum";

done)
        # fName=$(echo "$prevSec" | sed -e 's/[^A-Za-z0-9._-]/_/g')'.tex';
        # echo "$prevLine";
        # echo "$prevSec";

        # sed -n "$prevLine"',$p' "$fileToSPlit" > "$fName";
        # echo '\input{'"$fName"'}' >> "$newSplitFile";


