import http.server
import socketserver
import os
import sys

PORT = 8000

# Start the HTTP server
def start_server(directory):
    # Change to the specified directory
    os.chdir(directory)
    
    handler = http.server.SimpleHTTPRequestHandler
    with socketserver.TCPServer(("", PORT), handler) as httpd:
        print(f"Serving HTTP on port {PORT} from {directory}")
        httpd.serve_forever()

if __name__ == "__main__":
    # Check if a directory argument is provided
    if len(sys.argv) != 2:
        print("Usage: python3 script.py <directory>")
        sys.exit(1)

    directory = sys.argv[1]

    # Ensure the directory exists
    if not os.path.isdir(directory):
        print(f"The specified directory does not exist: {directory}")
        sys.exit(1)

    start_server(directory)
