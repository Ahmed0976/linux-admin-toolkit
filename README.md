# Linux Admin Toolkit

A Bash-based toolkit designed to simplify common Linux system administration tasks through an interactive menu-driven interface.

## Features

* Display current date and time
* Display hostname
* Display current user
* Display current working directory
* Display disk usage
* Display memory usage
* Display CPU information
* Display IP address
* Check if a file exists
* Check if a directory exists
* Search for keywords inside log files
* Create compressed backups using `tar`
* Log all user actions with timestamps

## Screenshots

### Main Menu

![Main Menu](assets/screenshots/main-menu.png)

### Features Demo

![Features Demo](assets/screenshots/features-demo.png)

### Backup Demo

![Backup Demo](assets/screenshots/backup-demo.png)

## Project Structure

```text
linux-admin-toolkit/
├── assets/
│   └── screenshots/
├── backups/
├── logs/
├── toolkit.sh
├── README.md
├── LICENSE
└── .gitignore
```

## Requirements

* Linux Operating System
* Bash Shell
* tar
* grep
* coreutils

## Installation

Clone the repository:

```bash
git clone https://github.com/Ahmed0976/linux-admin-toolkit.git
```

Move to the project directory:

```bash
cd linux-admin-toolkit
```

Make the script executable:

```bash
chmod +x toolkit.sh
```

Run the toolkit:

```bash
./toolkit.sh
```

## Usage

After starting the script, an interactive menu will be displayed.

Select the desired option by entering its corresponding number.

The toolkit allows you to:

* View system information
* Verify files and directories
* Search inside log files
* Create compressed backups
* Record user actions in log files

## Menu Options

| Option | Description            |
| ------ | ---------------------- |
| 1      | Show Date              |
| 2      | Show Hostname          |
| 3      | Show Current User      |
| 4      | Show Current Directory |
| 5      | Show Disk Usage        |
| 6      | Show Memory Usage      |
| 7      | Show CPU Usage         |
| 8      | Show IP Address        |
| 9      | Check File             |
| 10     | Check Directory        |
| 11     | Search in Log          |
| 12     | Backup Directory       |
| 13     | Exit                   |

## Logging

The toolkit records user actions inside:

```text
logs/toolkit.log
```

Each log entry contains:

* Timestamp
* Username
* Action performed

Example:

```text
2026-07-01 10:30:15 | ahmed | Show Date
```

## Backup Functionality

The backup feature:

1. Validates the source directory.
2. Creates a compressed archive using `tar`.
3. Stores backups inside the backups directory.
4. Logs successful and failed backup operations.

Generated backup example:

```text
backups/project_20260701_120000.tar.gz
```

## Future Improvements

* Restore backup functionality
* System monitoring dashboard
* Network diagnostics tools
* Colored terminal interface
* Configuration file support
* Email notifications

## Lessons Learned

This project helped strengthen practical skills in:

* Bash Scripting
* Functions
* Conditional Statements
* Loops
* Case Statements
* User Input Handling
* File Operations
* Logging
* Backup Automation
* Linux Administration

## Author

Ahmed Saied

Cybersecurity Student | Cloud & DevOps Learner

GitHub: https://github.com/Ahmed0976

## License

This project is licensed under the MIT License.

