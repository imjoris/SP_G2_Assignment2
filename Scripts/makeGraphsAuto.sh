#!/bin/bash

#created docker image by running "make"
# in the root dir of the github clone.

# then, run the image with:
# docker run --privileged --rm -ti dry-run-test /bin/bash
# or, in my case:
# docker run --privileged --rm -ti docker-dev:master /bin/bash

mkdir -p png;
mkdir -p pngWithS;
mkdir -p horizonPng;
mkdir -p horizonPngWithS;



mkdir -p goviz;

find '/go/src/github.com/docker/docker/' -maxdepth 1 -type d -not -name "." | sed 's/^\s+//g' | while read -r dir; do
if [[ ! -z "$dir" ]]; then
    baseDir="${dir##*/}";
    echo "$baseDir";
    # echo "$dir";

    #godepgraph
    godepgraph github.com/docker/docker/"$baseDir" | dot -Tpng -o png/"$baseDir"Gaph.png;
    godepgraph -s github.com/docker/docker/"$baseDir" | dot -Tpng -o pngWithS/"$baseDir"Gaph.png;

    godepgraph -horizontal github.com/docker/docker/"$baseDir" | dot -Tpng -o horizonPng/"$baseDir"Gaph.png;
    godepgraph -s -horizontal github.com/docker/docker/"$baseDir" | dot -Tpng -o horizonPngWithS/"$baseDir"Gaph.png;


    #goviz
    # goviz -i github.com/docker/docker/"$baseDir" | dot -Tpng -o goviz/"$baseDir"Goviz.png
    # goviz -i github.com/docker/docker | dot -Tpng -o goviz/"$baseDir"Goviz.png

    # goviz -i github.com/docker/docker/"$baseDir" -d 1| dot -Tpng -o goviz/"$baseDir"Goviz1.png
    # goviz -i github.com/docker/docker/"$baseDir" -d 2| dot -Tpng -o goviz/"$baseDir"Goviz2.png
    # goviz -i github.com/docker/docker/"$baseDir" -d 3| dot -Tpng -o goviz/"$baseDir"Goviz3.png
fi
done


# to copy them to local machine:
# docker cp cee2374f6c79:/root/png2WithS .

