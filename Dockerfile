# set base image
FROM node:18-alpine

# set working directory: creates a folder within the container to store the app, can be named anything
WORKDIR /app

# copy app dependencies: package json files ?
COPY package*.json ./

# install app dependencies
RUN npm install

# copy app code to container ?
COPY . ./

# Create a non-root non-system user
RUN adduser -u 1001 -D nodeuser

# Switch to the non-root user
USER nodeuser

# command to run the app
CMD ["node", "app.js"]