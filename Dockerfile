FROM node:12.22.1

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y zip unzip
RUN apt-get install -y jq
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install pip typing
RUN pip3 install azure-cli || echo "Installing Azure CLI"
RUN az upgrade -y
RUN pip3 install yq

RUN az --version

RUN npm install -g serverless || echo "Installing sls"

RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install azure-functions-core-tools-3