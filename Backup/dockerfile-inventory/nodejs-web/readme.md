# port used: 8080

# build image
docker build -t lhoangphuong/simpleweb .

# run container
docker run -p 8080:8080 lhoangphuong/simpleweb