FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Go script into the container
COPY main.go .

# Build the Go app
RUN go build -o app .

# Expose port 8080 to the host
EXPOSE 8080

# Run the app
CMD ["./app"]
