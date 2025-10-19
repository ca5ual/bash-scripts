# User Account Management Script

## 🔧 Overview
A simple Bash utility for managing Linux user accounts — create, delete, list, or reset passwords via interactive prompts.

---

## ⚙️ Usage
```bash
chmod +x user_manager.sh
sudo ./user_manager.sh [OPTION]
```

### Options
| Flag | Description |
|------|--------------|
| `-c`, `--create` | Add a new user. |
| `-r`, `--reset` | Reset password for an existing user. |
| `-l`, `--list` | List all user accounts. |
| `-d`, `--delete` | Delete a user account. |
| `-h`, `--help` | Show usage info. |

---

## 🧠 Examples
```bash
sudo ./user_manager.sh -c      # Create user
sudo ./user_manager.sh -r      # Reset password
sudo ./user_manager.sh -l      # List users
sudo ./user_manager.sh -d      # Delete user
```

---

## ⚠️ Notes
- Requires **sudo privileges** for account modifications.  
- User home directory is created automatically under `/home/username`.  
- Exits gracefully with messages for invalid inputs.

---

