# Use the official Node.js 18 image as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install all dependencies including 'devDependencies' for building TypeScript
RUN npm install

# Copy the rest of your application's code
COPY . .

# Compile TypeScript to JavaScript
RUN npm run build

# Expose port 3000 on which NestJS applications usually run
EXPOSE 3000

# Command to start your application
CMD ["node", "dist/main"]
