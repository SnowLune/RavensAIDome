#!/bin/bash
# trim_trailing_whitespace.sh
# Find and trim trailing whitespace from project source
find . -type f -iregex '\(.*.ow\|.*.owh\|.*Makefile\|.*.sh\)' \
         -exec sed -i 's/\s\+$//g' '{}' \;

exit
