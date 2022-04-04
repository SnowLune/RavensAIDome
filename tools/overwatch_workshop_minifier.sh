#!/bin/bash
# overwatch_workshop_minifier.sh
# Minify Overwatch Workshop scripts from stdin or file

function rename_functions
{
   # New names for functions: a-z, A-Z, then all possible two letter combos
   min_chars=(`echo {{a..z},{A..Z},{a..z}{a..z}}`)

   # There aren't going to be more than 256 of any variable
   for i in `seq 0 255`; do
      # Iterate through functions with the current $i number
      # then rename each to their respective minified names
      for j in $(grep -e "^\s*$i:.*$" $1 | sed 's/^.*:\s*//g'); do
         sed -i "s/$j/${min_chars[$i]}/g" $1
      done
   done
}

function minify_pipe 
{
   sed 's/\/\/.*$//'        `# Remove C++ style one line comments "//"` \
   | tr '\r''\n' ' '        `# Translate newlines into spaces` \
   | tr '[:blank:]' ' '     `# Translate blanks into spaces` \
   | tr -s '[:blank:]'      `# Squeeze horizontal whitespace` \
   | sed 's/\/\*.*\*\///'   `# Remove C style comments "/* */"`
}

# Set our new name for the minified file
basename=$(echo $1 | sed 's/\..*$//')
new_file="$basename.min.ow.txt"
echo "$new_file"

# Check if it already exists and prompt for continue if it does
if [ -f $new_file ]; then
   echo
   echo "WARNING: '$new_file' already exists"
   while true; do
      read -p "Would you like to overwrite it? (y/n): " yn
      case $yn in
         [Yy]* ) break;;
         [Nn]* ) exit;;
         * ) echo "Please answer yes or no.";;
      esac
   done
fi

# Create a copy of the original file as our minified file
cp "$1" "$new_file"

# Do the minifying
rename_functions "$new_file"
cat "$new_file" | minify_pipe > "$new_file.tmp"
mv "$new_file.tmp" "$new_file"

# Get the file sizes
old_file_size=$(du -b $1)
new_file_size=$(du -b $new_file)

# All done messages
echo
echo "Wrote minified Overwatch Workshop script file '$new_file'"
echo "Old: $old_file_size"
echo "New: $new_file_size"

exit
