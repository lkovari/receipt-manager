# Receipt Manager Demo Application

## Docker Commands

# Build the Docker image
docker build -t receipt-manager .

# Run the container and map port 8080 to 80
docker run -p 8080:80 receipt-manager

# Test: Open a shell inside the container
docker run -it receipt-manager sh
# Inside container
cd /usr/share/nginx/

# WARNING:
# Do not forget to set the following in BaseService (api.base.service.ts):
basePath = 'https://receipt-manager-ji1r.onrender.com';

# Login
un: suzukigs500f0407@gmail.com pw:AdminAdm1n65

# Swagger Url
https://receipt-manager-ji1r.onrender.com/

# Site
https://receipt-manager-frontend.onrender.com/login