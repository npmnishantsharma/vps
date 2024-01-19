# Use an official Ubuntu as a base image
FROM ubuntu:20.04

# Update and install dependencies
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl zip unzip tar

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Download and install Pterodactyl Panel
WORKDIR /var/www
RUN curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
RUN tar --strip-components=1 -xzvf panel.tar.gz

# Create necessary directories
RUN mkdir -p storage/bootstrap/cache

# Apply permissions using find
RUN find storage bootstrap -type f -exec chmod 644 {} \; && \
    find storage bootstrap -type d -exec chmod 755 {} \; && \
    chown -R www-data:www-data /var/www

# Install Composer dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

# Expose necessary ports
EXPOSE 8080

# Install the Pterodactyl CLI tool
RUN curl -Lo /usr/local/bin/pterodactyl https://github.com/pterodactyl/panel/releases/latest/download/pterodactyl
RUN chmod +x /usr/local/bin/pterodactyl

# Set the CMD to create a user when the container starts
CMD ["pterodactyl", "user:create", "--email=user@example.com", "--username=myusername", "--name=Full Name", "--password=mypassword", "--language=en"]
