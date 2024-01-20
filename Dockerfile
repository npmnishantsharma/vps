FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg2 \
    docker

# Install Gotty
RUN curl -sL https://dl.get-gotty.com | sh

# Expose port 8080 for Gotty
EXPOSE 8080 80 1000 2000 433 5000

# Set the default command to start Gotty
CMD ["gotty", "--once", "--permit-write", "--port", "8080"]
