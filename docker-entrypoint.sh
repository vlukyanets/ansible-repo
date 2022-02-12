#!/bin/bash

TOOL=$1
if [ -z "$1" ] ;
then
  "$HOME/.local/bin/ansible" --help ;
elif [ -f "$HOME/.local/bin/$TOOL" ] ;
then
  "$HOME/.local/bin/$TOOL" "${@: 2}" ;
elif [ -f "$HOME/.local/bin/ansible-$TOOL" ] ;
then
  "$HOME/.local/bin/ansible-$TOOL" "${@: 2}" ;
else
  echo "No ansible tool '$TOOL'"
fi
