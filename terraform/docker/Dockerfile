# Use official Node.js image as a base
FROM node:14

# Set working directory
WORKDIR /app

# Copy application code to container
COPY . .

# Install dependencies
RUN npm install

# Expose the port your app will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
