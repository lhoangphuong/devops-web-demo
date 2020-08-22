# port used: 443

# build image
docker build -t lhoangphuong/apache-html-web .

# run container
docker run -p 443:80 --name httpd lhoangphuong/apache-html-web