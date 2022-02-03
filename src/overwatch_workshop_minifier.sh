#!/bin/bash
# Minify Overwatch Workshop scripts from stdin or file

if [ $# -eq 0 ]; then
   echo "No arguments given. Using stdin..."
   sed 's/\s\+/ /g' | tr -ds '\r''\n' '[:blank:]'

else
   basename=$(echo $1 | sed 's/\..*$//')
   cat "$1" | sed 's/\s\+/ /g' | tr -ds '\r''\n' '[:blank:]' > "$basename.min.workshop"
fi

exit
