# Start with a basic lightweight image
FROM alpine:latest

# Set a default flag environment variable (optional)
ENV FLAG_VAR=""

# Command to check for the env var and print the flag if it exists
CMD ["sh", "-c", "if [ \"$FLAG_VAR\" = \"flag\" ]; then echo 'ZmxhZ3tpbl9teV9lbnZpcm9ubWVudH0=' | base64 -d; fi; exit;"]
