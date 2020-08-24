# Specify a base image
FROM node:alpine

WORKDIR /usr/app

# Install some depenendencies
COPY ./ ./
RUN npm ci
COPY ./ ./

# Default command
CMD ["npm", "start"]
