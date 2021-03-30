FROM node:12.18.1

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install azure-cli || echo "Installing Azure CLI"

RUN az --version

ENV NODE_ENV=production
RUN npm install -g serverless || echo "Installing sls"

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production
COPY . .