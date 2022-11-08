#!/bin/bash
regex='option\((BUILD_(:?[A-Z]|_)+)'
input="$HOME/uic/cmake/include/build_permutations.cmake"
while read -r line
do
    if [[ $line =~ $regex ]] && [[ ${BASH_REMATCH[1]} != "$1" ]]
    then
       printf "%s " "-D${BASH_REMATCH[1]}=OFF"
    fi
done < $input
