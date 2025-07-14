

# Build stage
FROM node:20-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application
RUN npm run gitbuild

# Production stage
FROM nginx:alpine

# Copy built application
COPY --from=build /app/dist/receipt-manager/browser /usr/share/nginx/html

# Copy built common-lib
COPY --from=build /app/dist/common-lib /usr/share/nginx/html/common-lib

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 