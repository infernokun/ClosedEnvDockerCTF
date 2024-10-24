# Use a lightweight base image
FROM alpine:latest

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to your script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]