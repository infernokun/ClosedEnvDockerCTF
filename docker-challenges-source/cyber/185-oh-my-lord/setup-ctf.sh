#!/bin/bash

# Ensure we're running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Setup challenges
echo "Setting up CTF challenges..."

# Challenge 1: Flag hidden in crontab
echo "*/5 * * * * root echo 'flag{hidden_in_crontab}'" >> /etc/crontab

# Challenge 2: Suspicious user in /etc/passwd
echo "SGT_WOLF:x:1337:1337:SGT_WOLF:/home/SGT_WOLF:/bin/bash" >> /etc/passwd
mkdir /home/SGT_WOLF && touch /home/SGT_WOLF/.flag
echo 'flag{hidden_in_passwd}' > /home/SGT_WOLF/.flag

# Challenge 3: Hidden flag in a log file
mkdir -p /var/log/secret_logs
echo "flag{hidden_in_logs}" > /var/log/secret_logs/access.log

# Challenge 4: Suspicious root process running in background
cat << 'EOF' > /tmp/suspicious_process.sh
#!/bin/bash

# Check if the flag argument is provided
if [ -z "$1" ]; then
  echo 'Usage: $0 <flag>'
  exit 1
fi

while true; do
  sleep 300
done
EOF

chmod +x /tmp/suspicious_process.sh
bash /tmp/suspicious_process.sh flag{whos_process_is_this} &
sleep 2 && rm /tmp/suspicious_process.sh

# Challenge 5: Compiled C program with flag
cat << 'EOF' > /tmp/flag.c
#include <stdio.h>
#include <string.h>

int main() {
    // encoded flag parts
    char part1[] = {102, 108, 97, 103, 123, 0};
    char part2[] = {111, 98, 102, 117, 115, 99, 97, 116, 101, 100, 0};
    char part3[] = {95, 99, 111, 100, 101, 125, 0}; 
    
    // Create full flag by concatenating parts
    char flag[100]; // Ensure it's large enough to hold the complete flag
    snprintf(flag, sizeof(flag), "%s%s%s", part1, part2, part3);
    
    // Print the flag
    printf("%s\n", flag);
    
    return 0;
}
EOF

# Challenge 6: Flag hidden in environment variables
echo "export SECRET_FLAG=flag{hidden_in_env}" >> /root/.bashrc

# Clear bash history
history -c

echo "CTF challenges setup complete!"
