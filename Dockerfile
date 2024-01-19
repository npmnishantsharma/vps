# Use the Pterodactyl Panel image
FROM ghcr.io/pterodactyl/panel:latest

# Set environment variables
ENV APP_URL=https://pterodactyl.example.com \
    APP_TIMEZONE=UTC \
    APP_SERVICE_AUTHOR=noreply@example.com \
    TRUSTED_PROXIES=* \
    LE_EMAIL="" \
    MAIL_FROM=noreply@example.com \
    MAIL_DRIVER=smtp \
    MAIL_HOST=mail \
    MAIL_PORT=1025 \
    MAIL_USERNAME="" \
    MAIL_PASSWORD="" \
    DB_PASSWORD="CHANGE_ME"

# Expose necessary ports
EXPOSE 80 443

# Set up volumes
VOLUME /app/var/ /etc/nginx/http.d/ /etc/letsencrypt/ /app/storage/logs

# Specify the entry point
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "80"]
