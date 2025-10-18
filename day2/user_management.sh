#!/bin/bash

# account creation function

usage_info() {
  echo "Usage: $0 [OPTION]"
  echo ""
  echo -e "\tOptions:\n"
  echo -e "\t-c, --create\t Add a new user."
  echo -e "\t-r, --reset\t Reset the password for an existing user."
  echo -e "\t-l, --list\t List all existing user accounts."
  echo -e "\t-d, --delete\t Delete the user."
  echo -e "\t-h, --help\t Display this help message" 
}

# function to create a new user
create_user() {
  read -p "Enter the new username: " username
#check if user already exists
  if id "${username}" 2> /dev/null; then
    echo "User ${username} already exists. Please choose a different username."
    exit 1
  fi
  read -sp "Enter the password for ${username}: " password
  useradd -m -d /home/$username "$username" && echo "$username:$password" | sudo chpasswd
  [ $? -eq 0 ] && echo -e "\nUser ${username} created successfully."
}

# function to delete a user
delete_user() {
    read -p "Enter the username to delete: " username
#delete only if user exists
    if id "${username}" 2> /dev/null; then
      userdel -r "${username}"
      [ $? -eq 0 ] && echo "User ${username} deleted successfully."
    else
      echo "User ${username} does not exists."
      exit 1
    fi
}

# function to reset user password
reset_password() {
  read -p "Enter the username to reset password: " username
#reset only if user exists
  if id "${username}" 2> /dev/null; then
    read -sp "Enter the new password for ${username}:" password
    echo -e "$username:$password" | sudo chpasswd
    [ $? -eq 0 ] && echo -e "\nPassword for user ${username} reset successfully."
  else
    echo "User ${username} does not exists."
    exit 1
  fi
}

# function to list all users
list_users() {
  echo "User accounts on the system:"
  awk -F ':' '{print $1}' /etc/passwd
}

# check if no arguments were provided
if [[ $# -eq 0 ]]; then
  usage_info
  exit 1
fi

#script logic
while [ $# -gt 0 ]; do
  case "$1" in
    -c|--create) create_user ;;
    -d|--delete) delete_user ;;
    -r|--reset) reset_password ;;
    -l|--list) list_users ;;
    -h|--help) usage_info exit 0 ;;
    *) echo "Invalid option: $1"; usage_info; exit 1 ;;
  esac
  shift
done
