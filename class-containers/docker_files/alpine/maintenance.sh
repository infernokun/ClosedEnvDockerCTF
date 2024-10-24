#!/bin/bash

# Log file for storing output
LOG_FILE="/var/log/system_maintenance.log"

# Function to check disk space and log it
check_disk_space() {
    echo "Checking disk space..." | tee -a $LOG_FILE
    df -h | tee -a $LOG_FILE
    echo "Disk space check complete." | tee -a $LOG_FILE
}

# Function to log memory usage
check_memory_usage() {
    echo "Checking memory usage..." | tee -a $LOG_FILE
    free -h | tee -a $LOG_FILE
    echo "Memory usage check complete." | tee -a $LOG_FILE
}

# Function to log system uptime
check_uptime() {
    echo "Checking system uptime..." | tee -a $LOG_FILE
    uptime | tee -a $LOG_FILE
    echo "System uptime check complete." | tee -a $LOG_FILE
}

# Function to clean up logs older than 7 days
cleanup_logs() {
    echo "Cleaning up old logs..." | tee -a $LOG_FILE
    find /var/log -name "*.log" -type f -mtime +7 -exec rm -f {} \;
    echo "Log cleanup complete." | tee -a $LOG_FILE
}

# Function to show network interfaces
check_network() {
    echo "Checking network interfaces..." | tee -a $LOG_FILE
    ip a | tee -a $LOG_FILE
    echo "Network interface check complete." | tee -a $LOG_FILE
}

# Main execution starts here
echo "Starting system maintenance tasks..." | tee -a $LOG_FILE
check_disk_space
check_memory_usage
check_uptime
check_network
cleanup_logs
echo "System maintenance tasks completed!" | tee -a $LOG_FILE
