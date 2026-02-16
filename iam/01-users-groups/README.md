# AWS IAM Automation Suite (Bash)

A set of universal, idempotent Bash scripts to automate AWS IAM user and group management. 

## 🚀 Key Features
- **Idempotency:** Scripts check if resources exist before creating/deleting to avoid errors.
- **Modular Design:** Configuration is separated from logic (`users.cfg`).
- **Pro Logging:** Color-coded terminal output (Green for SUCCESS, Yellow for INFO, Red for ERROR).
- **Universal:** Compatible with Ubuntu, RHEL, and Amazon Linux.

## 📁 Project Structure
- `user_manager.sh`: Main script for creating users, groups, and assignments.
- `cleanup.sh`: Automated teardown script to remove all created resources.
- `users.cfg`: Configuration file for environment variables.
- `colors.sh`: Utility library for colored terminal output.

## 🛠 Prerequisites
- AWS CLI installed and configured (`aws configure`).
- IAM permissions (AdministratorAccess or specific IAM policies).

## 💻 Usage

1. **Configure your variables:**
   Edit `users.cfg` to set your desired usernames and groups.

2. **Run the manager:**
   ```bash
   chmod +x *.sh
   ./user_manager.sh
