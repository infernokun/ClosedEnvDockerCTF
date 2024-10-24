# Base image
FROM ubuntu:latest

# Prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list, fix dependencies, install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cron \
    sudo \
    netcat-openbsd \
    vim \
    curl \
    python3 \
    gcc \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for placing flags and challenges
RUN useradd -m -s /bin/bash ctfadmin && echo 'ctfadmin:ctfadmin123' | chpasswd && usermod -aG sudo ctfadmin
RUN useradd -m -s /bin/bash ctfguy && echo 'ctfguy:ctfguy123' | chpasswd && usermod -aG sudo ctfguy

# Copy the setup script
COPY setup-ctf.sh /usr/local/bin/setup-ctf.sh
RUN chmod +x /usr/local/bin/setup-ctf.sh

# Create an entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
