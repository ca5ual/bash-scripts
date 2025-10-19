# Process Monitor and Auto-Restarter Script

This Bash script checks whether a specified process is currently running on the system.  
If it is not running, the script automatically tries to start the process up to **three times** using `systemctl`.

## How It Works
1. You provide a process name as a command-line argument.
2. The script checks if the process is active using `pgrep`.
3. If the process is not found, it attempts to start it three times.
4. If it still fails, it displays an error message and exits.

## Usage
```bash
./process_monitor.sh <process_name>
```

### Example
```bash
./process_monitor.sh nginx
```
**Output Example:**
```
Process apache2 is not running.
Attempting to start process apache2...
Process nginx started successfully.
```

## Notes
- The script retries automatically with a 5-second delay between attempts.
- If all attempts fail, it will ask the user to start the process manually.
