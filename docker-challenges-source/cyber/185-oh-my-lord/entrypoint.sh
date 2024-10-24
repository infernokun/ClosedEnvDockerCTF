#!/bin/bash

# Run the setup script
/usr/local/bin/setup-ctf.sh

# Start cron service
service cron start

# Keep the container running
exec "$@"
