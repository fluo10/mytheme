#!/bin/bash
function replace () {
    if [ $# -eq 1 ]; then
        local DIR="$1/*"
    else
        local DIR="$PWD/*"
    fi
    local FILE
    for FILE in $DIR;do
        if [ ${FILE: -3} == ".md" ]; then
            sed -i -r -e 's/!\[(.*)\]\((.*)\)/{{ image(src="\2", alt="\1") }}/' $FILE
        elif [ -d $FILE ]; then
            replace $FILE
        fi
    done
}
replace ./content