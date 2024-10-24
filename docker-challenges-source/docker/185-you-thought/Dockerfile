# Use a base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the flag.txt file into the container
COPY flag.txt /flag.txt

# Change ownership of the flag file to the restricted user
RUN chmod +x /flag.txt

RUN echo "you thought"

CMD ["sh", "-c", "echo 'you thought'"]