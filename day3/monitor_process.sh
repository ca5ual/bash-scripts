#!/bin/bash

# help info
usage_info() {
  echo "Usage: $0 <process_name>"
}

# Check if process name is provided
if [ $# -eq 0 ]; then
  echo "Error: please provide a process name"
  usage_info
  exit 1
fi

process_name="$1"

# check if the specified process is running
# pgrep return nothing if the process not found
process_check() {
  if pgrep -x "${process_name}" > /dev/null; then
    echo "Process ${process_name} is running."
  else
    echo "Process ${process_name} is not running."
    running_process
  fi
}

# running process if not
# the function will attempt to restart the process automatically
# for three times
running_process() {
  echo "Attempting to start process ${process_name}..."
  local attempts=3
  for (( i=1; i<=attempts; i++ )); do
    sudo systemctl start "${process_name}"
    if [ $? -eq 0 ]; then
      echo "Process ${process_name} started successfully."
      return 0
    # check if the process name is valid 
    elif [ $? -ne 0 ]; then
      echo "Error: process name not found."
      exit 1
    else
      echo "Restart attempt $((i+1)) failed. Retrying..."
      sleep 5
    fi
  echo "Error: try to start process ${process_name} manually"
  done
}


#script logic
process_check

