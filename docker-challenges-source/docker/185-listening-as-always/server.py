import socket

HOST = '0.0.0.0'  # Listen on all interfaces
PORT = 12345       # Change this to your desired port

# Create a TCP socket
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"Listening on port {PORT}...")
    
    # Accept incoming connections
    while True:
        conn, addr = s.accept()
        with conn:
            print(f"Connected by {addr}")
            conn.sendall(b'flag{in_your_walls}\n')  # Send the flag message
