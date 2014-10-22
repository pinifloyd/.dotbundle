#!/bin/bash

# i_mode=false # interactive mode
# v_mode=false # verbose mode

# function timestamp {
#   echo date '+%s'
# }

# while [ $# -gt 0 ]; do
#   case $1 in
#     -i | --interactive) i_mode=true ;;
#     -v | --verbose)     v_mode=true ;;
#     -h | --help)        cat $(dirname $0)/help.txt;  exit 0 ;;
#     *)                  echo "Invalid argument: $1"; exit 1 ;;
#   esac
#
#   shift
# done

if [ ! -d $(dirname $0)/backup ]; then
  mkdir $(dirname $0)/backup

  for file in $(dirname $0)/bundle/.*; do
    if [ -f $file ]; then
      filename=$(basename $file)

      if [ -s ~/$filename ]; then
        mv ~/$filename $(dirname $0)/backup/$filename
      fi
      
      ln -s $file ~/$filename
    fi
  done
fi

exit 0