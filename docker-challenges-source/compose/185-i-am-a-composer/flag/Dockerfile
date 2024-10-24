# Start with a basic lightweight image
FROM alpine:latest

# Set a default flag environment variable (optional)
ENV FLAG_VAR=""

# Command to check for the env var and print the flag if it exists
CMD ["sh", "-c", "if [ \"$FLAG_VAR\" = \"flag\" ]; then echo 'ZmxhZ3tpX2RvX3RoZV9jb21wb3Npbmd9' | base64 -d; fi; exit;"]
