#!/bin/bash

# usage information function
display_usage() {
  echo "Usage:$0 /path/to/source_directory"
}

# Check if a valid dir path is provided 
if [[ $# -eq 0 ]] || [[ ! -d "$1" ]]; then
  echo "Error: Please provide a valid directory path as a command-line argument."
  display_usage
  exit 1
fi

source_dir="$1" # directory to backup


# function to create a timestamped backup folder
create_backup() {
  local timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
  local backup_dir="${source_dir}/backup_${timestamp}" 

#create a compressed tarball of the source directory excluding previous backups
  tar -czf "${backup_dir}.tar.gz" --exclude='backup_*.tar.gz' -C "$source_dir" . 2> /dev/null 

# check if the tar command was successful
  tar_status=$?
  if [ $tar_status -eq 2 ]; then
    echo "Error: Backup creation failed."
    exit 1
  else
    echo "Backup created succesfully: $backup_dir"
  fi
}


# function to perform the rotation and keep only the last 3 backups
perform_rotation() {
  local backups=($(ls -t "${source_dir}/backup_"* 2>/dev/null)) #list existing backups sorted by timestamp

  if [ "${#backups[@]}" -gt 3 ]; then
    local backups_to_remove="${backups[@]:3}" # get backups beyong the last 3
    rm -rf "${backups_to_remove[@]}" # remove the oldest backup
  fi 
}


# script logic
create_backup
perform_rotation
