FROM node:12.18.1

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install azure-cli || echo "Installing Azure CLI"

RUN az --version

RUN npm install -g serverless || echo "Installing sls"
