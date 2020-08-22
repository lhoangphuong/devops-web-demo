# build image
docker -t build lhoangphuong/simpleweb .

# run container
docker run -p 8080:8080 lhoangphuong/simpleweb