# Backup Rotation Script

This Bash script creates a compressed backup of a selected directory and keeps only the three most recent backups. Older backups are automatically removed.

## How It Works
1. You run the script and provide the path to a directory you want to back up.
2. The script creates a `.tar.gz` archive with the current date and time in its name.
3. It skips existing backup files (to avoid including them again).
4. It automatically deletes older backups, keeping only the last three.

## Usage
```bash
./backup_script.sh /path/to/directory
```

### Example
```bash
./backup_script.sh ~/Documents/projects
```

### Output Example
```
✅ Backup created successfully: /home/user/Documents/projects/backup_2025-10-19_15-02-41.tar.gz
🗑️  Removing old backups:
  /home/user/Documents/projects/backup_2025-10-17_20-10-30.tar.gz
  /home/user/Documents/projects/backup_2025-10-18_09-47-15.tar.gz
```

## Requirements
- Linux or macOS terminal (or Git Bash on Windows)
- `bash` and `tar` installed

## Notes
- The script must have execute permissions. If needed, run:
  ```bash
  chmod +x backup_script.sh
  ```
- Make sure you have write permissions in the target directory.
- Backups are stored in the same folder as the original directory.

---

Simple as that — run it, and it will create backups automatically while cleaning up the old ones.
