# Log Analyzer Script

This Bash script analyzes log files to identify errors, count occurrences, and generate a detailed summary report.  
It also allows optional archiving of the generated report.

## Features
- Counts the number of lines containing **"ERROR"** or **"FAILED"** (case-insensitive).
- Displays any **critical** log entries (with line numbers).
- Lists the **top 5 most frequent error messages**.
- Generates a timestamped **summary report** with total line count and log statistics.
- Offers the option to **archive** the report into a `.tar.gz` file.

## Usage
```bash
./log_analyzer.sh <log_file_path>
```

### Example
```bash
./log_analyzer.sh /var/log/syslog
```
**Output Example:**
```
-----------------------------------
2025-10-19_16:35:50
Log file name = syslog
Total lines processed = 54210
-----------------------------------
Number of error entries: 47
Critical error found:  [line 2483] CRITICAL - Disk space low
Top 5 error messages:
   12 ERROR connection refused
    5 FAILED login attempt
    3 ERROR timeout
    2 ERROR file not found
    1 FAILED service start
Log analysis report generated: /var/log/syslog.2025-10-19.report
Do you want to archive the log file? (y/n): y
Log file archived as: /var/log/syslog.2025-10-19.report.tar.gz
```
## Notes
- Reports are timestamped and saved in the same directory as the original log.
- The script safely removes the report file after archiving.
- Useful for quick diagnostics and log maintenance tasks.
