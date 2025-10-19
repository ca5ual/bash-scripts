#!/bin/bash

# function that monitors the CPU, memory, and disk usage
monitor_resources() {

  # cpu usage  
  # user + sys -> total CPU in active use
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

  # memory usage
  # used/total * 100 -> the % of memory used
  mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

  # disk space usage
  # to get overall disk usage
  disk_usage=$(df --total -h | grep 'total' | awk '{print $5}')
 
  echo "CPU Usage: ${cpu_usage}%  Mem Usage: ${mem_usage}%  Disk Usage: ${disk_usage}"
}


# function that monitors a specific service
# service name provided by user
# starts the service if not running 
monitor_service () {
  echo "Monitor a Specific Service"
  read -p "Enter the service name to monitor: " service_name
  # check if the specified service is running    
  if systemctl is-active --quiet ${service_name}; then
    echo "Service ${service_name} is running."
  else
    echo "Service ${service_name} is not running."
    read -p "Do you want to start the service ${service_name}? (y/n)" choice
    if [[ "${choice}" == "y"]] || [[ "${choice}" == "Y" ]]; then
      sudo systemctl start "${service_name}"
      if [[ $? -eq 0 ]]; then
        echo "Service ${service_name} started successfully."
      else 
        echo "Erorr: failed to start service ${process_name}."
      fi
  fi
}

# main script logic
# loop until user chooses to exit
while true; do 
  echo "--- Monitoring Metrics Script ---"
  echo -e "/t1. Monitor System Resources"
  echo -e "/t2. Monitor a Specific Service"
  echo -e "/t3. Exit"

  read -p "Chooce an option (1-3): " option

  case ${option} in
    1) monitor_resources ;;
    2) monitor_service ;;
    3) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option. Please choose again." ;;
  esac
done