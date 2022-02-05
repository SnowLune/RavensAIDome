#!/bin/bash

find . -type f -iregex '\(.*.ow\|.*.owh\|.*Makefile\|.*.sh\)' \
   -exec sed -i 's/\s\+$//g' '{}' \;

exit
