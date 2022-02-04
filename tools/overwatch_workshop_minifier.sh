#!/bin/bash
# Minify Overwatch Workshop scripts from stdin or file

function minify_pipe 
{
   sed 's/\/\/.*$//'        `# Remove C++ style one line comments "//"` \
   | tr '\r''\n' ' '        `# Translate newlines into spaces` \
   | tr '[:blank:]' ' '     `# Translate blanks into spaces` \
   | tr -s '[:blank:]'      `# Squeeze horizontal whitespace` \
   | sed 's/\/\*.*\*\///'   `# Remove C style comments "/* */"`
}

if [ $# -eq 0 ]; then
   # No arguments given. Using stdin...
   minify_pipe
else
   basename=$(echo $1 | sed 's/\..*$//')
   cat "$1" | minify_pipe > "$basename.min.workshop"
fi

exit
