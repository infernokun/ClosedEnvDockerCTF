# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the server.py file into the container
COPY server.py .

# Expose the desired port
EXPOSE 12345

# Run the Python server
CMD ["python", "server.py"]
