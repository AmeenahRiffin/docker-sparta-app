FROM ubuntu:20.04
# Expose port 80
EXPOSE 80
# Install nginx, sudo and systemctl
RUN apt-get update && apt-get install -y nginx sudo systemctl

WORKDIR /var/www/html

# Create index.html with Lorem Ipsum
RUN echo '<!DOCTYPE html>\n\
<html>\n\
<head>\n\
    <title>Lorem Ipsum</title>\n\
</head>\n\
<body>\n\
    <h1>Lorem Ipsum</h1>\n\
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\
</body>\n\
</html>' > index.html
# Enable and start nginx
RUN systemctl enable nginx
CMD ["nginx", "-g", "daemon off;"]