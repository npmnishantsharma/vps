FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release

# Add Microsoft's GPG key
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg

# Add the VS Code repository
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# Update package lists and install VS Code
RUN apt-get update && apt-get install -y code

# Expose the VS Code port
EXPOSE 3000

# Start the VS Code Server
CMD ["code-server", "--auth", "none", "--host", "0.0.0.0", "--port", "3000"]
