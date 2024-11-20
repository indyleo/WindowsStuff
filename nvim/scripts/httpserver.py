import http.server
import socketserver
import os
import sys

def start_http_server(directory, port=8000):
    os.chdir(directory)
    handler = http.server.SimpleHTTPRequestHandler
    with socketserver.TCPServer(("", port), handler) as httpd:
        print(f"Serving HTTP on port {port} (http://localhost:{port}/) in directory: {os.getcwd()}")
        httpd.serve_forever()

if __name__ == "__main__":
    directory = sys.argv[1] if len(sys.argv) > 1 else "."
    port = int(sys.argv[2]) if len(sys.argv) > 2 else 8000
    start_http_server(directory, port)
