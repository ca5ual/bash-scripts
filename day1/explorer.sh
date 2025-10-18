#!/bin/bash
  
# List files and dirs in the current path 
echo "Welcome to the Interactive File and Directory Explorer!"
# show us only name and size fields 
ls -lhS | awk 'NR>1 {printf " - %s (%s)\n", $9, $4}'

# part 2, creating a counter of words in line
while true; do
  read -p "Enter a line of text (Press Enter without text to exit): " input

  if [ -z "${input}" ]; then  
  echo "Exiting the Interactive Explorer. Goodbye!"
  break
  fi

  counter=${#input}
  echo "Character Count: $counter"

done

