# Use a base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

COPY flag.txt /flag.txt

# Make the script executable
RUN chmod +r /flag.txt

# Optional: Set the command to keep the container running
CMD ["tail", "-f", "/dev/null"]
