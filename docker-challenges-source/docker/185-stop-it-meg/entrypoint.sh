#!/bin/sh

# Function to handle the shutdown
shutdown() {
    echo -n "ZmxhZ3tpX3N0b3BwZWRfdGhlX2NvbnRhaW5lcn0K" | base64 -d
    # Add any cleanup commands here
}

# Trap SIGTERM and SIGINT signals to call the shutdown function
trap shutdown SIGTERM SIGINT

# Start the infinite loop in the background
while true; do 
    echo "Sleeping..." 
    sleep 3600 
done &

# Store the PID of the last background command
bg_pid=$!

# Wait for the background process to finish
wait $bg_pid
