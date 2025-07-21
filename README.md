Receipt Manager demo application

docker build -t receipt-manager . 
docker run -p 8080:80 receipt-manager 
tst: docker run -it receipt-manager sh / # cd /usr/share/nginx/ 
do not forget to set the basePath = 'https://receipt-manager-ji1r.onrender.com'; in the BaseService api.base.service.ts
