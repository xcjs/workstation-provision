#!/bin/bash

grep -vE "^(\s*$|#)" $1 | while read -r line ; do
    echo $line
done
