# port used: 9090
# run container
docker run --name myjenkins -p 9090:8080 -p 50000:50000 -v /var/jenkins_home jenkins