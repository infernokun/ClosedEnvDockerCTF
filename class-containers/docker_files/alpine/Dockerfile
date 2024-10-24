FROM alpine:latest

# Set the working directory
WORKDIR /usr/local/bin

# Copy the bash script into the container
COPY maintenance.sh .

# Make the script executable
RUN chmod +x maintenance.sh

# Run the shell script using /bin/sh
CMD ["/bin/sh", "./maintenance.sh"]
