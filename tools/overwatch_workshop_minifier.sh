#!/bin/bash
# Minify Overwatch Workshop scripts from stdin or file

function minify_pipe 
{
   sed \
      -e 's/\/\/.*$//'           `# Remove C++ style one line comments "//"` \
      -e 's/\s\+/ /g'            `# Truncate whitespace to 1 space` \
   | tr -ds '\r''\n' '[:blank:]' `# Remote all newlines and squeeze whitespace` \
   | sed 's/\/\*.*\*\///'        `# Remove C style comments "/* */"`
}

if [ $# -eq 0 ]; then
   # No arguments given. Using stdin...
   minify_pipe
else
   basename=$(echo $1 | sed 's/\..*$//')
   cat "$1" | minify_pipe > "$basename.min.workshop"
fi

exit
