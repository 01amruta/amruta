FROM ubuntu/apache2

# Set ServerName globally to avoid Apache warning
RUN echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf && \
    a2enconf servername

# Enable necessary modules
RUN a2enmod rewrite

# Copy the website files
COPY . /var/www/html/

# Ensure Apache doesn't run in the background (use -D FOREGROUND to keep it running in the foreground)
CMD ["apache2ctl", "-D", "FOREGROUND"]

