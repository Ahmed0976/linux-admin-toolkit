#!/bin/env bash
#linux-admin-toolkit
#ahmed saied

LOG_FILE="logs/toolkit.log"
BACKUP_DIR="backups"
mkdir -p logs
mkdir -p "$BACKUP_DIR"

log_action() {
    	local action="$1"
	local current_date
	local current_user

	current_date=$(date "+%Y-%m-%d %H:%M:%S")
	current_user=$(whoami)

    	echo "$current_date | $current_user | $action" >> "$LOG_FILE"
}

show_Date() {
	log_action "Show Date"
	date
}

show_Hostname() {
	log_action "Show Hostname"
	hostname
}

show_User() {
	log_action "Show User"
	whoami
}

show_Directory() {
	log_action "Show Directory"
	pwd
}

show_Disk() {
	log_action "Show Disk usage"
	df -h
}

show_Memory() {
	log_action "Show Memory"
	free -h
}

show_CPU() {
	log_action "Show CPU"
	lscpu | grep "Model name"
}

show_IP() {
	log_action "Show IP"
	ip -4 addr show
}

check_File() {
	local file
	read -p "Enter File path: " file

    if [[ -f "$file" ]]; then
	echo "file exists"
        log_action "Check File: $file (Found)"
    else
        log_action "Check File: $file (Not Found)"
	echo "File not found."
    fi
}

check_Directory() {
	local dir
	read -p "Enter Directory path: " dir

    if [[ -d "$dir" ]]; then
        echo "Directory exists."
	log_action "Check Directory: $dir (Found)"
    else
        echo "Directory not found."
	log_action "Check Directory: $dir (Not Found)"
    fi
}

Search_Log() {
	local logfile
	local keyword
	read -p "Enter log file path: " logfile

	if [[ ! -f "$logfile" ]]; then
   		 echo "Log file not found."
    		return
	fi

        read -p "Enter search word: " keyword

        	if grep -q  "$keyword" "$logfile"
		then
			grep "$keyword" "$logfile"
			log_action "Search Log: '$keyword' (Found)"
		else
			echo "No matches found."
   			 log_action "Search Log: '$keyword' (Not Found)"
		fi
}

Backup_Directory() {
    local source
    local backup_name

    read -p "Enter source directory: " source

    if [[ ! -d "$source" ]]; then
        echo "Source directory not found."
        log_action "Backup failed: Source directory not found ($source)"
        return 1
    fi

    mkdir -p "$BACKUP_DIR"

    backup_name="$(basename "$source")_$(date +%Y%m%d_%H%M%S).tar.gz"

    if tar -czf "$BACKUP_DIR/$backup_name" "$source"; then
        echo "Backup completed."
        echo "Backup saved to: $BACKUP_DIR/$backup_name"
        log_action "Backup completed: $BACKUP_DIR/$backup_name"
    else
        echo "Backup failed."
        log_action "Backup failed: $source"
        return 1
    fi
}
while true
do
	clear
	echo "====================================="
	echo "      Linux Admin Toolkit"
	echo "====================================="
	echo "1. Show Date"
	echo "2. Show Hostname"
	echo "3. Show Current User"
	echo "4. Show Current Directory"
	echo "5. Show Disk Usage"
	echo "6. Show Memory Usage"
	echo "7. Show CPU Usage"
	echo "8. Show IP Address"
	echo "9. Check File"
	echo "10.Check Directory"
	echo "11.Search in Log"
	echo "12.Backup Directory"
	echo "13.Exit"
	echo "====================================="
	read -p "Enter your choice: " choice
	echo "====================================="
	case $choice in
	 1)
        	show_Date
        	;;
    	2)
        	show_Hostname
       		 ;;
    	3)
        	show_User
        	;;
    	4)
        	show_Directory
        	;;
    	5)
        	show_Disk
        	;;
    	6)
        	show_Memory
        	;;
    	7)
        	show_CPU
        	;;
    	8)
        	show_IP
        	;;
    	9)
        	check_File
        	;;
    	10)
        	check_Directory
        	;;
    	11)
        	Search_Log
        	;;
    	12)
        	Backup_Directory
        	;;
    	13)
        	echo "Goodbye!"
		break
        	;;
    	*)
        	echo "Invalid choice! Please enter a number from 1 to 13."
        	;;
	esac
	echo
	read -p "Press Enter to continue..."
done
