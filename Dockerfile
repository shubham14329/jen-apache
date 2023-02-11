# Use the official Apache HTTP Server image as the base image
FROM httpd:2.4

# Copy the application files to the image
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# Start the Apache server as the default command
CMD ["httpd-foreground"]
