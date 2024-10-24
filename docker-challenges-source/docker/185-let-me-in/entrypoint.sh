#!/bin/sh

# Check if the command is allowed
if [ "$1" = "cat" ] && [ "$2" = "/flag.txt" ]; then
    exec "$@"
else
    echo "Access denied. Hey stop it!"
    tail -f /dev/null
fi
