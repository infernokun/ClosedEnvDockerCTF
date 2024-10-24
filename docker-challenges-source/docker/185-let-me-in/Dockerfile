# Use a base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the flag.txt file into the container
COPY flag.txt /flag.txt

# Create a non-root user with /sbin/nologin as their shell
RUN adduser -D -s /sbin/nologin restricted_user

# Change ownership of the flag file to the restricted user
RUN chown root:root /flag.txt

# Make the flag.txt file readable by the user
RUN chmod 700 /flag.txt

# Copy the custom entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the user to the restricted user
USER restricted_user

# Set the custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]
