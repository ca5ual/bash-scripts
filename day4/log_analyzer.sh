#!/bin/bash

# Check if the correct number of arguments is provided
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <log_file_path>"
  exit 1
fi

# input log_file
log_file=$1

# check if the log file exist
if [ ! -f "${log_file}" ]; then
  echo "Error: log file not found: $log_file"
  exit 1
fi

#function to catch error entries in the log file
error_catcher() {
  
  # count the number of error entries in the log file "ERROR" or "FAILED" 
  # with case insensitivity
  errors=$(grep -Ei "error|failed" "${log_file}" | wc -l)
  echo "Number of error entries: ${errors}"

  # critical events
  # searches for lines containing the keywords "CRITICAL" and print those lines 
  # along with the line number
  critical=$(grep -in "critical" "${log_file}")
  echo "Critical error found: ${critical}"

  # top errror messages
  # identifies the top 5 most frequent error messages in the log file
  echo "Top 5 error messages:"
  # sorts lines alphabetically, counts unique occurences, sorts them numerically in
  # descending order, and displays the top 5
  grep -Ei "error|failed" ${log_file} | sort | uniq -c | sort -nr | head -n 5
}

# function to archive the log file
archive_log () {
  read -p "Do you want to archive the log file? (y/n): " choice
  if [[ "${choice}" = "y" || "${choice}" = "Y" ]]; then
    local archieve_name="${log_report}.tar.gz"
    tar -czf "${archieve_name}" "${log_report}"
    echo "Log file archived as: ${archieve_name}"
    rm -rf "${log_report}"
  fi
}

# function to generate a summary report
summary_report () {
  echo "-----------------------------------"
  local log_file_name=$(basename "${log_file}")
  local total_lines_processed=$(wc -l < "${log_file}")
  
  echo "$(date '+%Y-%m-%d_%H:%M:%S')"
  echo "Log file name = ${log_file_name}"
  echo "Total lines processed = ${total_lines_processed}"
  echo "-----------------------------------"
  error_catcher 
} 

# script logic starts here
# generate the report and save it to a file
log_report=("${log_file}.$(date '+%Y-%m-%d').report")
summary_report > ${log_report}
echo "Log analysis report generated: ${log_report}"
archive_log