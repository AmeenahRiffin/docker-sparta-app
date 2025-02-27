FROM ubuntu:20.04

EXPOSE 3000
ENV PORT=3000

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV DB_HOST=mongodb://localhost:27017/posts

# Install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    nginx \
    sudo \
    gnupg \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
    && apt-get install -y nodejs

# Install NVM
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=20.16.0
RUN mkdir -p $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION

# Install MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb \
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb \
    && apt-get install -y mongodb-org \
    && rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb \
    && mkdir -p /data/db

# Install PM2 globally
RUN npm install -g pm2

# Clone the repository
WORKDIR /app
RUN git clone https://github.com/AmeenahRiffin/tech501-sparta-app/

# Set up the application
WORKDIR /app/tech501-sparta-app/app

CMD ["sh", "-c", "mongod & service nginx start & npm install && node app.js"]