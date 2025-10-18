#!/bin/bash

usage_info() {
  echo "Usage: $0 <process_name>"
}

# Check if process name is provided
if [ $# -ne 1 ] then
  echo "Error: Please provide a process name to monitor."
  usage_info
  exit 1
fi


#check if the specified process is running
process_check() {
local process_name="$1"
#if the process is found, pgrep returns pids, otherwise returns nothing
  if pgrep -x "${process_name}" > /dev/null; then
    echo "Process ${process_name} is running."
    exit 0
  else
    echo "Process ${process_name} is not running."
    running_process
  fi
}


restarting_process() {
  echo "Attempting to start process ${process_name}..."
  local attempts=3
  #the script will attempt to restart the process automatically for three times
  for (( i=1; i<=attempts; i++ )); do
    systemctl start "${process_name}"
    if [ $? -eq 0 ]; then
      echo "Process ${process_name} restarted successfully."
      return
    else
      echo "Restart attempt $((i+1)) failed. Retrying..."
      sleep 5
    fi 
  done
}




