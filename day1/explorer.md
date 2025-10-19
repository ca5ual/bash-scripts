# Interactive File and Directory Explorer

## 🧭 Overview
This Bash script is an **interactive command-line tool** that helps users:
1. View files and directories in the current path (with human-readable sizes).
2. Interactively enter text lines and get their **character count**.

It combines basic Bash operations, `ls`, `awk`, and user input loops to illustrate essential scripting concepts.

---

## ⚙️ Features
- Lists all files and directories in the current working directory.  
- Displays file sizes in a **readable format** (e.g., KB, MB, GB).  
- Continuously prompts the user to type lines of text and counts the number of characters in each line.  
- Gracefully exits when the user presses **Enter** on an empty line.

---

## 🧩 How It Works
1. **File Listing:**  
   Uses `ls -lhS` to list files by size, piping output through `awk` to extract only file names and sizes.
   ```bash
   ls -lhS | awk 'NR>1 {printf " - %s (%s)\n", $9, $4}'
   ```

2. **Interactive Loop:**  
   Starts a `while true` loop that:
   - Reads a line of input (`read -p "Enter a line of text..." input`).
   - Checks if input is empty (`if [ -z "${input}" ]; then`).
   - Prints the **character count** using `${#input}`.

---

## 🖥️ Usage
Make the script executable and run it:

```bash
chmod +x explorer.sh
./explorer.sh
```

Example output:
```
Welcome to the Interactive File and Directory Explorer!
 - script.sh (1.2K)
 - notes.txt (512B)
 - projects (4.0K)
Enter a line of text (Press Enter without text to exit): Hello world
Character Count: 11
Enter a line of text (Press Enter without text to exit):
Exiting the Interactive Explorer. Goodbye!
```