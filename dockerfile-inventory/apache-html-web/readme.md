# port used: 8080

# build image
docker build -t lhoangphuong/apache-html-web .

# run container
docker run -p 8080:80 --name httpd lhoangphuong/apache-html-web