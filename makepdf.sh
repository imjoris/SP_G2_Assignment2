#!/bin/bash

doMakePdf(){

##############################
## PARAMETERS
##############################
name='report'
outputDir='myBuild'

#Set them if supplied
if [[ ! -z $1 ]]; then
    name=$1;
fi
if [[ ! -z $2 ]]; then
    outputDir=$2;
fi

##############################
## Set options
##############################

mkdir -p ${outputDir}

dateNow="date +%m-%d__%H:%M"
outputName="${name}_$(eval $dateNow)"

latexInBuildDir="-output-directory=${outputDir}"
# -aux-directory=${outputDir}"
latexcommand="pdflatex -output-directory=${outputDir} -interaction=nonstopmode --enable-write18"
# -aux-directory=${outputDir} -interaction=nonstopmode"
mycmd="${latexcommand} $name"

##############################
## EXECUTE COMMANDS
##############################
$mycmd
\rm ./${outputDir}/library.bib
\cp ./library.bib ${outputDir}
(cd ${outputDir}; bibtex $name;);
(cd ${outputDir}; makeglossaries $name;);
$mycmd
$mycmd
(cd ${outputDir}; cp "${name}.pdf" "${outputName}.pdf");

}

doMakePdf $1 $2 | grep error
