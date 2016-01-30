#!/bin/bash

file='report';

#rubber -d $target
pdflatex "$file" > /dev/null
pdflatex "$file" > /dev/null
makeglossaries "${file%.*}" > /dev/null
rubber -d "$target";
