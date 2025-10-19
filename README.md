#  Bash Scripting Project – Summary by Days

This repository contains a set of Bash scripts created across multiple days as part of a learning and automation project.  
Each “day” includes one or more scripts demonstrating key Bash skills — loops, conditionals, file operations, process management, and automation.

---

##  **Day 1 – Explorer & Backup Rotation**

###  explorer.sh
An interactive script that lists files and directories in the current working directory.  
It displays file names with their sizes and allows the user to enter text lines to count characters interactively.

**Key skills:**  
- `ls`, `awk`, `read`, `while`, and string length operations in Bash.

###  backup_script.sh
Creates timestamped compressed backups (`.tar.gz`) of a given directory and automatically deletes older ones, keeping only the last three.

**Key skills:**  
- `tar` archiving  
- Filename timestamping with `date`  
- Conditional checks and array manipulation for rotation

---
##  **Day 2 –  User Management**

###  user_manager.sh
Manages Linux users from the command line — allows creation, deletion, listing, and password reset using flags.

**Key skills:**  
- Command-line argument parsing  
- System administration commands (`useradd`, `userdel`, `passwd`)  
- Input validation and error handling

---
##  **Day 3 – Process and System Monitoring**

###  process_monitor.sh
Checks whether a given process (service) is running using `pgrep`.  
If it isn’t, the script tries to start it automatically up to three times with `systemctl`.

**Key skills:**  
- Process management with `pgrep` and `systemctl`  
- Conditional retries and error handling

###  monitoring_script.sh
Provides an interactive menu to monitor system resource usage (CPU, memory, disk) and check or start specific services.

**Key skills:**  
- Reading user input in menus  
- Using `top`, `free`, and `df` for system stats  
- Service management with `systemctl`

---
##  **Day 4 - Analyze System Log Files**

###  log_analyzer.sh
Analyzes system log files to find error and critical messages, count occurrences, and create summary reports.  
Optionally archives the report after analysis.

**Key skills:**  
- Text processing with `grep`, `awk`, and `sort`  
- Pattern matching and file archiving with `tar`  
- Report generation with timestamps
___

##  **Day 5 – Restaurant Order System**

###  restaurant_order.sh
A fun interactive script that simulates a restaurant ordering system.  
Reads menu items from `menu.txt`, validates orders, and calculates the total bill.

**Key skills:**  
- Working with associative arrays in Bash  
- File reading and string parsing  
- Arithmetic operations and user input validation

---

##  Summary of Learned Topics

| Topic | Covered In |
|-------|-------------|
| File handling, I/O loops | Explorer, Log Analyzer |
| Archiving & backups | Backup Rotation |
| Process management | Process Monitor |
| Resource monitoring | System Monitor |
| Text parsing with grep/awk/sed | Log Analyzer |
| Arrays and user input | Restaurant Order |
| System administration basics | User Manager |

---
