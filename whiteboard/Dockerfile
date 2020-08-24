# Specify a base image
FROM node:alpine

WORKDIR /usr/app

# Install some depenendencies
COPY ./whiteboard ./
RUN npm ci

# Default command
CMD ["npm", "start"]
