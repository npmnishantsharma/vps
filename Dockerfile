FROM pterodactyl/web

# Expose ports for Pterodactyl panel and Wings
EXPOSE 80 3347

# Set environment variables
ENV PANEL_URL=http://localhost
ENV MYSQL_DATABASE=pterodactyl
ENV MYSQL_USERNAME=root
ENV MYSQL_PASSWORD=password

# Install Wings automatically during container startup
RUN pterodactyl/wings install
