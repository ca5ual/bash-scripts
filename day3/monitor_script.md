# System Monitoring Script

This Bash script provides an **interactive menu** to monitor system resources (CPU, memory, and disk usage) and check the status of specific services.  
It can also attempt to start a service if it's found to be inactive.

## Features
- Displays **CPU**, **memory**, and **disk** usage in real-time.
- Allows the user to **check if a specific service is running**.
- Offers the option to **start a stopped service** using `systemctl`.
- Interactive text-based menu for easy navigation.

## Usage
```bash
./monitoring_script.sh
```
When you run the script, you’ll see a menu like this:

```
--- Monitoring Metrics Script ---
1. Monitor System Resources
2. Monitor a Specific Service
3. Exit
```

### Example Output
```
--- Monitor System Resources ---
CPU Usage: 4.3%  Mem Usage: 27.1%  Disk Usage: 62%
```

If you choose option **2**, you can enter a service name (like `apache2` or `sshd`) and decide whether to start it if it’s not active.
