# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY quest_app/package.json quest_app/package-lock.json ./
RUN npm install --omit=dev

# Copy only necessary files from quest_app
COPY quest_app/src ./src/
COPY quest_app/bin ./bin/

# Set correct ownership and permissions inside the container
RUN chown -R node:node /usr/src/app && chmod -R 755 /usr/src/app

# Switch to the 'node' user
USER node

# Expose the application port
EXPOSE 3000

# Command to start the application
CMD ["node", "src/000.js"]