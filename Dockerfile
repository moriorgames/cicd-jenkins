# Build command:
# docker build -t moriorgames/node-server .
# Run command:
# docker run -td --name node_server -p 8000:8000 moriorgames/node-server
FROM node:4.8.7
MAINTAINER MoriorGames "moriorgames@gmail.com"

# Install packages
RUN         apt-get update
RUN         apt-get update -y
RUN         apt-get upgrade -y
RUN         apt-get install -y vim

# Create Application directory
RUN         mkdir -p /app
COPY        . /app
WORKDIR     /app

# Onbuild commands
ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

RUN npm install && npm cache clean --force

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

EXPOSE 8000

CMD ["npm", "start"]
