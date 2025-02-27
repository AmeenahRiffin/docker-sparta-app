
# Use Ubuntu as base image
FROM ubuntu:20.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Expose MongoDB port
EXPOSE 27017

# Install necessary packages and MongoDB
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && \
    wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    apt-get install -y mongodb-org && \
    rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# Configure MongoDB to accept connections from any IP
RUN sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf

# Create directory for MongoDB data
RUN mkdir -p /data/db

# Start MongoDB
CMD ["mongod", "--bind_ip_all"]
