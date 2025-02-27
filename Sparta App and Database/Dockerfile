# Use Ubuntu as base image
FROM ubuntu:20.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=3000
ENV DB_HOST=mongodb://localhost:27017/posts

# Expose ports
EXPOSE 27017
EXPOSE 3000

# Install necessary packages, MongoDB, and Node.js
RUN apt-get update && \
    apt-get install -y wget gnupg curl git nginx sudo apt-transport-https ca-certificates && \
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && \
    wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    apt-get install -y mongodb-org && \
    rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Configure MongoDB to accept connections from any IP
RUN sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf

# Create directory for MongoDB data
RUN mkdir -p /data/db

# Install NVM
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=20.16.0
RUN mkdir -p $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION

# Install PM2 globally
RUN npm install -g pm2

# Clone the repository
WORKDIR /app
RUN git clone https://github.com/AmeenahRiffin/tech501-sparta-app/

# Set up the application
WORKDIR /app/tech501-sparta-app/app

# Start MongoDB, nginx, and the Node.js application
CMD ["sh", "-c", "mongod & service nginx start & npm install && node app.js"]