FROM debian:oldstable

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
