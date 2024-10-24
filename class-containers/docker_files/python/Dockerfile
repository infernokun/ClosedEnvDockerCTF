FROM python:3.9-slim

# Set metadata as described above
LABEL maintainer="your_email@example.com" \
    version="1.0" \
    description="A simple calculator application in Python"

# Set environment variables
ENV CALC_MODE="simple" \
    APP_PORT=5000

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY app.py .

# Create a volume for storing calculator logs
VOLUME ["/app/logs"]

# Expose the application port
EXPOSE 5000

# Entry point for the container
ENTRYPOINT ["python", "app.py"]
